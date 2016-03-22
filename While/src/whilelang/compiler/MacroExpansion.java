// This file is part of the WhileLang Compiler (wlc).
//
// The WhileLang Compiler is free software; you can redistribute
// it and/or modify it under the terms of the GNU General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
//
// The WhileLang Compiler is distributed in the hope that it
// will be useful, but WITHOUT ANY WARRANTY; without even the
// implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
// PURPOSE. See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with the WhileLang Compiler. If not, see
// <http://www.gnu.org/licenses/>
//
// Copyright 2013, David James Pearce.

package whilelang.compiler;

import static whilelang.util.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import whilelang.ast.*;
import whilelang.ast.WhileFile.Decl;
import whilelang.compiler.Lexer.Identifier;
import whilelang.util.Pair;
import whilelang.util.SyntacticElement;
import static whilelang.util.SyntaxError.*;

/**
 * <p>
 * Responsible for ensuring that all types are used appropriately. For example,
 * that we only perform arithmetic operations on arithmetic types; that we only
 * access fields in records guaranteed to have those fields, etc.
 * </p>
 * 
 * @author David J. Pearce
 * 
 */
public class MacroExpansion {
	private WhileFile file;
	private WhileFile.MethodDecl method;
	private HashMap<String,WhileFile.MethodDecl> methods;
	private HashMap<String,WhileFile.TypeDecl> types; 
	private HashMap<String,WhileFile.MacroDecl> macros; 

	
	public WhileFile check(WhileFile wf) {
		this.file = wf;

		this.methods = new HashMap<String,WhileFile.MethodDecl>();
		this.types = new HashMap<String,WhileFile.TypeDecl>();
		this.macros = new HashMap<String,WhileFile.MacroDecl>();
		
		for(WhileFile.Decl declaration : wf.declarations) {
			if(declaration instanceof WhileFile.MethodDecl) {
				WhileFile.MethodDecl fd = (WhileFile.MethodDecl) declaration;
				this.methods.put(fd.name(), fd);
			} else if(declaration instanceof WhileFile.TypeDecl) {
				WhileFile.TypeDecl fd = (WhileFile.TypeDecl) declaration;
				this.types.put(fd.name(), fd);
			} else if(declaration instanceof WhileFile.MacroDecl) {
				WhileFile.MacroDecl fd = (WhileFile.MacroDecl) declaration;
				this.macros.put(fd.name(), fd);
			}
		}
				
		ArrayList<WhileFile.Decl> decls = new ArrayList<WhileFile.Decl>();
		
		for(WhileFile.Decl declaration : wf.declarations) {
			if(declaration instanceof WhileFile.MethodDecl) {
				decls.add(check((WhileFile.MethodDecl) declaration));
			}else{
				decls.add(declaration);
			}
		}

		return new WhileFile(wf.filename,decls);
	}
	
	public WhileFile.MethodDecl check(WhileFile.MethodDecl fd) {
		this.method = fd;
		// First, initialise the typing environment
		HashMap<String,Type> environment = new HashMap<String,Type>();
		for (WhileFile.Parameter p : fd.getParameters()) {
			environment.put(p.name(), p.getType());
		}

		Attribute[] att = new Attribute[fd.attributes().size()];
		fd.attributes().toArray(att); // fill the array
				
		return new WhileFile.MethodDecl(fd.getName(), fd.getRet(), fd.getParameters(), check(fd.getBody(),environment), AttributesAsArray(fd.attributes()));
	}
	
	public Attribute[] AttributesAsArray(List<Attribute> attributes){
		Attribute[] att = new Attribute[attributes.size()];
		attributes.toArray(att);
		return att;
	}
	
	public List<Stmt> check(List<Stmt> statements, Map<String,Type> environment) {
		List<Stmt> expandedStatements = new ArrayList<Stmt>();
		for(Stmt s : statements) {			
			expandedStatements.add(check(s,environment));
		}
		return expandedStatements;
	}
	
	public Stmt check(Stmt stmt, Map<String,Type> environment) {
		if(stmt instanceof Stmt.Assert) {
			return check((Stmt.Assert) stmt, environment);
		} else if(stmt instanceof Stmt.Assign) {
			return check((Stmt.Assign) stmt, environment);
		} else if(stmt instanceof Stmt.Print) {
			return check((Stmt.Print) stmt, environment);
		} else if(stmt instanceof Stmt.Return) {
			return check((Stmt.Return) stmt, environment);
		} else if(stmt instanceof Stmt.Break) {
			// nothing to do
		} else if(stmt instanceof Stmt.Continue) {
			// nothing to do
		} else if(stmt instanceof Stmt.VariableDeclaration) {
			check((Stmt.VariableDeclaration) stmt, environment);
		} else if(stmt instanceof Expr.Invoke) {
//			check((Expr.Invoke) stmt, environment);
		} else if(stmt instanceof Stmt.IfElse) {
			return check((Stmt.IfElse) stmt, environment);
		} else if(stmt instanceof Stmt.For) {
			check((Stmt.For) stmt, environment);
		} else if(stmt instanceof Stmt.While) {
			check((Stmt.While) stmt, environment);
		} else if(stmt instanceof Stmt.DoWhile) {
			check((Stmt.DoWhile) stmt, environment);
		} else if(stmt instanceof Stmt.Switch) {
			return check((Stmt.Switch) stmt, environment);
		} else {
			internalFailure("unknown statement encountered (" + stmt + ")", file.filename,stmt);
		}
		return stmt;
	}
	

	public void check(Stmt.VariableDeclaration stmt, Map<String,Type> environment) {
//		if(environment.containsKey(stmt.getName())) {
//			syntaxError("variable already declared: " + stmt.getName(),
//					file.filename, stmt);
//		} else if(stmt.getExpr() != null) {
//			Type type = check(stmt.getExpr(),environment);
//			checkSubtype(stmt.getType(),type,stmt.getExpr());
//		}
//		environment.put(stmt.getName(), stmt.getType());
	}
	
	public Stmt.Assert check(Stmt.Assert stmt, Map<String,Type> environment) {
		if(stmt.getExpr() != null) {
			return new Stmt.Assert(check(stmt.getExpr(),environment), stmt.attributes());
		}
		return stmt;
	}
	
	
	public Stmt.Assign check(Stmt.Assign stmt, Map<String,Type> environment) {
		return new Stmt.Assign((Expr.LVal)check(stmt.getLhs(),environment), check(stmt.getRhs(),environment), stmt.attributes());
//		Type lhs = check(stmt.getLhs(),environment);
//		Type rhs = check(stmt.getRhs(),environment);
//		// Make sure the type being assigned is a subtype of the destination
//		checkSubtype(lhs,rhs,stmt.getRhs());
	}
	
	public Stmt.Print check(Stmt.Print stmt, Map<String,Type> environment) {
		if(stmt.getExpr() != null) {
			return new Stmt.Print(check(stmt.getExpr(),environment), stmt.attributes());
		}
		return stmt;
		// For print statements, the right hand side can have any type.
	}
	
	public Stmt.Return check(Stmt.Return stmt, Map<String, Type> environment) {
		if(stmt.getExpr() != null) {
			return new Stmt.Return(check(stmt.getExpr(),environment), stmt.attributes());
		}
		return stmt;
	}
	
	public Stmt.IfElse check(Stmt.IfElse stmt, Map<String,Type> environment) {
		if(stmt.getCondition() != null) {
			return new Stmt.IfElse(check(stmt.getCondition(),environment), check(stmt.getTrueBranch(), environment), check(stmt.getFalseBranch(),environment), stmt.attributes());
		}
		return stmt;
	}
	
	public void check(Stmt.For stmt, Map<String,Type> environment) {
//
//		Stmt.VariableDeclaration vd = stmt.getDeclaration();
//		check(vd,environment);
//		
//		// Clone the environment in order that the loop variable is only scoped
//		// for the life of the loop itself.
//		environment = new HashMap<String,Type>(environment);
//		environment.put(vd.getName(), vd.getType());
//		
//		Type ct = check(stmt.getCondition(),environment);
//		// Make sure condition has bool type
//		checkInstanceOf(ct,stmt.getCondition(),Type.Bool.class);		
//		check(stmt.getIncrement(),environment);
//		check(stmt.getBody(),environment);
	}
	
	public void check(Stmt.While stmt, Map<String,Type> environment) {
//		Type ct = check(stmt.getCondition(),environment);
//		// Make sure condition has bool type
//		checkInstanceOf(ct,stmt.getCondition(),Type.Bool.class);
//		check(stmt.getBody(),environment);
	}
	
	public void check(Stmt.DoWhile stmt, Map<String,Type> environment) {
//		Type ct = check(stmt.getCondition(),environment);
//		// Make sure condition has bool type
//		checkInstanceOf(ct,stmt.getCondition(),Type.Bool.class);
//		check(stmt.getBody(),environment);
	}
	
	public Stmt.Switch check(Stmt.Switch stmt, Map<String,Type> environment) {
		if(stmt.getExpr()!=null){
			List<Stmt.Case> cases = new ArrayList<Stmt.Case>();
			for(Stmt.Case c : stmt.getCases()) {
				cases.add(new Stmt.Case((Expr.Constant)check(c.getValue(),environment), check(c.getBody(),environment), c.attributes()));
			}
			return new Stmt.Switch(check(stmt.getExpr(),environment), cases, stmt.attributes());
		}
		return stmt;
	}
	
	public Expr check(Expr expr, Map<String,Type> environment) {
		if(expr instanceof Expr.Invoke) {	
			Expr.Invoke invoke = (Expr.Invoke) expr;
			if(macros.keySet().contains(invoke.getName())){
				HashMap<String, Expr> map = new HashMap<String, Expr>();

				for (int i = 0; i < invoke.getArguments().size(); i++){
					map.put(macros.get(invoke.getName()).getMacroParameters().get(i).text, invoke.getArguments().get(i));
				}
				Expr e =  check(macros.get(invoke.getName()).getExpr(), environment);
				if(e instanceof Expr.Binary){
					Expr.Binary b = (Expr.Binary) e;
					Expr lhs = b.getLhs();
					Expr rhs = b.getRhs();
					if(lhs instanceof Expr.Variable){
						if(map.containsKey(((Expr.Variable) lhs).getName())){
							lhs = map.get(((Expr.Variable) lhs).getName());
						}
					} 
					if(rhs instanceof Expr.Variable){
						if(map.containsKey(((Expr.Variable) rhs).getName())){
							rhs = map.get(((Expr.Variable) rhs).getName());
						}
					} 
					return new Expr.Binary(b.getOp(), lhs, rhs, b.attributes());
				}else if (e instanceof Expr.Constant){
					return e;
				}else if (e instanceof Expr.Unary){
					Expr.Unary u = (Expr.Unary) e;
					Expr exp = u.getExpr();
					if(exp instanceof Expr.Variable){
						if(map.containsKey(((Expr.Variable) exp).getName())){
							exp = map.get(((Expr.Variable) exp).getName());
						}
					}					
					return new Expr.Unary(u.getOp(), check(exp,environment), this.AttributesAsArray(u.attributes()));
				}	
			}
		} else if (expr instanceof Expr.Binary){
			Expr.Binary b = (Expr.Binary) expr;
			return new Expr.Binary(b.getOp(), check(b.getLhs(),environment), check(b.getRhs(),environment), b.attributes());
		} else if (expr instanceof Expr.ArrayInitialiser){
			Expr.ArrayInitialiser ai = (Expr.ArrayInitialiser) expr;
			ArrayList<Expr> exps = new ArrayList<Expr>();
			for(Expr e:((Expr.ArrayInitialiser) expr).getArguments()){
				exps.add(check(e,environment));
			}
			return new Expr.ArrayInitialiser(exps, this.AttributesAsArray(ai.attributes()));
		} else if (expr instanceof Expr.RecordConstructor){
			Expr.RecordConstructor rc = (Expr.RecordConstructor) expr;
			ArrayList<Pair<String, Expr>> fields = new ArrayList<Pair<String, Expr>>();
			for(Pair<String, Expr> p:rc.getFields()){
				fields.add(new Pair<String,Expr>(p.first(),check(p.second(),environment)));
			}
			return new Expr.RecordConstructor(fields, this.AttributesAsArray(rc.attributes()));
		} 		
		return expr;
	}
	
	public Type check(Expr.IndexOf expr, Map<String, Type> environment) {
//		Type srcType = check(expr.getSource(), environment);
//		Type indexType = check(expr.getIndex(), environment);
//		// Make sure index has integer type
//		checkInstanceOf(indexType, expr.getIndex(), Type.Int.class);
//		// Check src has array type (of some kind)
//		srcType = checkInstanceOf(srcType, expr.getSource(), Type.Array.class,
//				Type.Strung.class);
//		return ((Type.Array) srcType).getElement();
		return null;
	}
	
	
	
	public Type check(Expr.ArrayGenerator expr, Map<String, Type> environment) {
		return null;
//		Type element = check(expr.getValue(), environment);
//		Type size = check(expr.getSize(), environment);
//		// Check size expression has int type
//		checkInstanceOf(size,expr.getSize(),Type.Int.class);
//		return new Type.Array(element);
	}

	
	public Type check(Expr.RecordAccess expr, Map<String, Type> environment) {
//		Type srcType = check(expr.getSource(), environment);
//		// Check src has record type
//		Type.Record recordType = (Type.Record) checkInstanceOf(srcType, expr.getSource(), Type.Record.class);
//		for (Pair<Type, String> field : recordType.getFields()) {
//			if (field.second().equals(expr.getName())) {
//				return field.first();
//			}
//		}
//		// Couldn't find the field!
//		syntaxError("expected type to contain field: " + expr.getName(), file.filename, expr);
		return null; // deadcode
	}
}
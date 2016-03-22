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

//		System.out.print("macros:"+macros.size());
		
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
		
//		System.out.println("-"+macros.size()+":"+macros.keySet());
		
		ArrayList<WhileFile.Decl> decls = new ArrayList<WhileFile.Decl>();
		
		for(WhileFile.Decl declaration : wf.declarations) {
			if(declaration instanceof WhileFile.MethodDecl) {
				decls.add(check((WhileFile.MethodDecl) declaration));
			}else{
				decls.add(declaration);
			}
		}
//		return wf;
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
				
//		return fd;
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
		System.out.println("stmt:"+stmt);
		if(stmt instanceof Stmt.Assert) {
			return check((Stmt.Assert) stmt, environment);
		} else if(stmt instanceof Stmt.Assign) {
			check((Stmt.Assign) stmt, environment);
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
			check((Expr.Invoke) stmt, environment);
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
	
	
	public void check(Stmt.Assign stmt, Map<String,Type> environment) {
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
				System.err.println(e.getClass());
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
						System.out.println("rhs"+rhs);
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
				
//			return new Expr.Invoke(invoke.getName(), invoke.getArguments(), AttributesAsArray(invoke.attributes()));
			
//		if(expr instanceof Expr.Binary) {
//			Expr.Binary binary = (Expr.Binary) expr;
//			System.out.println("Binary");
//			return new Expr.Binary(binary.getOp(), check(binary.getLhs(), environment), check(binary.getRhs(), environment), binary.attributes());
////			Type leftType = check(expr.getLhs(), environment);
////			Type rightType = check(expr.getRhs(), environment);
////			check((Expr.Binary) expr, environment);
//		} else if(expr instanceof Expr.Constant) {
//			System.out.println("Constant:"+expr);
//
////			check((Expr.Constant) expr, environment);
//		} else if(expr instanceof Expr.IndexOf) {
////			check((Expr.IndexOf) expr, environment);
//		} else if(expr instanceof Expr.Invoke) {
//			
//			Expr.Invoke invoke = (Expr.Invoke) expr;
//			if(macros.keySet().contains(invoke.getName())){
//				Expr e = check(macros.get(invoke.getName()).getExpr(), environment);
//				if(e instanceof Expr.Binary){
//					(Expr.Binary) ((Expr.Binary) e).getLhs()
//					System.out.println(e);
//				}
//
//			}
//			
////			return new Expr.Invoke(invoke.getName(), invoke.getArguments(), AttributesAsArray(invoke.attributes()));
//			
//		} else if(expr instanceof Expr.ArrayGenerator) {
////			check((Expr.ArrayGenerator) expr, environment);
//		} else if(expr instanceof Expr.ArrayInitialiser) {
////			check((Expr.ArrayInitialiser) expr, environment);
//		} else if(expr instanceof Expr.RecordAccess) {
////			check((Expr.RecordAccess) expr, environment);
//		} else if(expr instanceof Expr.RecordConstructor) {
////			check((Expr.RecordConstructor) expr, environment);
//		} else if(expr instanceof Expr.Unary) {
////			check((Expr.Unary) expr, environment);
//		} else if(expr instanceof Expr.Variable) {
//			System.out.println("Variable:"+expr);
////			check((Expr.Variable) expr, environment);
//		} 
//		else {
//			internalFailure("unknown expression encountered (" + expr + ")", file.filename,expr);
//			return null; // dead code
//		} 
//		
//		// Save the type attribute so that subsequent compiler stages can use it
//		// without having to recalculate it from scratch.
//		expr.attributes().add(new Attribute.Type(type));
		
		return expr;
	}
	
	
	public Type check(Expr.Constant expr, Map<String,Type> environment) {
		return typeOf(expr.getValue(),expr);
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
	
	public Type check(Expr.Invoke expr, Map<String,Type> environment) {
		
//		if(macros.keySet().contains(expr.getName())){
//			expr = macros.get(expr.getName()).getExpr();
////			System.out.println(macros.get(expr.getName()).getExpr());
//		}
//		
		WhileFile.MacroDecl mn = macros.get(expr.getName());
		
//		System.out.println(expr.getName());
//		System.out.println(mn);
//		WhileFile.MethodDecl fn = methods.get(expr.getName());
//		List<Expr> arguments = expr.getArguments();
//		List<WhileFile.Parameter> parameters = fn.getParameters();
//		if(arguments.size() != parameters.size()) {
//			syntaxError("incorrect number of arguments to function",
//					file.filename, expr);
//		}
//		
//		for(int i=0;i!=parameters.size();++i) {
//			Type argument = check(arguments.get(i),environment);
//			Type parameter = parameters.get(i).getType();
//			// Check supplied argument is subtype of declared parameter
//			checkSubtype(parameter,argument,arguments.get(i));
//		}
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
	
	public Type check(Expr.RecordConstructor expr, Map<String, Type> environment) {
		return null;
//		List<Pair<String, Expr>> arguments = expr.getFields();
//		List<Pair<Type, String>> types = new ArrayList<Pair<Type, String>>();
//
//		for (Pair<String, Expr> p : arguments) {
//			Type t = check(p.second(), environment);
//			types.add(new Pair<Type, String>(t, p.first()));
//		}
//
//		return new Type.Record(types);
	}
	
	public Type check(Expr.Unary expr, Map<String,Type> environment) {
		return null;
//		Type type = check(expr.getExpr(), environment);
//		switch(expr.getOp()) {
//		case NEG:
//			checkInstanceOf(type,expr.getExpr(),Type.Int.class);			
//			return type;
//		case NOT:
//			checkInstanceOf(type,expr.getExpr(),Type.Bool.class);
//			return type;			
//		case LENGTHOF:
//			checkInstanceOf(type,expr.getExpr(),Type.Array.class,Type.Strung.class);
//			return new Type.Int();
//		default:
//			internalFailure("unknown unary expression encountered (" + expr + ")", file.filename,expr);
//			return null; // dead code
//		}
	}
	
	public Type check(Expr.Variable expr, Map<String, Type> environment) {
		Type type = environment.get(expr.getName());
		if (type == null) {
			syntaxError("unknown variable encountered: " + expr.getName(),
					file.filename, expr);
		}
		return type;
	}
	
	/**
	 * Determine the type of a constant value
	 * 
	 * @param constant
	 * @param elem
	 * @return
	 */
	private Type typeOf(Object constant, SyntacticElement elem) {
		if (constant instanceof Boolean) {
			return new Type.Bool();
		} else if (constant instanceof Character) {
			return new Type.Char();
		} else if (constant instanceof Integer) {
			return new Type.Int();
		} else if (constant instanceof String) {
			return new Type.Strung();
		} else if (constant instanceof ArrayList) {
			ArrayList<Object> list = (ArrayList) constant;
			ArrayList<Type> types = new ArrayList<Type>();
			for(Object o : list) {
				types.add(typeOf(o,elem));
			}
			Type lub = leastUpperBound(types,elem);
			return new Type.Array(lub);
		} else if (constant instanceof HashMap) {
			HashMap<String, Object> record = (HashMap<String, Object>) constant;
			ArrayList<Pair<Type, String>> fields = new ArrayList<Pair<Type, String>>();
			// FIXME: there is a known bug here related to the ordering of
			// fields. Specifically, we've lost information about the ordering
			// of fields in the original source file and we are just recreating
			// a random order here.
			for (Map.Entry<String, Object> e : record.entrySet()) {
				Type t = typeOf(e.getValue(), elem);
				fields.add(new Pair<Type, String>(t, e.getKey()));
			}
			return new Type.Record(fields);
		} else {
			internalFailure("unknown constant encountered (" + elem + ")", file.filename, elem);
			return null; // dead code
		}
	}
	
	private Type leastUpperBound(List<Type> types, SyntacticElement elem) {
		Type lub = new Type.Void();
		for (Type t : types) {
			if (isSubtype(t, lub, elem)) {
				lub = t;
			} else {
				checkSubtype(lub, t, elem);
			}
		}
		return lub;
	}
	
	/**
	 * Check that a given type t2 is an instance of of another type t1. This
	 * method is useful for checking that a type is, for example, a List type.
	 * 
	 * @param t1
	 * @param type
	 * @param element
	 *            Used for determining where to report syntax errors.
	 * @return
	 */
	public Type checkInstanceOf(Type type,
			SyntacticElement element, Class<?>... instances) {		

		if(type instanceof Type.Named) {
			Type.Named tn = (Type.Named) type;
			if (types.containsKey(tn.getName())) {
				Type body = types.get(tn.getName()).getType();
				return checkInstanceOf(body, element, instances);
			} else {
				syntaxError("unknown type encountered: " + type, file.filename,
						element);
			}
		} 		
		for (Class<?> instance : instances) {
			if (instance.isInstance(type)) {
				// This cast is clearly unsafe. It relies on the caller of this
				// method to do the right thing.
				return type;
			} 
		}
		
		// Ok, we're going to fail with an error message. First, let's build up
		// a useful human-readable message.
		
		String msg = "";
		boolean firstTime = true;
		for (Class<?> instance : instances) {
			if(!firstTime) {
				msg = msg + " or ";
			}
			firstTime=false;
			
			if (instance.getName().endsWith("Bool")) {
				msg += "bool";
			} else if (instance.getName().endsWith("Char")) {
				msg += "char";
			} else if (instance.getName().endsWith("Int")) {
				msg += "int";
			} else if (instance.getName().endsWith("Strung")) {
				msg += "string";
			} else if (instance.getName().endsWith("Array")) {
				msg += "array";
			} else if (instance.getName().endsWith("Record")) {
				msg += "record";
			} else {
				internalFailure("unknown type instanceof encountered ("
						+ instance.getName() + ")", file.filename, element);
				return null;
			}
		}
		
		syntaxError("expected instance of " + msg + ", found " + type,
				file.filename, element);
		return null;
	}
	
	/**
	 * Check that a given type t2 is a subtype of another type t1.
	 * 
	 * @param t1
	 *            Supertype to check
	 * @param t2
	 *            Subtype to check
	 * @param element
	 *            Used for determining where to report syntax errors.
	 */
	public void checkSubtype(Type t1, Type t2, SyntacticElement element) {
		if(!isSubtype(t1,t2,element)) {
			syntaxError("expected type " + t1 + ", found " + t2, file.filename,
					element);
		}
	}	
	
	/**
	 * Check that a given type t2 is a subtype of another type t1.
	 * 
	 * @param t1
	 *            Supertype to check
	 * @param t2
	 *            Subtype to check
	 * @param element
	 *            Used for determining where to report syntax errors.
	 */
	public boolean isSubtype(Type t1, Type t2, SyntacticElement element) {		
		if (t2 instanceof Type.Void) {
			// OK			
			return true;
		} else if (t1 instanceof Type.Bool && t2 instanceof Type.Bool) {
			// OK		
			return true;
		} else if (t1 instanceof Type.Char && t2 instanceof Type.Char) {
			// OK
			return true;
		} else if (t1 instanceof Type.Int && t2 instanceof Type.Int) {
			// OK
			return true;
		} else if (t1 instanceof Type.Strung && t2 instanceof Type.Strung) {
			// OK
			return true;
		} else if (t1 instanceof Type.Array && t2 instanceof Type.Array) {
			Type.Array l1 = (Type.Array) t1;
			Type.Array l2 = (Type.Array) t2;
			// The following is safe because While has value semantics. In a
			// conventional language, like Java, this is not safe because of
			// references.
			return isSubtype(l1.getElement(),l2.getElement(),element);
		} else if (t1 instanceof Type.Record && t2 instanceof Type.Record) {
			Type.Record r1 = (Type.Record) t1;
			Type.Record r2 = (Type.Record) t2;
			List<Pair<Type,String>> r1Fields = r1.getFields();
			List<Pair<Type,String>> r2Fields = r2.getFields();
			// Implement "width" subtyping
			if(r1Fields.size() > r2Fields.size()) {
				return false;
			} else {
				for(int i=0;i!=r1Fields.size();++i) {
					Pair<Type,String> p1Field = r1Fields.get(i);
					Pair<Type,String> p2Field = r2Fields.get(i);
					if(!isSubtype(p1Field.first(),p2Field.first(),element)) {
						return false;
					} else if (!p1Field.second().equals(p2Field.second())) {
						return false;
					}
				}
				return true;
			}		
		} else if (t1 instanceof Type.Named) {
			Type.Named tn = (Type.Named) t1;
			if (types.containsKey(tn.getName())) {
				Type body = types.get(tn.getName()).getType();
				return isSubtype(body, t2, element);
			} else {
				syntaxError("unknown type encountered: " + t1, file.filename,
						element);
			}
		} else if (t2 instanceof Type.Named) {
			Type.Named tn = (Type.Named) t2;
			if (types.containsKey(tn.getName())) {
				Type body = types.get(tn.getName()).getType();
				return isSubtype(t1, body, element);
			} else {
				syntaxError("unknown type encountered: " + t2, file.filename,
						element);
			}
		} 		
		return false;		
	}
	
	/**
	 * Determine whether two given types are euivalent. Identical types are always
	 * equivalent. Furthermore, e.g. "int|null" is equivalent to "null|int".
	 * 
	 * @param t1
	 *            first type to compare
	 * @param t2
	 *            second type to compare
	 */
	public boolean equivalent(Type t1, Type t2, SyntacticElement element) {
		return isSubtype(t1,t2,element) && isSubtype(t2,t1,element);
	}		
}

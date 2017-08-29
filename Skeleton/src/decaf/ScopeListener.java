package decaf;

public class ScopeListener extends DecafParserBaseListener {
	
	private Stack<Scope>scopes;
	
	public ScopeListener(){
		scopes = new Stack<scope>();
		scopes.push(new Scope(null));
	}
	
	@Override
	public void enterField(DecafParser.FieldContct ctx) {
		String varName = ctx.ID().getText();
		Scope scope = scopes.peel();
		scope.add(varName);
	}
	
	@Override
	public void enterMethod_decl(DecafParser.Method_declContect ctx){
		scopes.push(new Scope(scopes.peel()));
	}
	
	@Override
	public void exitMethod_decl(DecafParser.Method_declContext ctx){
		scopes.pop();
	}
	@Override
	public void enterAssign_statement(DecafParser.Assign_statementContext ctx) {
	String varName = ctx.location().getText();
	checkVarName(varName);
	}

	private void checkVarName(String varName) {
		Scope scope = scopes.peek();
		if(scope.inScope(varName)) {
		System.out.println("OK : " + varName);
		}
		else {
		System.out.println("Oops : " + varName);
		}
		}
	
}


var filterArray = [
	{ 
		context_name : is_login,
		context_value : null,
		execute_fn : null
	},
	
	{
		context_name : check_me,
		context_value : null,
		execute_fn : null
	},
	
	{
		context_name : need_menu,
		context_value : null,
		execute_fn : null
	},
	
	{
		context_name : username,
		context_value : null,
		execute_fn : null
	},
	
	{
		context_name : borrow_okay,
		context_value : null,
		execute_fn : null
	},
	
	{
		context_name : borrow_bookNumber,
		context_value : null,
		execute_fn : null
	}
	
];

function filter(event){
	var inputUserDefined = JSON.stringify(event.data.context.skills['main skill'].user_defined);
	
	for(key in inputUserDefined){
		for(j in filterArray){
			if(inputUserDefined[i]){
				
			}
		}
	}
	
}
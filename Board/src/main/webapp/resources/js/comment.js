
 var items=new Array();
	var cnt=0;
    
var commentService=(function(){
	
	 function AllRemove()
	 {
		 for(var i=0;i<cnt;i++)
			 {
			 	items[i]=0;
			 }
		 cnt=0;
	 }
	 
	
	function RnoAdd(num)
	{
		 
		items[cnt]=num;
		cnt++;
	}
	
	function RnoRemove(num)
	{
		 
		for(var i=0;i<cnt;i++){
			if(num==items[i])
				{
				
					items[i]=0;
				}
		}
	}
	
	function RnoCheck(num)
	{
	 
	 
		for(var i=0;i<cnt;i++){
			if(num===items[i])
				{ 
					return true;
				}
		}
	 
		return false;
		
	}
	
	
	function getList(rno,callback,error)
	{
		
		$.getJSON("/comments/list/"+rno+".json",function(data){
			
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
		
	}
	
	function remove(dto,callback,error)
	{
			$.ajax({
				type:'delete',
				url:'/comments/'+dto.cno+"/"+dto.name,
				success:function(deleteResult,status,xhr){
					if(callback){
						callback(deleteResult);
					}
				},
				
				error: function(xhr,status,er){
					if(error){
						error(er);
					}
				}
			
			});
		
	}
	
	function update(comment,callback,error)
	{
		$.ajax({
			type:'put',
		    url:'/comments/'+comment.cno,
		    data:JSON.stringify(comment),
		    contentType:"application/json;charset=utf-8",
		    success:function(result,status,xhr){
		    	if(callback)
		    		{
		    		callback(result);
		    		}
		    },
			error : function(xhr,status,er)
			{
				if(error){
					error(er);
				}
			}
		    
		
		});
		
	}
	
	function add(comment,callback,error)
	{
		
		$.ajax({
			
			type:'post',
			url : '/comments/new',
			data:JSON.stringify(comment),
			contentType:"application/json; charset=utf-8",
			success:function(result,status,xhr)
			{
				if(callback)
					{
						callback(result);
					}
			},
			error:function(xhr,status,er)
			{
				if(error){
					error(er);
				}
			}
		 
		})
		 
	}
	
	
	return {getList:getList,
			RnoAdd:RnoAdd,
			RnoRemove:RnoRemove,
			RnoCheck:RnoCheck,
			remove:remove,
			AllRemove:AllRemove,
			update:update,
			add:add};
	
	
	
	
	
	
})();
 

	 
function valthisform()
			{   let checkboxs=document.getElementsByName("primarykey");
			    let okay=false;
			    for(var i=0,l=checkboxs.length;i<l;i++)
			    {
			        if(checkboxs[i].checked)
			        {
			        	button.type = "submit";
			            okay=true;
			            break;
			        }
			    }
			    if(!okay)alert("Please check a checkbox or more or add a field in the table");
			}
const button = document.querySelector('button');
button.addEventListener("click", valthisform);
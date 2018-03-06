/******************************************************************************
 DESCRIPTION   : Common Javascript
 PARAMETER     :
 RETURNVALUE   :
 HISTORY
 ******************************************************************************
 DATE          DEVELOFER          DESCRIPTION
 ==============================================================================
 2013.05.14    LEE HWANHO 
 ******************************************************************************/

//사번 유효성 체크
function sabunCheck(sabun){
	//사번 체크(숫자만입력)
	var number = '0123456789';
	var temp;
	
	for (var i=0; i<sabun.length; i++) 
	{ 
		  temp = '' + sabun.substring(i, i+1); 
		  if (number.indexOf(temp) == "-1") {			  
			  return false;
		}
	 }
	return true;
}

//Email 주소 유효성 체크
function isEMailAddr(email) {
	console.log("email 주소 : "+email);
	var str = email;
    var re = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
    if (!str.match(re)) {
        alert("유효한 E-Mail 주소를 입력 해주세요.");
        //setTimeout("focusElement('" + email.form.name + "', '" + email.name + "')", 0);
        return false;
    } else {
        return true;
    }
}
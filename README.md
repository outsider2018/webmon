1. WAS에 embedded한 Derby DB를 기동 시 WAS 기동 스크립트에 아래 옵션을 꼭 추가해 주세요. Derby DB의 home 위치 지정 옵션입니다.
   아래와 같이 설정 시 아래 폴더 아래에서 MonDB Data file folder을 찾게 됩니다.
  -Dderby.system.home="D:\workspace-oxygen\webmon\WebContent\derby"
  
2. WAS와 별도로 Derby DB server를 기동 시 다음 설정 필요

	2.1 시스템 환경 변수에 아래 변수를 설정해 주세요.
	  Windows)
		DERBY_HOME=D:\workspace-oxygen\webmon\WebContent\derby

	  Unix, Linux)
		export DERBY_HOME=/app/mw/webmon/derby
	
	2.2 DERBY_HOME/bin 폴더의 기동 스크립트에 다음 설정 추가
	  Windows)
		"%CLASSPATH%;%LOCALCLASSPATH%" -Dderby.system.home=D:\workspace-oxygen\webmon\WebContent\derby

	  Unix, Linux)
		"%CLASSPATH%;%LOCALCLASSPATH%" -Dderby.system.home=/app/mw/webmon/derby

3. derby ij 툴 이용 시 접속 URL
   cd %DERBY_HOME%\bin
   >ij   
   ij>connect 'jdbc:derby://localhost:1527/MonDB;create=false';	

4. log4j properties 위치 설정 옵션입니다.
-Dlog4j.configuration="file:/D:\workspace-oxygen\webmon\WebContent\WEB-INF\properties\log4j.properties"
function karate_config() {
	var config = {
		baseUrl : 'https://reqres.in',
	}
	var env = karate.env
	karate.log("Environment variable value is --- ",env)
	//--Runner for cucumber by default only using in local--//
	if(!env){
	   env = 'env_staging';
	}
	if (env==='env_staging') {
		config.baseUrl = 'https://reqres.in';
		var auth = karate.callSingle('classpath:00_Auth/00_login.feature', config);
		config.token = auth.token
	}
	else if (env==='env_prod'){
    	config.baseUrl = 'https://reqres.in';
        var auth = karate.callSingle('classpath:00_Auth/00_login.feature', config);
        config.token = auth.token
    }

    karate.configure('connectTimeout', 50000);
    karate.configure('readTimeout', 50000);
	return config;
}
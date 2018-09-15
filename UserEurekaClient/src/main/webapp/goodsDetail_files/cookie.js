(function(w){
    var Cookies;
    Cookies = {
        set:function(key,value,day,path,domain){
            day  = day  || 0.5;
            path = path || "/";
            domain = domain || document.domain;
            document.cookie = key+"="+escape(value)+";expires="+expire(day)+";path="+path+";domain="+domain;
        },
        get:function(key){
            return getCookies(key);
        },
        remove:function(key,path,domain){
            path = path || "/";
            domain = domain || document.domain;
            document.cookie = key+"=;"+";expires="+expire(-1)+";path="+path+";domain="+domain;
        },
        clear:function(){
            clearCookies();
        },
        isset:function(key){
            var _cookies = allCookies(), r = false;
            for(var i in _cookies){
                if(trim(_cookies[i][0]) === key){
                    r = true;
                    break;
                }
            }
            return r;
        },
        stringify:function(data){
            return JSON.stringify(data);
        },
        parse:function(data){
            if(typeof(data) != 'undefined' && data != 'undefined' && data.length>2 ){
                return JSON.parse(data);
            }else{
                return {};
            }
        },
        trim:function(string){
            return trim(string);
        },
        dump:function(data){
           console.log(data);
        }
    }
    function expire(day){
        var exp = new Date();
            exp.setTime(exp.getTime()+day*24*3600*1000);
            return exp.toUTCString();
    }
    function allCookies(){
        var _cookies;
        _cookies = document.cookie;
        _cookies = _cookies.split(';');
        for(var i in _cookies){
            _cookies[i] = _cookies[i].split('=');
        }
       return _cookies;
    }
    function getCookies(key){
        var _cookies = allCookies(), o={};
        for(var i in _cookies){
            o[trim(_cookies[i][0])] = _cookies[i][1];
        }
        return unescape(o[key]);
    }
    function clearCookies(){
        var _cookies = allCookies();
        for(var i in _cookies){
            document.cookie = _cookies[i][0]+"="+unescape(_cookies[i][1])+";expires="+expire(-1);
        }
    }
    function trim(string){
        return string.replace(/(^\s*)|(\s*$)/,'');
    }
    w.cookies = Cookies;
})(window);
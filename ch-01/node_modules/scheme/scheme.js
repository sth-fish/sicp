var scheme = {};
var _ = require("underscore");
var php = require("phpjs");

scheme.fetch_synomym = function(object, synonyms) {
    var value = false;
    _.each(synonyms, function(synomym) {
        if(_.has(object, synomym)) {
            value = object[synomym];
        }
    });
    return value;
}

scheme.fetch_synomyms = function(object, greek) {
    _.each(greek, function(synonyms, index) {
        greek[index] = scheme.fetch_synomym(object, synonyms);
    });
    return greek;
}

scheme.query_object = function(object) {
    var queries = [];
    _.each(object, function(value, key) {
        var string = ""
        string += key;
        string += "=";
        string += encodeURIComponent(decodeURIComponent(value));
        queries.push(string);
    });
    queries = "?" + queries.join("&");
    return queries;
}

scheme.query_string = function(string) {
    var pairs, key, value, queries;
    queries = {};
    pairs = string.split("&");
    _.each(pairs, function(pair) {
        pair = string.split("=");
        key = pair[0];
        value = pair[1];
        queries[key] = value;
    });
    return queries;
}

scheme.query = function(variable) {
    if(typeof variable === "object") {
        return scheme.query_object(variable);
    } else {
        return scheme.query_string(variable);
    }
}

scheme.build_object = function(object) {
    var v, g;
    g = {
        "alpha": ["url", "uri"],
        "beta": ["scheme", "protocol"],
        "theta": ["username", "user"],
        "iota": ["password", "pass"],
        "gamma": ["domain", "host", "domains", "hostname"],
        "delta": ["port"],
        "epsilon": ["path", "pathname", "paths", "pathnames"],
        "zeta": ["query", "parameters", "queries", "search"],
        "eta": ["hash", "fragment", "anchor"]
    };
    g = scheme.fetch_synomyms(object, g);
    g.beta = (g.beta && !g.beta.match(/:\/\/|:/)) ? g.beta + "://" : g.beta;
    g.gamma = (g.gamma && typeof g.gamma !== "string") ? g.gamma.join(".") : g.gamma;
    g.delta = (g.delta && !g.delta.match(/:/)) ? ":" + g.delta : g.delta;
    g.epsilon = (g.epsilon && typeof g.epsilon == "string") ? "/" + _.without(g.epsilon.split("/"), "").join("/") : "/" + g.epsilon.join("/");
    g.zeta = (g.zeta) ? scheme.query(g.zeta) : g.zeta;
    g.eta = (g.eta && !g.eta.match(/^\#/)) ? "#" + g.eta : g.eta;
    g.theta = (g.theta) ? g.theta + ":" : g.theta;
    g.iota = (g.iota) ? g.iota + "@" : g.iota;
    v = _.values(g);
    v = _.without(g, false);
    v = v.join("");
    return v;
}

scheme.build_string = function(string) {
    var o = php.parse_url(string);
    o.path = _.without(o.path.split("/"), "");
    o.query = scheme.query(o.query);
    return o;
}

scheme.build = function(variable) {
    if(typeof variable === "object") {
        return scheme.build_object(variable);
    } else {
        return scheme.build_string(variable);
    }
}

module.exports = scheme;
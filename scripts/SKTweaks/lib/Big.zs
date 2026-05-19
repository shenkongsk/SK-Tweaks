#priority 9999
import native.java.math.BigInteger;

#priority 6000
#reloadable

zenClass Big_zs {
    var c as BigInteger;

        zenConstructor(big as BigInteger) {
        c = big;
    }
    function asLong () as long {return (c.compareTo(BigInteger("9223372036854775807")) >= 0) ? 9223372036854775807 as long : c.longValue();}
    function asInt () as int {return (c.compareTo(BigInteger("2147483647")) >= 0) ? 2147483647 as int : c.intValue();}
}

global Big as function(BigInteger)Big_zs = function (big as BigInteger) as Big_zs  {
    return Big_zs(big);
};

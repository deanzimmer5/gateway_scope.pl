#!/usr/bin/perl




print "\n Enter your IP(x.x.x.x/y): ";
my $ip = <STDIN>;
chomp $ip;
print "\n casa cisco or arris (s,c,a)?: ";
my $dev = <STDIN>;
chomp $dev;




my $slash;
my ($m,$n) = split (/\//,$ip);

my ($d,$e,$f,$g) = split(/\./,$ip);

my $h = $g + 1;



if ($n eq '16') {

$slash = '255.255.0.0';
}


elsif ($n eq '17') {

$slash = '255.255.128.0';
}


elsif ($n eq '18') {

$slash = '255.255.192.0';
}


elsif ($n eq '19') {

$slash = '255.255.224.0';
}

elsif ($n eq '20') {

$slash = '255.255.240.0';
}


elsif ($n eq '21') {

$slash = '255.255.248.0';
}

elsif ($n eq '22') {

$slash = '255.255.252.0';
}


elsif ($n eq '23') {

$slash = '255.255.254.0';
}


elsif ($n eq '24') {

$slash = '255.255.255.0';
}


elsif ($n eq '25') {

$slash = '255.255.255.128';
}


elsif ($n eq '26') {

$slash = '255.255.255.192';
}


elsif ($n eq '27') {

$slash = '255.255.255.224';
}


elsif ($n eq '28') {

$slash = '255.255.255.240';
}


elsif ($n eq '29') {

$slash = '255.255.255.248';
}

elsif ($n eq '30') {

$slash = '255.255.255.252';
}

elsif ($n eq '31') {

$slash = '255.255.255.254';
}

elsif ($n eq '32') {

$slash = '255.255.255.255';
}

else {

die "Invalid Subnet $n \n";

}


&box ($m,$n,$d,$e,$f,$g,$h,$slash,$dev);



sub box {
if ($dev eq 'c') {

print "\nconf t\n";
print "interface bundle 1\n";
print "ip address $d.$e.$f.$h $slash secondary \n";
print "end\n";
print "wr\n\n";


}

elsif ($dev eq 'a') {

print "\nconfigure interface cable-mac 1.0 ip address $d.$e.$f.$h $slash secondary\n";
print "write mem\n\n\n";


}


elsif ($dev eq 's') {

print "\nconf \n";
print "interface ip-bundle 1 \n";
print "ip address $d.$e.$f.$h $slash secondary \n";
print "end \n";
print "end \n";
print "save \n";
print "logout \n";
print "telnet $d.$e.$f.$h \n\n\n";


}

else {

die "Invalid Subnet $n \n";

}


}

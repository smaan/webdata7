xquery version "3.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

(:Query6:)

let $p := doc("travel1.xml")/travel//passenger[name="John Smith"]
let $r := doc("travel1.xml")/travel//reservation[@passenger=$p/@ssn]
let $d := 'Destination-'
for $re in $r
for $f in doc("travel1.xml")/travel//flight
where $f/@id=$re/@flight
for $fl in $f
for $a in doc("travel1.xml")/travel//airport
where $a/@code=$fl/@to
return ($d, {data($a/name)}, '&#xa;')

(:Query5:)
(:
let $p := doc("travel1.xml")/travel//passenger[name="John Smith"]
let $r := 'No. of reservations -'
let $r1 := count(doc("travel1.xml")/travel//reservation[@passenger=$p/@ssn])
return ($r, $r1)
:)
(:Query4:)
(:
for $x in doc("travel1.xml")/travel//flight
let $depta := doc("travel1.xml")/travel//airport[name="DFW"]
let $fd := 'Date-'
let $fd1 := $x/date
let $dac := '  Dep AP Code:'
let $dac1 := $x/@from/data()
let $aac := '  Arr AP Code:'
let $aac1 := $x/@to/data()
let $dt := '  Dep Time:'
let $dt1 := $x/departureTime
let $at := '  Arr Time:'
let $at1 := $x/arrivalTime
let $nr := '  No. of reservations -'
let $nr1 := count(doc("travel1.xml")/travel//reservation[@flight=$x/@id])
where $x/@from=$depta/@code
return ($fd, {data($fd1)}, $dac, $dac1, $aac, $aac1, '&#xa;', $dt, {data($dt1)}, $at, {data($at1)}, '&#xa;', $nr, $nr1, '&#xa;')
:)
(:Query3:)
(:
for $a in doc("travel1.xml")/travel//airport
let $ac := $a/@code/data()
let $n := $a/name
let $dfl := 'Dep Flights:'
let $df := count(doc("travel1.xml")/travel//flight[@from=$a/@code])
let $afl := 'Arr Flights:'
let $af := count(doc("travel1.xml")/travel//flight[@to=$a/@code])
return ($ac, {data($n)}, '&#xa;', $dfl, $df, '&#xa;', $afl, $af, '&#xa;')
:)
(:Query2:)
(:
for $x in doc("travel1.xml")/travel//passenger
let $y := 'No. of reservations:'
let $z := count(doc("travel1.xml")/travel//reservation[@passenger=$x/@ssn])
return ({data($x)}, $y, $z, '&#xa;')
:)
(:Query1:)
(:
for $f in doc("travel1.xml")/travel//flight[date="11/20/2014"]
let $da := doc("travel1.xml")/travel//airport[name="DFW"]
let $aa := doc("travel1.xml")/travel//airport[name="JFK"]
where $f/@from=$da/@code and $f/@to=$aa/@code
return {data($f)}
:)
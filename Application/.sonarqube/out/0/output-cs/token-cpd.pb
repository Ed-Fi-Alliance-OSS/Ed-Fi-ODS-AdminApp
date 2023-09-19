ç

YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\AdminAppUserContext.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
{ 
public 

class 
AdminAppUserContext $
{ 
public 
AdminAppUser 
User  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
IReadOnlyList 
< 

Permission '
>' (
Permissions) 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
bool 
Has 
( 

Permission "

permission# -
)- .
=> 
Permissions 
. 
Contains #
(# $

permission$ .
). /
;/ 0
public 
AdminAppUserContext "
(" #
)# $
{ 	
Permissions 
= 
new 

Permission (
[( )
]) *
{+ ,
}- .
;. /
} 	
} 
} ≤
VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ApiClientFactory.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
{

 
public 

class 
ApiClientFactory !
{ 
private 
readonly %
ISecurePackedHashProvider 2%
_securePackedHashProvider3 L
;L M
private 
readonly &
IHashConfigurationProvider 3&
_hashConfigurationProvider4 N
;N O
public 
class 
ApiWithCredentials '
{ 	
public 
	ApiClient 
	ApiClient &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
OdsApiCredential #
ApiCredentials$ 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 	
public 
ApiClientFactory 
(  %
ISecurePackedHashProvider  9$
securePackedHashProvider: R
,R S&
IHashConfigurationProvider &%
hashConfigurationProvider' @
)@ A
{ 	%
_securePackedHashProvider %
=& '$
securePackedHashProvider( @
;@ A&
_hashConfigurationProvider &
=' (%
hashConfigurationProvider) B
;B C
} 	
public 
ApiWithCredentials !&
GetApiClientAndCredentials" <
(< =
string= C
applicationNameD S
)S T
{ 	
var 
	apiClient 
= %
CreateProductionApiClient 5
(5 6
applicationName6 E
)E F
;F G
var)) 
apiCredentials)) 
=))  
new))! $
OdsApiCredential))% 5
())5 6
	apiClient))6 ?
.))? @
Key))@ C
,))C D
	apiClient))E N
.))N O
Secret))O U
)))U V
;))V W
return++ 
new++ 
ApiWithCredentials++ )
{,, 
	ApiClient-- 
=-- 
	apiClient-- %
,--% &
ApiCredentials.. 
=..  
apiCredentials..! /
}// 
;// 
}00 	
private22 
static22 
	ApiClient22  %
CreateProductionApiClient22! :
(22: ;
string22; A
applicationName22B Q
)22Q R
{33 	
var44 
	apiClient44 
=44 
new44 
	ApiClient44  )
(44) *
generateKey44* 5
:445 6
true447 ;
)44; <
{55 
Name66 
=66 
applicationName66 &
,66& '
	KeyStatus77 
=77 
$str77 $
,77$ %

IsApproved88 
=88 
true88 !
,88! "

UseSandbox99 
=99 
false99 "
}:: 
;:: 
return<< 
	apiClient<< 
;<< 
}== 	
}>> 
}?? ãæ
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Automapper\AdminManagementMappingProfile.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +

Automapper+ 5
{ 
public 

class )
AdminManagementMappingProfile .
:/ 0
Profile1 8
{ 
public )
AdminManagementMappingProfile ,
(, -
)- .
{ 	
	CreateMap 
< 

EdFiSchool  
,  !
School" (
>( )
() *
)* +
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &
Id& (
,( )
opt* -
=>. 0
opt1 4
.4 5
MapFrom5 <
(< =
src= @
=>A C
srcD G
.G H
IdH J
)J K
)K L
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &
Name& *
,* +
opt, /
=>0 2
opt3 6
.6 7
MapFrom7 >
(> ?
src? B
=>C E
srcF I
.I J
NameOfInstitutionJ [
)[ \
)\ ]
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &#
EducationOrganizationId& =
,= >
opt? B
=>C E
optF I
.I J
MapFromJ Q
(Q R
srcR U
=>V X
srcY \
.\ ]
SchoolId] e
)e f
)f g
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &"
LocalEducationAgencyId& <
,< =
opt> A
=>B D
optE H
.H I
MapFromI P
(P Q
srcQ T
=>U W
srcX [
.[ \)
LocalEducationAgencyReference\ y
==z |
null	} Å
?
Ç É
null
Ñ à
:
â ä
src
ã é
.
é è+
LocalEducationAgencyReference
è ¨
.
¨ ≠$
LocalEducationAgencyId
≠ √
)
√ ƒ
)
ƒ ≈
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &
StreetNumberName& 6
,6 7
opt8 ;
=>< >
opt? B
.B C
MapFromC J
(J K
srcK N
=>O Q
srcR U
.U V
	AddressesV _
!=` b
nullc g
&&h j
srck n
.n o
	Addresseso x
.x y
Anyy |
(| }
)} ~
?~ 
src
Ä É
.
É Ñ
	Addresses
Ñ ç
.
ç é
First
é ì
(
ì î
)
î ï
.
ï ñ
StreetNumberName
ñ ¶
:
ß ®
null
© ≠
)
≠ Æ
)
Æ Ø
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &$
ApartmentRoomSuiteNumber& >
,> ?
opt@ C
=>D F
optG J
.J K
MapFromK R
(R S
srcS V
=>W Y
srcZ ]
.] ^
	Addresses^ g
!=h j
nullk o
&&p r
srcs v
.v w
	Addresses	w Ä
.
Ä Å
Any
Å Ñ
(
Ñ Ö
)
Ö Ü
?
á à
src
â å
.
å ç
	Addresses
ç ñ
.
ñ ó
First
ó ú
(
ú ù
)
ù û
.
û ü&
ApartmentRoomSuiteNumber
ü ∑
:
∏ π
null
∫ æ
)
æ ø
)
ø ¿
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &
State& +
,+ ,
opt- 0
=>1 3
opt4 7
.7 8
MapFrom8 ?
(? @
src@ C
=>D F
srcG J
.J K
	AddressesK T
!=U W
nullX \
&&] _
src` c
.c d
	Addressesd m
.m n
Anyn q
(q r
)r s
?t u
srcv y
.y z
	Addresses	z É
.
É Ñ
First
Ñ â
(
â ä
)
ä ã
.
ã å)
StateAbbreviationDescriptor
å ß
:
® ©
null
™ Æ
)
Æ Ø
)
Ø ∞
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &
City& *
,* +
opt, /
=>0 2
opt3 6
.6 7
MapFrom7 >
(> ?
src? B
=>C E
srcF I
.I J
	AddressesJ S
!=T V
nullW [
&&\ ^
src_ b
.b c
	Addressesc l
.l m
Anym p
(p q
)q r
?s t
srcu x
.x y
	Addresses	y Ç
.
Ç É
First
É à
(
à â
)
â ä
.
ä ã
City
ã è
:
ê ë
null
í ñ
)
ñ ó
)
ó ò
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &
ZipCode& -
,- .
opt/ 2
=>3 5
opt6 9
.9 :
MapFrom: A
(A B
srcB E
=>F H
srcI L
.L M
	AddressesM V
!=W Y
nullZ ^
&&_ a
srcb e
.e f
	Addressesf o
.o p
Anyp s
(s t
)t u
?v w
srcx {
.{ |
	Addresses	| Ö
.
Ö Ü
First
Ü ã
(
ã å
)
å ç
.
ç é

PostalCode
é ò
:
ô ö
null
õ ü
)
ü †
)
† °
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &
GradeLevels& 1
,1 2
opt3 6
=>7 9
opt: =
.= >
MapFrom> E
(E F
srcF I
=>J L
srcM P
.P Q
GradeLevelsQ \
!=] _
null` d
?f g
srch k
.k l
GradeLevelsl w
.w x
Selectx ~
(~ 
g	 Ä
=>
Å É
g
Ñ Ö
.
Ö Ü"
GradeLevelDescriptor
Ü ö
)
ö õ
:
ú ù
new
û °
List
¢ ¶
<
¶ ß
string
ß ≠
>
≠ Æ
(
Æ Ø
)
Ø ∞
)
∞ ±
)
± ≤
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &)
EducationOrganizationCategory& C
,C D
optE H
=>I K
optL O
.O P
IgnoreP V
(V W
)W X
)X Y
;Y Z
	CreateMap!! 
<!! 

EdFiSchool!!  
,!!  !
	PsiSchool!!" +
>!!+ ,
(!!, -
)!!- .
."" 
	ForMember"" 
("" 
dst"" 
=>"" !
dst""" %
.""% &
Id""& (
,""( )
opt""* -
=>"". 0
opt""1 4
.""4 5
MapFrom""5 <
(""< =
src""= @
=>""A C
src""D G
.""G H
Id""H J
)""J K
)""K L
.## 
	ForMember## 
(## 
dst## 
=>## !
dst##" %
.##% &
Name##& *
,##* +
opt##, /
=>##0 2
opt##3 6
.##6 7
MapFrom##7 >
(##> ?
src##? B
=>##C E
src##F I
.##I J
NameOfInstitution##J [
)##[ \
)##\ ]
.$$ 
	ForMember$$ 
($$ 
dst$$ 
=>$$ !
dst$$" %
.$$% &#
EducationOrganizationId$$& =
,$$= >
opt$$? B
=>$$C E
opt$$F I
.$$I J
MapFrom$$J Q
($$Q R
src$$R U
=>$$V X
src$$Y \
.$$\ ]
SchoolId$$] e
)$$e f
)$$f g
.%% 
	ForMember%% 
(%% 
dst%% 
=>%% !
dst%%" %
.%%% &"
LocalEducationAgencyId%%& <
,%%< =
opt%%> A
=>%%B D
opt%%E H
.%%H I
Ignore%%I O
(%%O P
)%%P Q
)%%Q R
.&& 
	ForMember&& 
(&& 
dst&& 
=>&& !
dst&&" %
.&&% &&
PostSecondaryInstitutionId&&& @
,&&@ A
opt&&B E
=>&&F H
opt&&I L
.&&L M
MapFrom&&M T
(&&T U
src&&U X
=>&&Y [
src&&\ _
.&&_ `
_ext&&` d
==&&e g
null&&h l
?'' 
null'' 
:(( 
src(( 
.(( 
_ext(( 
!=(( !
null((" &
&&((' )
src((* -
.((- .
_ext((. 2
.((2 3
TPDM((3 7
==((8 :
null((; ?
?)) 
null)) 
:** 
src** 
.** 
_ext** "
!=**# %
null**& *
&&**+ -
src**. 1
.**1 2
_ext**2 6
.**6 7
TPDM**7 ;
!=**< >
null**? C
&&**D F
src**G J
.**J K
_ext**K O
.**O P
TPDM**P T
.**T U-
!PostSecondaryInstitutionReference**U v
==**w y
null**z ~
?++ 
null++ "
:,, 
src,, !
.,,! "
_ext,," &
.,,& '
TPDM,,' +
.,,+ ,-
!PostSecondaryInstitutionReference,,, M
.,,M N&
PostSecondaryInstitutionId,,N h
),,h i
),,i j
.-- 
	ForMember-- 
(-- 
dst-- 
=>-- !
dst--" %
.--% &
StreetNumberName--& 6
,--6 7
opt--8 ;
=>--< >
opt--? B
.--B C
MapFrom--C J
(--J K
src--K N
=>--O Q
src--R U
.--U V
	Addresses--V _
!=--` b
null--c g
&&--h j
src--k n
.--n o
	Addresses--o x
.--x y
Any--y |
(--| }
)--} ~
?	-- Ä
src
--Å Ñ
.
--Ñ Ö
	Addresses
--Ö é
.
--é è
First
--è î
(
--î ï
)
--ï ñ
.
--ñ ó
StreetNumberName
--ó ß
:
--® ©
null
--™ Æ
)
--Æ Ø
)
--Ø ∞
... 
	ForMember.. 
(.. 
dst.. 
=>.. !
dst.." %
...% &$
ApartmentRoomSuiteNumber..& >
,..> ?
opt..@ C
=>..D F
opt..G J
...J K
MapFrom..K R
(..R S
src..S V
=>..W Y
src..Z ]
...] ^
	Addresses..^ g
!=..h j
null..k o
&&..p r
src..s v
...v w
	Addresses	..w Ä
.
..Ä Å
Any
..Å Ñ
(
..Ñ Ö
)
..Ö Ü
?
..á à
src
..â å
.
..å ç
	Addresses
..ç ñ
.
..ñ ó
First
..ó ú
(
..ú ù
)
..ù û
.
..û ü&
ApartmentRoomSuiteNumber
..ü ∑
:
..∏ π
null
..∫ æ
)
..æ ø
)
..ø ¿
.// 
	ForMember// 
(// 
dst// 
=>// !
dst//" %
.//% &
State//& +
,//+ ,
opt//- 0
=>//1 3
opt//4 7
.//7 8
MapFrom//8 ?
(//? @
src//@ C
=>//D F
src//G J
.//J K
	Addresses//K T
!=//U W
null//X \
&&//] _
src//` c
.//c d
	Addresses//d m
.//m n
Any//n q
(//q r
)//r s
?//t u
src//v y
.//y z
	Addresses	//z É
.
//É Ñ
First
//Ñ â
(
//â ä
)
//ä ã
.
//ã å)
StateAbbreviationDescriptor
//å ß
:
//® ©
null
//™ Æ
)
//Æ Ø
)
//Ø ∞
.00 
	ForMember00 
(00 
dst00 
=>00 !
dst00" %
.00% &
City00& *
,00* +
opt00, /
=>000 2
opt003 6
.006 7
MapFrom007 >
(00> ?
src00? B
=>00C E
src00F I
.00I J
	Addresses00J S
!=00T V
null00W [
&&00\ ^
src00_ b
.00b c
	Addresses00c l
.00l m
Any00m p
(00p q
)00q r
?00s t
src00u x
.00x y
	Addresses	00y Ç
.
00Ç É
First
00É à
(
00à â
)
00â ä
.
00ä ã
City
00ã è
:
00ê ë
null
00í ñ
)
00ñ ó
)
00ó ò
.11 
	ForMember11 
(11 
dst11 
=>11 !
dst11" %
.11% &
ZipCode11& -
,11- .
opt11/ 2
=>113 5
opt116 9
.119 :
MapFrom11: A
(11A B
src11B E
=>11F H
src11I L
.11L M
	Addresses11M V
!=11W Y
null11Z ^
&&11_ a
src11b e
.11e f
	Addresses11f o
.11o p
Any11p s
(11s t
)11t u
?11v w
src11x {
.11{ |
	Addresses	11| Ö
.
11Ö Ü
First
11Ü ã
(
11ã å
)
11å ç
.
11ç é

PostalCode
11é ò
:
11ô ö
null
11õ ü
)
11ü †
)
11† °
.22 
	ForMember22 
(22 
dst22 
=>22 !
dst22" %
.22% &
GradeLevels22& 1
,221 2
opt223 6
=>227 9
opt22: =
.22= >
MapFrom22> E
(22E F
src22F I
=>22J L
src22M P
.22P Q
GradeLevels22Q \
!=22] _
null22` d
?22e f
src22g j
.22j k
GradeLevels22k v
.22v w
Select22w }
(22} ~
g22~ 
=>
22Ä Ç
g
22É Ñ
.
22Ñ Ö"
GradeLevelDescriptor
22Ö ô
)
22ô ö
:
22õ ú
new
22ù †
List
22° •
<
22• ¶
string
22¶ ¨
>
22¨ ≠
(
22≠ Æ
)
22Æ Ø
)
22Ø ∞
)
22∞ ±
.33 
	ForMember33 
(33 
dst33 
=>33 !
dst33" %
.33% &
AccreditationStatus33& 9
,339 :
opt33; >
=>33? A
opt33B E
.33E F
MapFrom33F M
(33M N
src33N Q
=>33R T
src33U X
.33X Y
_ext33Y ]
==33^ `
null33a e
?44 
null44 
:55 
src55 
.55 
_ext55 
!=55 !
null55" &
&&55' )
src55* -
.55- .
_ext55. 2
.552 3
TPDM553 7
==558 :
null55; ?
?66 
null66 
:77 
src77 
.77 
_ext77 "
.77" #
TPDM77# '
.77' ()
AccreditationStatusDescriptor77( E
)77E F
)77F G
.88 
	ForMember88 
(88 
dst88 
=>88 !
dst88" %
.88% &
FederalLocaleCode88& 7
,887 8
opt889 <
=>88= ?
opt88@ C
.88C D
MapFrom88D K
(88K L
src88L O
=>88P R
src88S V
.88V W
_ext88W [
==88\ ^
null88_ c
?99 
null99 
::: 
src:: 
.:: 
_ext:: 
!=:: !
null::" &
&&::' )
src::* -
.::- .
_ext::. 2
.::2 3
TPDM::3 7
==::8 :
null::; ?
?;; 
null;; 
:<< 
src<< 
.<< 
_ext<< "
.<<" #
TPDM<<# '
.<<' ('
FederalLocaleCodeDescriptor<<( C
)<<C D
)<<D E
.== 
	ForMember== 
(== 
dst== 
=>== !
dst==" %
.==% &
ImprovingSchool==& 5
,==5 6
opt==7 :
=>==; =
opt==> A
.==A B
Ignore==B H
(==H I
)==I J
)==J K
.>> 
	ForMember>> 
(>> 
dst>> 
=>>> !
dst>>" %
.>>% &)
EducationOrganizationCategory>>& C
,>>C D
opt>>E H
=>>>I K
opt>>L O
.>>O P
Ignore>>P V
(>>V W
)>>W X
)>>X Y
;>>Y Z
	CreateMap@@ 
<@@ $
EdFiLocalEducationAgency@@ .
,@@. / 
LocalEducationAgency@@0 D
>@@D E
(@@E F
)@@F G
.AA 
	ForMemberAA 
(AA 
dstAA 
=>AA !
dstAA" %
.AA% &
IdAA& (
,AA( )
optAA* -
=>AA. 0
optAA1 4
.AA4 5
MapFromAA5 <
(AA< =
srcAA= @
=>AAA C
srcAAD G
.AAG H
IdAAH J
)AAJ K
)AAK L
.BB 
	ForMemberBB 
(BB 
dstBB 
=>BB !
dstBB" %
.BB% &"
LocalEducationAgencyIdBB& <
,BB< =
optBB> A
=>BBB D
optBBE H
.BBH I
MapFromBBI P
(BBP Q
srcBBQ T
=>BBU W
srcBBX [
.BB[ \"
LocalEducationAgencyIdBB\ r
)BBr s
)BBs t
.CC 
	ForMemberCC 
(CC 
dstCC 
=>CC !
dstCC" %
.CC% &
NameCC& *
,CC* +
optCC, /
=>CC0 2
optCC3 6
.CC6 7
MapFromCC7 >
(CC> ?
srcCC? B
=>CCC E
srcCCF I
.CCI J
NameOfInstitutionCCJ [
)CC[ \
)CC\ ]
.DD 
	ForMemberDD 
(DD 
dstDD 
=>DD !
dstDD" %
.DD% &#
EducationOrganizationIdDD& =
,DD= >
optDD? B
=>DDC E
optDDF I
.DDI J
MapFromDDJ Q
(DDQ R
srcDDR U
=>DDV X
srcDDY \
.DD\ ]"
LocalEducationAgencyIdDD] s
??DDt v
$numDDw x
)DDx y
)DDy z
.EE 
	ForMemberEE 
(EE 
dstEE 
=>EE !
dstEE" %
.EE% &
StreetNumberNameEE& 6
,EE6 7
optEE8 ;
=>EE< >
optEE? B
.EEB C
MapFromEEC J
(EEJ K
srcEEK N
=>EEO Q
srcEER U
.EEU V
	AddressesEEV _
!=EE` b
nullEEc g
&&EEh j
srcEEk n
.EEn o
	AddressesEEo x
.EEx y
AnyEEy |
(EE| }
)EE} ~
?	EE Ä
src
EEÅ Ñ
.
EEÑ Ö
	Addresses
EEÖ é
.
EEé è
First
EEè î
(
EEî ï
)
EEï ñ
.
EEñ ó
StreetNumberName
EEó ß
:
EE® ©
null
EE™ Æ
)
EEÆ Ø
)
EEØ ∞
.FF 
	ForMemberFF 
(FF 
dstFF 
=>FF !
dstFF" %
.FF% &$
ApartmentRoomSuiteNumberFF& >
,FF> ?
optFF@ C
=>FFD F
optFFG J
.FFJ K
MapFromFFK R
(FFR S
srcFFS V
=>FFW Y
srcFFZ ]
.FF] ^
	AddressesFF^ g
!=FFh j
nullFFk o
&&FFp r
srcFFs v
.FFv w
	Addresses	FFw Ä
.
FFÄ Å
Any
FFÅ Ñ
(
FFÑ Ö
)
FFÖ Ü
?
FFá à
src
FFâ å
.
FFå ç
	Addresses
FFç ñ
.
FFñ ó
First
FFó ú
(
FFú ù
)
FFù û
.
FFû ü&
ApartmentRoomSuiteNumber
FFü ∑
:
FF∏ π
null
FF∫ æ
)
FFæ ø
)
FFø ¿
.GG 
	ForMemberGG 
(GG 
dstGG 
=>GG !
dstGG" %
.GG% &
StateGG& +
,GG+ ,
optGG- 0
=>GG1 3
optGG4 7
.GG7 8
MapFromGG8 ?
(GG? @
srcGG@ C
=>GGD F
srcGGG J
.GGJ K
	AddressesGGK T
!=GGU W
nullGGX \
&&GG] _
srcGG` c
.GGc d
	AddressesGGd m
.GGm n
AnyGGn q
(GGq r
)GGr s
?GGt u
srcGGv y
.GGy z
	Addresses	GGz É
.
GGÉ Ñ
First
GGÑ â
(
GGâ ä
)
GGä ã
.
GGã å)
StateAbbreviationDescriptor
GGå ß
:
GG® ©
null
GG™ Æ
)
GGÆ Ø
)
GGØ ∞
.HH 
	ForMemberHH 
(HH 
dstHH 
=>HH !
dstHH" %
.HH% &
CityHH& *
,HH* +
optHH, /
=>HH0 2
optHH3 6
.HH6 7
MapFromHH7 >
(HH> ?
srcHH? B
=>HHC E
srcHHF I
.HHI J
	AddressesHHJ S
!=HHT V
nullHHW [
&&HH\ ^
srcHH_ b
.HHb c
	AddressesHHc l
.HHl m
AnyHHm p
(HHp q
)HHq r
?HHs t
srcHHu x
.HHx y
	Addresses	HHy Ç
.
HHÇ É
First
HHÉ à
(
HHà â
)
HHâ ä
.
HHä ã
City
HHã è
:
HHê ë
null
HHí ñ
)
HHñ ó
)
HHó ò
.II 
	ForMemberII 
(II 
dstII 
=>II !
dstII" %
.II% &
ZipCodeII& -
,II- .
optII/ 2
=>II3 5
optII6 9
.II9 :
MapFromII: A
(IIA B
srcIIB E
=>IIF H
srcIII L
.IIL M
	AddressesIIM V
!=IIW Y
nullIIZ ^
&&II_ a
srcIIb e
.IIe f
	AddressesIIf o
.IIo p
AnyIIp s
(IIs t
)IIt u
?IIv w
srcIIx {
.II{ |
	Addresses	II| Ö
.
IIÖ Ü
First
IIÜ ã
(
IIã å
)
IIå ç
.
IIç é

PostalCode
IIé ò
:
IIô ö
null
IIõ ü
)
IIü †
)
II† °
.JJ 
	ForMemberJJ 
(JJ 
dstJJ 
=>JJ !
dstJJ" %
.JJ% &,
 LocalEducationAgencyCategoryTypeJJ& F
,JJF G
optJJH K
=>JJL N
optJJO R
.JJR S
MapFromJJS Z
(JJZ [
srcJJ[ ^
=>JJ_ a
srcJJb e
.JJe f3
&LocalEducationAgencyCategoryDescriptor	JJf å
)
JJå ç
)
JJç é
.KK 
	ForMemberKK 
(KK 
dstKK 
=>KK !
dstKK" %
.KK% &)
EducationOrganizationCategoryKK& C
,KKC D
optKKE H
=>KKI K
optKKL O
.KKO P
IgnoreKKP V
(KKV W
)KKW X
)KKX Y
.LL 
	ForMemberLL 
(LL 
dstLL 
=>LL !
dstLL" %
.LL% &
StateOrganizationIdLL& 9
,LL9 :
optLL; >
=>LL? A
optLLB E
.LLE F
MapFromLLF M
(LLM N
srcLLN Q
=>LLR T
srcLLU X
.LLX Y)
StateEducationAgencyReferenceLLY v
!=LLw y
nullLLz ~
?	LL Ä
src
LLÅ Ñ
.
LLÑ Ö+
StateEducationAgencyReference
LLÖ ¢
.
LL¢ £$
StateEducationAgencyId
LL£ π
:
LL∫ ª
$num
LLº Ω
)
LLΩ æ
)
LLæ ø
;
LLø ¿
	CreateMapNN 
<NN (
EdFiPostSecondaryInstitutionNN 2
,NN2 3$
PostSecondaryInstitutionNN4 L
>NNL M
(NNM N
)NNN O
.OO 
	ForMemberOO 
(OO 
dstOO 
=>OO !
dstOO" %
.OO% &
IdOO& (
,OO( )
optOO* -
=>OO. 0
optOO1 4
.OO4 5
MapFromOO5 <
(OO< =
srcOO= @
=>OOA C
srcOOD G
.OOG H
IdOOH J
)OOJ K
)OOK L
.PP 
	ForMemberPP 
(PP 
dstPP 
=>PP !
dstPP" %
.PP% &&
PostSecondaryInstitutionIdPP& @
,PP@ A
optPPB E
=>PPF H
optPPI L
.PPL M
MapFromPPM T
(PPT U
srcPPU X
=>PPY [
srcPP\ _
.PP_ `&
PostSecondaryInstitutionIdPP` z
)PPz {
)PP{ |
.QQ 
	ForMemberQQ 
(QQ 
dstQQ 
=>QQ !
dstQQ" %
.QQ% &"
LocalEducationAgencyIdQQ& <
,QQ< =
optQQ> A
=>QQB D
optQQE H
.QQH I
IgnoreQQI O
(QQO P
)QQP Q
)QQQ R
.RR 
	ForMemberRR 
(RR 
dstRR 
=>RR !
dstRR" %
.RR% &
NameRR& *
,RR* +
optRR, /
=>RR0 2
optRR3 6
.RR6 7
MapFromRR7 >
(RR> ?
srcRR? B
=>RRC E
srcRRF I
.RRI J
NameOfInstitutionRRJ [
)RR[ \
)RR\ ]
.SS 
	ForMemberSS 
(SS 
dstSS 
=>SS !
dstSS" %
.SS% &#
EducationOrganizationIdSS& =
,SS= >
optSS? B
=>SSC E
optSSF I
.SSI J
MapFromSSJ Q
(SSQ R
srcSSR U
=>SSV X
srcSSY \
.SS\ ]&
PostSecondaryInstitutionIdSS] w
??SSx z
$numSS{ |
)SS| }
)SS} ~
.TT 
	ForMemberTT 
(TT 
dstTT 
=>TT !
dstTT" %
.TT% &
StreetNumberNameTT& 6
,TT6 7
optTT8 ;
=>TT< >
optTT? B
.TTB C
MapFromTTC J
(TTJ K
srcTTK N
=>TTO Q
srcTTR U
.TTU V
	AddressesTTV _
!=TT` b
nullTTc g
&&TTh j
srcTTk n
.TTn o
	AddressesTTo x
.TTx y
AnyTTy |
(TT| }
)TT} ~
?	TT Ä
src
TTÅ Ñ
.
TTÑ Ö
	Addresses
TTÖ é
.
TTé è
First
TTè î
(
TTî ï
)
TTï ñ
.
TTñ ó
StreetNumberName
TTó ß
:
TT® ©
null
TT™ Æ
)
TTÆ Ø
)
TTØ ∞
.UU 
	ForMemberUU 
(UU 
dstUU 
=>UU !
dstUU" %
.UU% &$
ApartmentRoomSuiteNumberUU& >
,UU> ?
optUU@ C
=>UUD F
optUUG J
.UUJ K
MapFromUUK R
(UUR S
srcUUS V
=>UUW Y
srcUUZ ]
.UU] ^
	AddressesUU^ g
!=UUh j
nullUUk o
&&UUp r
srcUUs v
.UUv w
	Addresses	UUw Ä
.
UUÄ Å
Any
UUÅ Ñ
(
UUÑ Ö
)
UUÖ Ü
?
UUá à
src
UUâ å
.
UUå ç
	Addresses
UUç ñ
.
UUñ ó
First
UUó ú
(
UUú ù
)
UUù û
.
UUû ü&
ApartmentRoomSuiteNumber
UUü ∑
:
UU∏ π
null
UU∫ æ
)
UUæ ø
)
UUø ¿
.VV 
	ForMemberVV 
(VV 
dstVV 
=>VV !
dstVV" %
.VV% &
StateVV& +
,VV+ ,
optVV- 0
=>VV1 3
optVV4 7
.VV7 8
MapFromVV8 ?
(VV? @
srcVV@ C
=>VVD F
srcVVG J
.VVJ K
	AddressesVVK T
!=VVU W
nullVVX \
&&VV] _
srcVV` c
.VVc d
	AddressesVVd m
.VVm n
AnyVVn q
(VVq r
)VVr s
?VVt u
srcVVv y
.VVy z
	Addresses	VVz É
.
VVÉ Ñ
First
VVÑ â
(
VVâ ä
)
VVä ã
.
VVã å)
StateAbbreviationDescriptor
VVå ß
:
VV® ©
null
VV™ Æ
)
VVÆ Ø
)
VVØ ∞
.WW 
	ForMemberWW 
(WW 
dstWW 
=>WW !
dstWW" %
.WW% &
CityWW& *
,WW* +
optWW, /
=>WW0 2
optWW3 6
.WW6 7
MapFromWW7 >
(WW> ?
srcWW? B
=>WWC E
srcWWF I
.WWI J
	AddressesWWJ S
!=WWT V
nullWWW [
&&WW\ ^
srcWW_ b
.WWb c
	AddressesWWc l
.WWl m
AnyWWm p
(WWp q
)WWq r
?WWs t
srcWWu x
.WWx y
	Addresses	WWy Ç
.
WWÇ É
First
WWÉ à
(
WWà â
)
WWâ ä
.
WWä ã
City
WWã è
:
WWê ë
null
WWí ñ
)
WWñ ó
)
WWó ò
.XX 
	ForMemberXX 
(XX 
dstXX 
=>XX !
dstXX" %
.XX% &
ZipCodeXX& -
,XX- .
optXX/ 2
=>XX3 5
optXX6 9
.XX9 :
MapFromXX: A
(XXA B
srcXXB E
=>XXF H
srcXXI L
.XXL M
	AddressesXXM V
!=XXW Y
nullXXZ ^
&&XX_ a
srcXXb e
.XXe f
	AddressesXXf o
.XXo p
AnyXXp s
(XXs t
)XXt u
?XXv w
srcXXx {
.XX{ |
	Addresses	XX| Ö
.
XXÖ Ü
First
XXÜ ã
(
XXã å
)
XXå ç
.
XXç é

PostalCode
XXé ò
:
XXô ö
null
XXõ ü
)
XXü †
)
XX† °
.YY 
	ForMemberYY 
(YY 
dstYY 
=>YY !
dstYY" %
.YY% &)
PostSecondaryInstitutionLevelYY& C
,YYC D
optYYE H
=>YYI K
optYYL O
.YYO P
MapFromYYP W
(YYW X
srcYYX [
=>YY\ ^
srcYY_ b
.YYb c4
'PostSecondaryInstitutionLevelDescriptor	YYc ä
)
YYä ã
)
YYã å
.ZZ 
	ForMemberZZ 
(ZZ 
dstZZ 
=>ZZ !
dstZZ" %
.ZZ% &(
AdministrativeFundingControlZZ& B
,ZZB C
optZZD G
=>ZZH J
optZZK N
.ZZN O
MapFromZZO V
(ZZV W
srcZZW Z
=>ZZ[ ]
srcZZ^ a
.ZZa b3
&AdministrativeFundingControlDescriptor	ZZb à
)
ZZà â
)
ZZâ ä
.[[ 
	ForMember[[ 
([[ 
dst[[ 
=>[[ !
dst[[" %
.[[% &)
EducationOrganizationCategory[[& C
,[[C D
opt[[E H
=>[[I K
opt[[L O
.[[O P
Ignore[[P V
([[V W
)[[W X
)[[X Y
;[[Y Z
	CreateMap]] 
<]] 
School]] 
,]] 

EdFiSchool]] (
>]]( )
(]]) *
)]]* +
.^^ 
	ForMember^^ 
(^^ 
dst^^ 
=>^^ !
dst^^" %
.^^% &
Id^^& (
,^^( )
opt^^* -
=>^^. 0
opt^^1 4
.^^4 5
MapFrom^^5 <
(^^< =
src^^= @
=>^^A C
src^^D G
.^^G H
Id^^H J
)^^J K
)^^K L
.__ 
	ForMember__ 
(__ 
dst__ 
=>__ !
dst__" %
.__% &
SchoolId__& .
,__. /
opt__0 3
=>__4 6
opt__7 :
.__: ;
MapFrom__; B
(__B C
src__C F
=>__G I
src__J M
.__M N#
EducationOrganizationId__N e
)__e f
)__f g
.`` 
	ForMember`` 
(`` 
dst`` 
=>`` !
dst``" %
.``% &
NameOfInstitution``& 7
,``7 8
opt``9 <
=>``= ?
opt``@ C
.``C D
MapFrom``D K
(``K L
src``L O
=>``P R
src``S V
.``V W
Name``W [
)``[ \
)``\ ]
.aa 
	ForMemberaa 
(aa 
dstaa 
=>aa !
dstaa" %
.aa% &
	Addressesaa& /
,aa/ 0
optaa1 4
=>aa5 7
optaa8 ;
.aa; <
MapFromaa< C
<aaC D!
SchoolAddressResolveraaD Y
>aaY Z
(aaZ [
)aa[ \
)aa\ ]
.bb 
	ForMemberbb 
(bb 
dstbb 
=>bb !
dstbb" %
.bb% &+
EducationOrganizationCategoriesbb& E
,bbE F
optcc 
=>cc 
optcc 
.cc 
MapFromcc &
<cc& '"
SchoolCategoryResolvercc' =
>cc= >
(cc> ?
)cc? @
)cc@ A
.dd 
	ForMemberdd 
(dd 
dstdd 
=>dd !
dstdd" %
.dd% &
GradeLevelsdd& 1
,dd1 2
optdd3 6
=>dd7 9
optdd: =
.dd= >
MapFromdd> E
<ddE F$
SchoolGradeLevelResolverddF ^
>dd^ _
(dd_ `
)dd` a
)dda b
.ee 
	ForMemberee 
(ee 
dstee 
=>ee !
dstee" %
.ee% &)
LocalEducationAgencyReferenceee& C
,eeC D
optff 
=>ff 
optff 
.ff 
MapFromff &
<ff& '1
%LocalEducationAgencyReferenceResolverff' L
>ffL M
(ffM N
)ffN O
)ffO P
.gg 
	ForMembergg 
(gg 
dstgg 
=>gg !
dstgg" %
.gg% &
_extgg& *
,gg* +
optgg, /
=>gg0 2
optgg3 6
.gg6 7
Ignoregg7 =
(gg= >
)gg> ?
)gg? @
.hh 
ForCtorParamhh 
(hh 
$strhh "
,hh" #
opthh$ '
=>hh( *
opthh+ .
.hh. /
MapFromhh/ 6
(hh6 7
srchh7 :
=>hh; =
srchh> A
.hhA B
IdhhB D
)hhD E
)hhE F
.ii 
ForCtorParamii 
(ii 
$strii (
,ii( )
optii* -
=>ii. 0
optii1 4
.ii4 5
MapFromii5 <
(ii< =
srcii= @
=>iiA C
srciiD G
.iiG H#
EducationOrganizationIdiiH _
)ii_ `
)ii` a
.jj 
ForCtorParamjj 
(jj 
$strjj 1
,jj1 2
optjj3 6
=>jj7 9
optjj: =
.jj= >
MapFromjj> E
(jjE F
srcjjF I
=>jjJ L
srcjjM P
.jjP Q
NamejjQ U
)jjU V
)jjV W
.kk 
ForCtorParamkk 
(kk 
$strkk )
,kk) *
optkk+ .
=>kk/ 1
optkk2 5
.kk5 6
MapFromkk6 =
(kk= >
AddressResolverkk> M
)kkM N
)kkN O
.ll 
ForCtorParamll 
(ll 
$strll ?
,ll? @
optllA D
=>llE G
optllH K
.llK L
MapFromllL S
(llS T1
%EducationOrganizationCategoryResolverllT y
.lly z
Resolve	llz Å
)
llÅ Ç
)
llÇ É
.mm 
ForCtorParammm 
(mm 
$strmm +
,mm+ ,
optmm- 0
=>mm1 3
optmm4 7
.mm7 8
MapFrommm8 ?
(mm? @$
SchoolGradeLevelResolvermm@ X
.mmX Y
ResolvemmY `
)mm` a
)mma b
.nn 
ForCtorParamnn 
(nn 
$strnn =
,nn= >
optnn? B
=>nnC E
optnnF I
.nnI J
MapFromnnJ Q
(nnQ R1
%LocalEducationAgencyReferenceResolvernnR w
.nnw x
Resolvennx 
)	nn Ä
)
nnÄ Å
;
nnÅ Ç
	CreateMappp 
<pp 
	PsiSchoolpp 
,pp  

EdFiSchoolpp! +
>pp+ ,
(pp, -
)pp- .
.qq 
	ForMemberqq 
(qq 
dstqq 
=>qq !
dstqq" %
.qq% &
Idqq& (
,qq( )
optqq* -
=>qq. 0
optqq1 4
.qq4 5
MapFromqq5 <
(qq< =
srcqq= @
=>qqA C
srcqqD G
.qqG H
IdqqH J
)qqJ K
)qqK L
.rr 
	ForMemberrr 
(rr 
dstrr 
=>rr !
dstrr" %
.rr% &
SchoolIdrr& .
,rr. /
optrr0 3
=>rr4 6
optrr7 :
.rr: ;
MapFromrr; B
(rrB C
srcrrC F
=>rrG I
srcrrJ M
.rrM N#
EducationOrganizationIdrrN e
)rre f
)rrf g
.ss 
	ForMemberss 
(ss 
dstss 
=>ss !
dstss" %
.ss% &
NameOfInstitutionss& 7
,ss7 8
optss9 <
=>ss= ?
optss@ C
.ssC D
MapFromssD K
(ssK L
srcssL O
=>ssP R
srcssS V
.ssV W
NamessW [
)ss[ \
)ss\ ]
.tt 
	ForMembertt 
(tt 
dsttt 
=>tt !
dsttt" %
.tt% &
	Addressestt& /
,tt/ 0
opttt1 4
=>tt5 7
opttt8 ;
.tt; <
MapFromtt< C
<ttC D!
SchoolAddressResolverttD Y
>ttY Z
(ttZ [
)tt[ \
)tt\ ]
.uu 
	ForMemberuu 
(uu 
dstuu 
=>uu !
dstuu" %
.uu% &+
EducationOrganizationCategoriesuu& E
,uuE F
optvv 
=>vv 
optvv 
.vv 
MapFromvv &
<vv& '"
SchoolCategoryResolvervv' =
>vv= >
(vv> ?
)vv? @
)vv@ A
.ww 
	ForMemberww 
(ww 
dstww 
=>ww !
dstww" %
.ww% &
GradeLevelsww& 1
,ww1 2
optww3 6
=>ww7 9
optww: =
.ww= >
MapFromww> E
<wwE F$
SchoolGradeLevelResolverwwF ^
>ww^ _
(ww_ `
)ww` a
)wwa b
.xx 
	ForMemberxx 
(xx 
dstxx 
=>xx !
dstxx" %
.xx% &)
LocalEducationAgencyReferencexx& C
,xxC D
optyy 
=>yy 
optyy 
.yy 
MapFromyy &
<yy& '1
%LocalEducationAgencyReferenceResolveryy' L
>yyL M
(yyM N
)yyN O
)yyO P
.zz 
	ForMemberzz 
(zz 
dstzz 
=>zz !
dstzz" %
.zz% &
_extzz& *
,zz* +
opt{{ 
=>{{ 
opt{{ 
.{{ 
MapFrom{{ &
<{{& '$
SchoolExtensionsResolver{{' ?
>{{? @
({{@ A
){{A B
){{B C
.|| 
ForCtorParam|| 
(|| 
$str|| "
,||" #
opt||$ '
=>||( *
opt||+ .
.||. /
MapFrom||/ 6
(||6 7
src||7 :
=>||; =
src||> A
.||A B
Id||B D
)||D E
)||E F
.}} 
ForCtorParam}} 
(}} 
$str}} (
,}}( )
opt}}* -
=>}}. 0
opt}}1 4
.}}4 5
MapFrom}}5 <
(}}< =
src}}= @
=>}}A C
src}}D G
.}}G H#
EducationOrganizationId}}H _
)}}_ `
)}}` a
.~~ 
ForCtorParam~~ 
(~~ 
$str~~ 1
,~~1 2
opt~~3 6
=>~~7 9
opt~~: =
.~~= >
MapFrom~~> E
(~~E F
src~~F I
=>~~J L
src~~M P
.~~P Q
Name~~Q U
)~~U V
)~~V W
. 
ForCtorParam 
( 
$str )
,) *
opt+ .
=>/ 1
opt2 5
.5 6
MapFrom6 =
(= >
AddressResolver> M
)M N
)N O
.
ÄÄ 
ForCtorParam
ÄÄ 
(
ÄÄ 
$str
ÄÄ ?
,
ÄÄ? @
opt
ÄÄA D
=>
ÄÄE G
opt
ÄÄH K
.
ÄÄK L
MapFrom
ÄÄL S
(
ÄÄS T3
%EducationOrganizationCategoryResolver
ÄÄT y
.
ÄÄy z
ResolveÄÄz Å
)ÄÄÅ Ç
)ÄÄÇ É
.
ÅÅ 
ForCtorParam
ÅÅ 
(
ÅÅ 
$str
ÅÅ +
,
ÅÅ+ ,
opt
ÅÅ- 0
=>
ÅÅ1 3
opt
ÅÅ4 7
.
ÅÅ7 8
MapFrom
ÅÅ8 ?
(
ÅÅ? @&
SchoolGradeLevelResolver
ÅÅ@ X
.
ÅÅX Y
Resolve
ÅÅY `
)
ÅÅ` a
)
ÅÅa b
.
ÇÇ 
ForCtorParam
ÇÇ 
(
ÇÇ 
$str
ÇÇ =
,
ÇÇ= >
opt
ÇÇ? B
=>
ÇÇC E
opt
ÇÇF I
.
ÇÇI J
MapFrom
ÇÇJ Q
(
ÇÇQ R3
%LocalEducationAgencyReferenceResolver
ÇÇR w
.
ÇÇw x
Resolve
ÇÇx 
)ÇÇ Ä
)ÇÇÄ Å
;ÇÇÅ Ç
	CreateMap
ÖÖ 
<
ÖÖ "
LocalEducationAgency
ÖÖ *
,
ÖÖ* +&
EdFiLocalEducationAgency
ÖÖ, D
>
ÖÖD E
(
ÖÖE F
)
ÖÖF G
.
ÜÜ 
	ForMember
ÜÜ 
(
ÜÜ 
dst
ÜÜ 
=>
ÜÜ !
dst
ÜÜ" %
.
ÜÜ% &
Id
ÜÜ& (
,
ÜÜ( )
opt
ÜÜ* -
=>
ÜÜ. 0
opt
ÜÜ1 4
.
ÜÜ4 5
MapFrom
ÜÜ5 <
(
ÜÜ< =
src
ÜÜ= @
=>
ÜÜA C
src
ÜÜD G
.
ÜÜG H
Id
ÜÜH J
)
ÜÜJ K
)
ÜÜK L
.
áá 
	ForMember
áá 
(
áá 
dst
áá 
=>
áá !
dst
áá" %
.
áá% &$
LocalEducationAgencyId
áá& <
,
áá< =
opt
áá> A
=>
ááB D
opt
ááE H
.
ááH I
MapFrom
ááI P
(
ááP Q
src
ááQ T
=>
ááU W
src
ááW Z
.
ááZ [$
LocalEducationAgencyId
áá[ q
)
ááq r
)
áár s
.
àà 
	ForMember
àà 
(
àà 
dst
àà 
=>
àà !
dst
àà" %
.
àà% &
NameOfInstitution
àà& 7
,
àà7 8
opt
àà9 <
=>
àà= ?
opt
àà@ C
.
ààC D
MapFrom
ààD K
(
ààK L
src
ààL O
=>
ààP R
src
ààS V
.
ààV W
Name
ààW [
)
àà[ \
)
àà\ ]
.
ââ 
	ForMember
ââ 
(
ââ 
dst
ââ 
=>
ââ !
dst
ââ" %
.
ââ% &4
&LocalEducationAgencyCategoryDescriptor
ââ& L
,
ââL M
opt
ââN Q
=>
ââR T
opt
ââU X
.
ââX Y
MapFrom
ââY `
(
ââ` a
src
ââa d
=>
ââe g
src
ââh k
.
ââk l/
 LocalEducationAgencyCategoryTypeââl å
)ââå ç
)ââç é
.
ää 
	ForMember
ää 
(
ää 
dst
ää 
=>
ää !
dst
ää" %
.
ää% &
	Addresses
ää& /
,
ää/ 0
opt
ää1 4
=>
ää5 7
opt
ää8 ;
.
ää; <
MapFrom
ää< C
<
ääC D1
#LocalEducationAgencyAddressResolver
ääD g
>
ääg h
(
ääh i
)
ääi j
)
ääj k
.
ãã 
	ForMember
ãã 
(
ãã 
dst
ãã 
=>
ãã !
dst
ãã" %
.
ãã% &+
StateEducationAgencyReference
ãã& C
,
ããC D
opt
ããE H
=>
ããI K
opt
ããL O
.
ããO P
MapFrom
ããP W
<
ããW X3
%StateEducationAgencyReferenceResolver
ããX }
>
ãã} ~
(
ãã~ 
)ãã Ä
)ããÄ Å
.
åå 
	ForMember
åå 
(
åå 
dst
åå 
=>
åå !
dst
åå" %
.
åå% &

Categories
åå& 0
,
åå0 1
opt
åå2 5
=>
åå6 8
opt
åå9 <
.
åå< =
MapFrom
åå= D
<
ååD E2
$LocalEducationAgencyCategoryResolver
ååE i
>
ååi j
(
ååj k
)
ååk l
)
åål m
.
çç 
ForCtorParam
çç 
(
çç 
$str
çç "
,
çç" #
opt
çç$ '
=>
çç( *
opt
çç+ .
.
çç. /
MapFrom
çç/ 6
(
çç6 7
src
çç7 :
=>
çç; =
src
çç> A
.
ççA B
Id
ççB D
)
ççD E
)
ççE F
.
éé 
ForCtorParam
éé 
(
éé 
$str
éé )
,
éé) *
opt
éé+ .
=>
éé/ 1
opt
éé2 5
.
éé5 6
MapFrom
éé6 =
(
éé= >
AddressResolver
éé> M
)
ééM N
)
ééN O
.
èè 
ForCtorParam
èè 
(
èè 
$str
èè *
,
èè* +
opt
èè, /
=>
èè0 2
opt
èè3 6
.
èè6 7
MapFrom
èè7 >
(
èè> ?3
%EducationOrganizationCategoryResolver
èè? d
.
èèd e
Resolve
èèe l
)
èèl m
)
èèm n
.
êê 
ForCtorParam
êê 
(
êê 
$str
êê 6
,
êê6 7
opt
êê8 ;
=>
êê< >
opt
êê? B
.
êêB C
MapFrom
êêC J
(
êêJ K
src
êêK N
=>
êêO Q
src
êêR U
.
êêU V$
LocalEducationAgencyId
êêV l
)
êêl m
)
êêm n
.
ëë 
ForCtorParam
ëë 
(
ëë 
$str
ëë F
,
ëëF G
opt
ëëH K
=>
ëëL N
opt
ëëO R
.
ëëR S
MapFrom
ëëS Z
(
ëëZ [
src
ëë[ ^
=>
ëë_ a
src
ëëb e
.
ëëe f/
 LocalEducationAgencyCategoryTypeëëf Ü
)ëëÜ á
)ëëá à
.
íí 
ForCtorParam
íí 
(
íí 
$str
íí 1
,
íí1 2
opt
íí3 6
=>
íí7 9
opt
íí: =
.
íí= >
MapFrom
íí> E
(
ííE F
src
ííF I
=>
ííJ L
src
ííM P
.
ííP Q
Name
ííQ U
)
ííU V
)
ííV W
.
ìì 
ForCtorParam
ìì 
(
ìì 
$str
ìì =
,
ìì= >
opt
ìì? B
=>
ììC E
opt
ììF I
.
ììI J
MapFrom
ììJ Q
(
ììQ R3
%StateEducationAgencyReferenceResolver
ììR w
.
ììw x
Resolve
ììx 
)ìì Ä
)ììÄ Å
;ììÅ Ç
	CreateMap
ïï 
<
ïï &
PostSecondaryInstitution
ïï .
,
ïï. /*
EdFiPostSecondaryInstitution
ïï0 L
>
ïïL M
(
ïïM N
)
ïïN O
.
ññ 
	ForMember
ññ 
(
ññ 
dst
ññ 
=>
ññ !
dst
ññ" %
.
ññ% &
Id
ññ& (
,
ññ( )
opt
ññ* -
=>
ññ. 0
opt
ññ1 4
.
ññ4 5
MapFrom
ññ5 <
(
ññ< =
src
ññ= @
=>
ññA C
src
ññD G
.
ññG H
Id
ññH J
)
ññJ K
)
ññK L
.
óó 
	ForMember
óó 
(
óó 
dst
óó 
=>
óó !
dst
óó" %
.
óó% &(
PostSecondaryInstitutionId
óó& @
,
óó@ A
opt
óóB E
=>
óóF H
opt
óóI L
.
óóL M
MapFrom
óóM T
(
óóT U
src
óóU X
=>
óóY [
src
óó\ _
.
óó_ `(
PostSecondaryInstitutionId
óó` z
)
óóz {
)
óó{ |
.
òò 
	ForMember
òò 
(
òò 
dst
òò 
=>
òò !
dst
òò" %
.
òò% &
NameOfInstitution
òò& 7
,
òò7 8
opt
òò9 <
=>
òò= ?
opt
òò@ C
.
òòC D
MapFrom
òòD K
(
òòK L
src
òòL O
=>
òòP R
src
òòS V
.
òòV W
Name
òòW [
)
òò[ \
)
òò\ ]
.
ôô 
	ForMember
ôô 
(
ôô 
dst
ôô 
=>
ôô !
dst
ôô" %
.
ôô% &5
'PostSecondaryInstitutionLevelDescriptor
ôô& M
,
ôôM N
opt
ôôO R
=>
ôôS U
opt
ôôV Y
.
ôôY Z
MapFrom
ôôZ a
(
ôôa b
src
ôôb e
=>
ôôf h
src
ôôi l
.
ôôl m,
PostSecondaryInstitutionLevelôôm ä
)ôôä ã
)ôôã å
.
öö 
	ForMember
öö 
(
öö 
dst
öö 
=>
öö !
dst
öö" %
.
öö% &4
&AdministrativeFundingControlDescriptor
öö& L
,
ööL M
opt
ööN Q
=>
ööR T
opt
ööU X
.
ööX Y
MapFrom
ööY `
(
öö` a
src
ööa d
=>
ööe g
src
ööh k
.
öök l+
AdministrativeFundingControlööl à
)ööà â
)ööâ ä
.
õõ 
	ForMember
õõ 
(
õõ 
dst
õõ 
=>
õõ !
dst
õõ" %
.
õõ% &
	Addresses
õõ& /
,
õõ/ 0
opt
õõ1 4
=>
õõ5 7
opt
õõ8 ;
.
õõ; <
MapFrom
õõ< C
<
õõC D5
'PostSecondaryInstitutionAddressResolver
õõD k
>
õõk l
(
õõl m
)
õõm n
)
õõn o
.
úú 
	ForMember
úú 
(
úú 
dst
úú 
=>
úú !
dst
úú" %
.
úú% &

Categories
úú& 0
,
úú0 1
opt
úú2 5
=>
úú6 8
opt
úú9 <
.
úú< =
MapFrom
úú= D
<
úúD E6
(PostSecondaryInstitutionCategoryResolver
úúE m
>
úúm n
(
úún o
)
úúo p
)
úúp q
.
ùù 
ForCtorParam
ùù 
(
ùù 
$str
ùù "
,
ùù" #
opt
ùù$ '
=>
ùù( *
opt
ùù+ .
.
ùù. /
MapFrom
ùù/ 6
(
ùù6 7
src
ùù7 :
=>
ùù; =
src
ùù> A
.
ùùA B
Id
ùùB D
)
ùùD E
)
ùùE F
.
ûû 
ForCtorParam
ûû 
(
ûû 
$str
ûû )
,
ûû) *
opt
ûû+ .
=>
ûû/ 1
opt
ûû2 5
.
ûû5 6
MapFrom
ûû6 =
(
ûû= >
AddressResolver
ûû> M
)
ûûM N
)
ûûN O
.
üü 
ForCtorParam
üü 
(
üü 
$str
üü *
,
üü* +
opt
üü, /
=>
üü0 2
opt
üü3 6
.
üü6 7
MapFrom
üü7 >
(
üü> ?3
%EducationOrganizationCategoryResolver
üü? d
.
üüd e
Resolve
üüe l
)
üül m
)
üüm n
.
†† 
ForCtorParam
†† 
(
†† 
$str
†† :
,
††: ;
opt
††< ?
=>
††@ B
opt
††C F
.
††F G
MapFrom
††G N
(
††N O
src
††O R
=>
††S U
src
††V Y
.
††Y Z(
PostSecondaryInstitutionId
††Z t
)
††t u
)
††u v
.
°° 
ForCtorParam
°° 
(
°° 
$str
°° G
,
°°G H
opt
°°I L
=>
°°M O
opt
°°P S
.
°°S T
MapFrom
°°T [
(
°°[ \
src
°°\ _
=>
°°` b
src
°°c f
.
°°f g,
PostSecondaryInstitutionLevel°°g Ñ
)°°Ñ Ö
)°°Ö Ü
.
¢¢ 
ForCtorParam
¢¢ 
(
¢¢ 
$str
¢¢ F
,
¢¢F G
opt
¢¢H K
=>
¢¢L N
opt
¢¢O R
.
¢¢R S
MapFrom
¢¢S Z
(
¢¢Z [
src
¢¢[ ^
=>
¢¢_ a
src
¢¢b e
.
¢¢e f+
AdministrativeFundingControl¢¢f Ç
)¢¢Ç É
)¢¢É Ñ
.
££ 
ForCtorParam
££ 
(
££ 
$str
££ 1
,
££1 2
opt
££3 6
=>
££7 9
opt
££: =
.
££= >
MapFrom
££> E
(
££E F
src
££F I
=>
££J L
src
££M P
.
££P Q
Name
££Q U
)
££U V
)
££V W
;
££W X
	CreateMap
•• 
<
•• $
SecurityCompatiblity53
•• ,
.
••, -

DataAccess
••- 7
.
••7 8
Models
••8 >
.
••> ?#
AuthorizationStrategy
••? T
,
••T U
ClaimSetEditor
••V d
.
••d e#
AuthorizationStrategy
••e z
>
••z {
(
••{ |
)
••| }
.
¶¶ 
	ForMember
¶¶ 
(
¶¶ 
dst
¶¶ 
=>
¶¶ 
dst
¶¶  #
.
¶¶# $
AuthStrategyName
¶¶$ 4
,
¶¶4 5
opt
¶¶6 9
=>
¶¶: <
opt
¶¶= @
.
¶¶@ A
MapFrom
¶¶A H
(
¶¶H I
src
¶¶I L
=>
¶¶M O
src
¶¶P S
.
¶¶S T'
AuthorizationStrategyName
¶¶T m
)
¶¶m n
)
¶¶n o
.
ßß 
	ForMember
ßß 
(
ßß 
dst
ßß 
=>
ßß 
dst
ßß  #
.
ßß# $
AuthStrategyId
ßß$ 2
,
ßß2 3
opt
ßß4 7
=>
ßß8 :
opt
ßß; >
.
ßß> ?
MapFrom
ßß? F
(
ßßF G
src
ßßG J
=>
ßßK M
src
ßßN Q
.
ßßQ R%
AuthorizationStrategyId
ßßR i
)
ßßi j
)
ßßj k
.
®® 
	ForMember
®® 
(
®® 
dst
®® 
=>
®® 
dst
®®  #
.
®®# $#
IsInheritedFromParent
®®$ 9
,
®®9 :
opt
®®; >
=>
®®? A
opt
®®B E
.
®®E F
Ignore
®®F L
(
®®L M
)
®®M N
)
®®N O
;
®®O P
	CreateMap
™™ 
<
™™ 
Security
™™ 
.
™™ 

DataAccess
™™ )
.
™™) *
Models
™™* 0
.
™™0 1#
AuthorizationStrategy
™™1 F
,
™™F G
ClaimSetEditor
™™H V
.
™™V W#
AuthorizationStrategy
™™W l
>
™™l m
(
™™m n
)
™™n o
.
´´ 
	ForMember
´´ 
(
´´ 
dst
´´ 
=>
´´ !
dst
´´" %
.
´´% &
AuthStrategyName
´´& 6
,
´´6 7
opt
´´8 ;
=>
´´< >
opt
´´? B
.
´´B C
MapFrom
´´C J
(
´´J K
src
´´K N
=>
´´O Q
src
´´R U
.
´´U V'
AuthorizationStrategyName
´´V o
)
´´o p
)
´´p q
.
¨¨ 
	ForMember
¨¨ 
(
¨¨ 
dst
¨¨ 
=>
¨¨ !
dst
¨¨" %
.
¨¨% &
AuthStrategyId
¨¨& 4
,
¨¨4 5
opt
¨¨6 9
=>
¨¨: <
opt
¨¨= @
.
¨¨@ A
MapFrom
¨¨A H
(
¨¨H I
src
¨¨I L
=>
¨¨M O
src
¨¨P S
.
¨¨S T%
AuthorizationStrategyId
¨¨T k
)
¨¨k l
)
¨¨l m
.
≠≠ 
	ForMember
≠≠ 
(
≠≠ 
dst
≠≠ 
=>
≠≠ !
dst
≠≠" %
.
≠≠% &#
IsInheritedFromParent
≠≠& ;
,
≠≠; <
opt
≠≠= @
=>
≠≠A C
opt
≠≠D G
.
≠≠G H
Ignore
≠≠H N
(
≠≠N O
)
≠≠O P
)
≠≠P Q
;
≠≠Q R
List
ØØ 
<
ØØ .
 EdFiEducationOrganizationAddress
ØØ 1
>
ØØ1 2
AddressResolver
ØØ3 B
(
ØØB C#
EducationOrganization
ØØC X
source
ØØY _
,
ØØ_ `
ResolutionContext
∞∞ !
context
∞∞" )
)
∞∞) *
=>
±± 2
$EducationOrganizationAddressResolver
±± 7
.
±±7 8
Resolve
±±8 ?
(
±±? @
source
±±@ F
)
±±F G
;
±±G H
}
≤≤ 	
}
≥≥ 
}¥¥ ±:
yC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Automapper\EducationOrganizationAddressResolver.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +

Automapper+ 5
{ 
public 

class !
SchoolAddressResolver &
:' (
IValueResolver) 7
<7 8
School8 >
,> ?

EdFiSchool@ J
,J K
ListL P
<P Q,
 EdFiEducationOrganizationAddressQ q
>q r
>r s
{ 
public 
List 
< ,
 EdFiEducationOrganizationAddress 4
>4 5
Resolve6 =
(= >
School> D
sourceE K
,K L

EdFiSchoolM W
destinationX c
,c d
Liste i
<i j-
 EdFiEducationOrganizationAddress	j ä
>
ä ã

destMember
å ñ
,
ñ ó
ResolutionContext
ò ©
context
™ ±
)
± ≤
{ 	
var 
addressList 
= 0
$EducationOrganizationAddressResolver B
.B C%
ReplaceFirstAddressInListC \
(\ ]
source] c
,c d

destMembere o
)o p
;p q

destMember 
? 
. 
Clear 
( 
) 
;  
return 
addressList 
; 
} 	
} 
public 

class /
#LocalEducationAgencyAddressResolver 4
:5 6
IValueResolver7 E
<E F 
LocalEducationAgencyF Z
,Z [$
EdFiLocalEducationAgency\ t
,t u
Listv z
<z {-
 EdFiEducationOrganizationAddress	{ õ
>
õ ú
>
ú ù
{ 
public 
List 
< ,
 EdFiEducationOrganizationAddress 4
>4 5
Resolve6 =
(= > 
LocalEducationAgency> R
sourceS Y
,Y Z$
EdFiLocalEducationAgency $
destination% 0
,0 1
List2 6
<6 7,
 EdFiEducationOrganizationAddress7 W
>W X

destMemberY c
,c d
ResolutionContext 
context %
)% &
{   	
var!! 
addressList!! 
=!! 0
$EducationOrganizationAddressResolver!! B
.!!B C%
ReplaceFirstAddressInList!!C \
(!!\ ]
source!!] c
,!!c d

destMember!!e o
)!!o p
;!!p q

destMember"" 
?"" 
."" 
Clear"" 
("" 
)"" 
;""  
return## 
addressList## 
;## 
}$$ 	
}%% 
public'' 

class'' 3
'PostSecondaryInstitutionAddressResolver'' 8
:''9 :
IValueResolver''; I
<''I J$
PostSecondaryInstitution''J b
,''b c)
EdFiPostSecondaryInstitution	''d Ä
,
''Ä Å
List
''Ç Ü
<
''Ü á.
 EdFiEducationOrganizationAddress
''á ß
>
''ß ®
>
''® ©
{(( 
public)) 
List)) 
<)) ,
 EdFiEducationOrganizationAddress)) 4
>))4 5
Resolve))6 =
())= >$
PostSecondaryInstitution))> V
source))W ]
,))] ^(
EdFiPostSecondaryInstitution** (
destination**) 4
,**4 5
List**6 :
<**: ;,
 EdFiEducationOrganizationAddress**; [
>**[ \

destMember**] g
,**g h
ResolutionContext++ 
context++ %
)++% &
{,, 	
var-- 
addressList-- 
=-- 0
$EducationOrganizationAddressResolver-- B
.--B C%
ReplaceFirstAddressInList--C \
(--\ ]
source--] c
,--c d

destMember--e o
)--o p
;--p q

destMember.. 
?.. 
... 
Clear.. 
(.. 
).. 
;..  
return// 
addressList// 
;// 
}00 	
}11 
public33 

static33 
class33 0
$EducationOrganizationAddressResolver33 <
{44 
public55 
static55 
List55 
<55 ,
 EdFiEducationOrganizationAddress55 ;
>55; <%
ReplaceFirstAddressInList55= V
(55V W!
EducationOrganization55W l
source55m s
,55s t
ICollection66 
<66 ,
 EdFiEducationOrganizationAddress66 8
>668 9
originalList66: F
)66F G
{77 	
var88 
addressList88 
=88 
originalList88 *
?88* +
.88+ ,
ToList88, 2
(882 3
)883 4
??885 7
new888 ;
List88< @
<88@ A,
 EdFiEducationOrganizationAddress88A a
>88a b
(88b c
)88c d
;88d e
originalList99 
?99 
.99 
Clear99 
(99  
)99  !
;99! "
var;; 
address;; 
=;; 
Resolve;; !
(;;! "
source;;" (
);;( )
[;;) *
$num;;* +
];;+ ,
;;;, -
if== 
(== 
addressList== 
.== 
Any== 
(==  
)==  !
)==! "
{>> 
addressList?? 
[?? 
$num?? 
]?? 
=??  
address??! (
;??( )
}@@ 
elseAA 
{BB 
addressListCC 
.CC 
AddCC 
(CC  
addressCC  '
)CC' (
;CC( )
}DD 
returnFF 
addressListFF 
;FF 
}GG 	
publicII 
staticII 
ListII 
<II ,
 EdFiEducationOrganizationAddressII ;
>II; <
ResolveII= D
(IID E!
EducationOrganizationIIE Z
sourceII[ a
)IIa b
{JJ 	
varKK 
addressKK 
=KK 
newKK ,
 EdFiEducationOrganizationAddressKK >
(KK> ?
$strLL 8
+LL9 :
AddressTypeLL; F
.LLF G
PhysicalLLG O
,LLO P'
stateAbbreviationDescriptorMM +
:MM+ ,
sourceMM- 3
.MM3 4
StateMM4 9
,MM9 :$
apartmentRoomSuiteNumberNN (
:NN( )
sourceNN* 0
.NN0 1$
ApartmentRoomSuiteNumberNN1 I
,NNI J
streetNumberNameOO  
:OO  !
sourceOO" (
.OO( )
StreetNumberNameOO) 9
,OO9 :
cityPP 
:PP 
sourcePP 
.PP 
CityPP !
,PP! "

postalCodeQQ 
:QQ 
sourceQQ "
.QQ" #
ZipCodeQQ# *
)QQ* +
;QQ+ ,
returnSS 
newSS 
ListSS 
<SS ,
 EdFiEducationOrganizationAddressSS <
>SS< =
{TT 
addressUU 
}VV 
;VV 
}WW 	
}XX 
}YY ˇ3
zC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Automapper\EducationOrganizationCategoryResolver.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +

Automapper+ 5
{ 
public 

class "
SchoolCategoryResolver '
:( )
IValueResolver* 8
<8 9
School9 ?
,? @

EdFiSchoolA K
,K L
ListM Q
<Q R-
!EdFiEducationOrganizationCategoryR s
>s t
>t u
{ 
public 
List 
< -
!EdFiEducationOrganizationCategory 5
>5 6
Resolve7 >
(> ?
School? E
sourceF L
,L M

EdFiSchoolN X
destinationY d
,d e
List 
< -
!EdFiEducationOrganizationCategory 2
>2 3

destMember4 >
,> ?
ResolutionContext@ Q
contextR Y
)Y Z
{ 	

destMember 
? 
. 
Clear 
( 
) 
;  
return 1
%EducationOrganizationCategoryResolver 8
.8 9#
GetNewEducationCategory9 P
(P Q
sourceQ W
.W X)
EducationOrganizationCategoryX u
)u v
;v w
} 	
} 
public 

class 0
$LocalEducationAgencyCategoryResolver 5
:6 7
IValueResolver8 F
<F G 
LocalEducationAgencyG [
,[ \$
EdFiLocalEducationAgency] u
,u v
Listw {
<{ |.
!EdFiEducationOrganizationCategory	| ù
>
ù û
>
û ü
{ 
public 
List 
< -
!EdFiEducationOrganizationCategory 5
>5 6
Resolve7 >
(> ? 
LocalEducationAgency? S
sourceT Z
,Z [$
EdFiLocalEducationAgency\ t
destination	u Ä
,
Ä Å
List
Ç Ü
<
Ü á/
!EdFiEducationOrganizationCategory
á ®
>
® ©

destMember
™ ¥
,
¥ µ
ResolutionContext
∂ «
context
» œ
)
œ –
{ 	

destMember 
? 
. 
Clear 
( 
) 
;  
return 1
%EducationOrganizationCategoryResolver 8
.8 9#
GetNewEducationCategory9 P
(P Q
sourceQ W
.W X)
EducationOrganizationCategoryX u
)u v
;v w
} 	
}   
public"" 

class"" 4
(PostSecondaryInstitutionCategoryResolver"" 9
:"": ;
IValueResolver""< J
<""J K$
PostSecondaryInstitution""K c
,""c d)
EdFiPostSecondaryInstitution	""e Å
,
""Å Ç
List
""É á
<
""á à/
!EdFiEducationOrganizationCategory
""à ©
>
""© ™
>
""™ ´
{## 
public$$ 
List$$ 
<$$ -
!EdFiEducationOrganizationCategory$$ 5
>$$5 6
Resolve$$7 >
($$> ?$
PostSecondaryInstitution$$? W
source$$X ^
,$$^ _(
EdFiPostSecondaryInstitution$$` |
destination	$$} à
,
$$à â
List
$$ä é
<
$$é è/
!EdFiEducationOrganizationCategory
$$è ∞
>
$$∞ ±

destMember
$$≤ º
,
$$º Ω
ResolutionContext
$$æ œ
context
$$– ◊
)
$$◊ ÿ
{%% 	

destMember&& 
?&& 
.&& 
Clear&& 
(&& 
)&& 
;&&  
return'' 1
%EducationOrganizationCategoryResolver'' 8
.''8 9#
GetNewEducationCategory''9 P
(''P Q
source''Q W
.''W X)
EducationOrganizationCategory''X u
)''u v
;''v w
}(( 	
})) 
public++ 

static++ 
class++ 1
%EducationOrganizationCategoryResolver++ =
{,, 
public-- 
static-- 
List-- 
<-- -
!EdFiEducationOrganizationCategory-- <
>--< =#
GetNewEducationCategory--> U
(--U V
string--V \
newCategory--] h
)--h i
{.. 	
var// -
!edFiEducationOrganizationCategory// 1
=//2 3
new00 -
!EdFiEducationOrganizationCategory00 5
(005 6
$str006 p
+00q r
newCategory116 A
)11A B
;11B C
return22 
new22 
List22 
<22 -
!EdFiEducationOrganizationCategory22 =
>22= >
{33 -
!edFiEducationOrganizationCategory44 1
}55 
;55 
}66 	
public88 
static88 
List88 
<88 -
!EdFiEducationOrganizationCategory88 <
>88< =
Resolve88> E
(88E F 
LocalEducationAgency88F Z
source88[ a
,88a b
ResolutionContext88c t
context88u |
)88| }
{99 	
return:: #
GetNewEducationCategory:: *
(::* +
source::+ 1
.::1 2)
EducationOrganizationCategory::2 O
)::O P
;::P Q
};; 	
public== 
static== 
List== 
<== -
!EdFiEducationOrganizationCategory== <
>==< =
Resolve==> E
(==E F
School==F L
source==M S
,==S T
ResolutionContext==U f
context==g n
)==n o
{>> 	
return?? #
GetNewEducationCategory?? *
(??* +
source??+ 1
.??1 2)
EducationOrganizationCategory??2 O
)??O P
;??P Q
}@@ 	
publicBB 
staticBB 
ListBB 
<BB -
!EdFiEducationOrganizationCategoryBB <
>BB< =
ResolveBB> E
(BBE F$
PostSecondaryInstitutionBBF ^
sourceBB_ e
,BBe f
ResolutionContextBBg x
context	BBy Ä
)
BBÄ Å
{CC 	
returnDD #
GetNewEducationCategoryDD *
(DD* +
sourceDD+ 1
.DD1 2)
EducationOrganizationCategoryDD2 O
)DDO P
;DDP Q
}EE 	
}FF 
}GG Ó
zC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Automapper\LocalEducationAgencyReferenceResolver.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Api

' *
.

* +

Automapper

+ 5
{ 
public 

class 1
%LocalEducationAgencyReferenceResolver 6
:7 8
IValueResolver9 G
<G H
SchoolH N
,N O

EdFiSchoolP Z
,Z [-
!EdFiLocalEducationAgencyReference\ }
>} ~
{ 
public -
!EdFiLocalEducationAgencyReference 0
Resolve1 8
(8 9
School9 ?
source@ F
,F G

EdFiSchoolH R
destinationS ^
,^ _.
!EdFiLocalEducationAgencyReference	` Å

destMember
Ç å
,
å ç
ResolutionContext 
context %
)% &
{ 	
var 
id 
= 
source 
. "
LocalEducationAgencyId 2
??3 5
destination6 A
.A B)
LocalEducationAgencyReferenceB _
?_ `
.` a"
LocalEducationAgencyIda w
;w x
return 
id 
!= 
null 
? 
new  #-
!EdFiLocalEducationAgencyReference$ E
(E F
idF H
)H I
:J K
nullM Q
;Q R
} 	
public 
static -
!EdFiLocalEducationAgencyReference 7
Resolve8 ?
(? @
School@ F
sourceG M
,M N
ResolutionContextO `
contexta h
)h i
{ 	
var 
id 
= 
source 
. "
LocalEducationAgencyId 2
;2 3
return 
id 
!= 
null 
? 
new  #-
!EdFiLocalEducationAgencyReference$ E
(E F
idF H
)H I
:J K
nullL P
;P Q
} 	
} 
} Ç
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Automapper\SchoolExtensionsResolver.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Api

' *
.

* +

Automapper

+ 5
{ 
public 

class $
SchoolExtensionsResolver )
:* +
IValueResolver, :
<: ;
School; A
,A B

EdFiSchoolC M
,M N
SchoolExtensionsO _
>_ `
{ 
public 
SchoolExtensions 
Resolve  '
(' (
School( .
source/ 5
,5 6

EdFiSchool7 A
destinationB M
,M N
SchoolExtensionsO _

destMember` j
,j k
ResolutionContext 
context %
)% &
{ 	
var 
psiId 
= 
source 
. &
PostSecondaryInstitutionId 9
??: <
destination= H
.H I
_extI M
?M N
.N O
TPDMO S
?S T
.T U-
!PostSecondaryInstitutionReferenceU v
?v w
.w x'
PostSecondaryInstitutionId	x í
;
í ì
var -
!postSecondaryInstitutionReference 1
=2 3
psiId4 9
!=: <
null= A
?B C
newD G1
%EdFiPostSecondaryInstitutionReferenceH m
(m n
psiIdn s
)s t
:u v
nullw {
;{ |
var 
tpdmExtension 
= 
new  #
TpdmSchoolExtension$ 7
(7 8
source8 >
.> ?
AccreditationStatus? R
,R S
sourceT Z
.Z [
FederalLocaleCode[ l
,l m
sourcen t
.t u
ImprovingSchool	u Ñ
,
Ñ Ö/
!postSecondaryInstitutionReference
Ü ß
)
ß ®
;
® ©
var 
schoolExtensions  
=! "
new# &
SchoolExtensions' 7
(7 8
tpdmExtension8 E
)E F
;F G
return 
schoolExtensions #
;# $
} 	
} 
} û
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Automapper\SchoolGradeLevelResolver.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +

Automapper+ 5
{ 
public 

class $
SchoolGradeLevelResolver )
:* +
IValueResolver, :
<: ;
School; A
,A B

EdFiSchoolC M
,M N
ListO S
<S T 
EdFiSchoolGradeLevelT h
>h i
>i j
{ 
public 
List 
<  
EdFiSchoolGradeLevel (
>( )
Resolve* 1
(1 2
School2 8
source9 ?
,? @

EdFiSchoolA K
destinationL W
,W X
ListY ]
<] ^ 
EdFiSchoolGradeLevel^ r
>r s

destMembert ~
,~ 
ResolutionContext
Ä ë
context
í ô
)
ô ö
{ 	

destMember 
? 
. 
Clear 
( 
) 
;  
return 
source 
. 
GradeLevels %
?% &
.& '
Select' -
(- .
x. /
=>0 2
new3 6 
EdFiSchoolGradeLevel7 K
(K L
xL M
)M N
)N O
.O P
ToListP V
(V W
)W X
;X Y
} 	
public 
static 
List 
<  
EdFiSchoolGradeLevel /
>/ 0
Resolve1 8
(8 9
School9 ?
source@ F
,F G
ResolutionContextH Y
contextZ a
)a b
{ 	
return 
source 
. 
GradeLevels %
?% &
.& '
Select' -
(- .
x. /
=>0 2
new3 6 
EdFiSchoolGradeLevel7 K
(K L
xL M
)M N
)N O
.O P
ToListP V
(V W
)W X
;X Y
} 	
} 
} ¨
zC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Automapper\StateEducationAgencyReferenceResolver.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Api

' *
.

* +

Automapper

+ 5
{ 
public 

class 1
%StateEducationAgencyReferenceResolver 6
:7 8
IValueResolver9 G
<G H 
LocalEducationAgencyH \
,\ ]$
EdFiLocalEducationAgency^ v
,v w.
!EdFiStateEducationAgencyReference	x ô
>
ô ö
{ 
public -
!EdFiStateEducationAgencyReference 0
Resolve1 8
(8 9 
LocalEducationAgency9 M
sourceN T
,T U$
EdFiLocalEducationAgency $
destination% 0
,0 1-
!EdFiStateEducationAgencyReference2 S

destMemberT ^
,^ _
ResolutionContext 
context %
)% &
{ 	
var 
id 
= 
source 
. 
StateOrganizationId /
??0 2
destination3 >
.> ?)
StateEducationAgencyReference? \
?\ ]
.] ^"
StateEducationAgencyId^ t
;t u
return 
id 
!= 
null 
? 
new  #-
!EdFiStateEducationAgencyReference$ E
(E F
idF H
)H I
:J K
nullL P
;P Q
} 	
public 
static -
!EdFiStateEducationAgencyReference 7
Resolve8 ?
(? @ 
LocalEducationAgency@ T
sourceU [
,[ \
ResolutionContext] n
contexto v
)v w
{ 	
var 
id 
= 
source 
. 
StateOrganizationId /
;/ 0
return 
id 
!= 
null 
? 
new  #-
!EdFiStateEducationAgencyReference$ E
(E F
idF H
)H I
:J K
nullL P
;P Q
} 	
} 
} †
lC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Common\ArgumentValidationException.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Common+ 1
{		 
[

 
Serializable

 
]

 
public 

class '
ArgumentValidationException ,
:- .
	Exception/ 8
{ 
public '
ArgumentValidationException *
(* +
string+ 1
message2 9
)9 :
:; <
base= A
(A B
messageB I
)I J
{ 	
} 	
} 
} ∞
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Common\ArgumentValidationExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Common+ 1
{		 
public

 

static

 
class

 (
ArgumentValidationExtensions

 4
{ 
public 
static 
T 

IsRequired "
<" #
T# $
>$ %
(% &
this& *
T+ ,
o- .
,. /
string0 6
	paramName7 @
,@ A
stringB H
resourceI Q
)Q R
{ 	
if 
( 
EqualityComparer  
<  !
T! "
>" #
.# $
Default$ +
.+ ,
Equals, 2
(2 3
o3 4
,4 5
default6 =
(= >
T> ?
)? @
)@ A
)A B
throw 
new '
ArgumentValidationException 5
(5 6
$"6 8
{8 9
	paramName9 B
}B C
$strC _
{_ `
resource` h
}h i
$stri |
"| }
)} ~
;~ 
return 
o 
; 
} 	
public 
static 
string 
	MaxLength &
(& '
this' +
string, 2
o3 4
,4 5
int6 9
	maxLength: C
,C D
stringE K
	paramNameL U
,U V
stringW ]
resource^ f
)f g
{ 	
if 
( 
o 
!= 
null 
&& 
o 
. 
Length %
>& '
	maxLength( 1
)1 2
throw 
new '
ArgumentValidationException 5
(5 6
$"6 8
$str8 J
{J K
	paramNameK T
}T U
$strU Y
{Y Z
resourceZ b
}b c
$strc ~
{~ 
	maxLength	 à
}
à â
"
â ä
)
ä ã
;
ã å
return 
o 
; 
} 	
} 
} ™
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Common\ResourcePaths.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Common+ 1
{ 
public 

class 
ResourcePaths 
{		 
public

 
const

 
string

 
Schools

 #
=

$ %
$str

& 6
;

6 7
public 
const 
string 3
'LocalEducationAgencyCategoryDescriptors C
=D E
$strF v
;v w
public 
const 
string "
LocalEducationAgencies 2
=3 4
$str5 T
;T U
public 
const 
string !
GradeLevelDescriptors 1
=2 3
$str4 R
;R S
public 
const 
string $
LocalEducationAgencyById 4
=5 6
$str7 [
;[ \
public 
const 
string 

SchoolById &
=' (
$str) >
;> ?
public 
const 
string (
StateAbbreviationDescriptors 8
=9 :
$str; `
;` a
public 
const 
string %
PostSecondaryInstitutions 5
=6 7
$str8 Z
;Z [
public 
const 
string (
PostSecondaryInstitutionById 8
=9 :
$str; b
;b c
public 
const 
string 4
(PostSecondaryInstitutionLevelDescriptors D
=E F
$strG x
;x y
public 
const 
string 3
'AdministrativeFundingControlDescriptors C
=D E
$strF v
;v w
public 
const 
string *
AccreditationStatusDescriptors :
=; <
$str= c
;c d
public 
const 
string (
FederalLocaleCodeDescriptors 8
=9 :
$str; _
;_ `
} 
} ú
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Descriptors\GradeLevelOrder.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Descriptors+ 6
{ 
public 

static 
class 
GradeLevelOrder '
{		 
public 
static 
int 
GetDefaultSortValue -
(- .
string. 4
gradeLevelCodeValue5 H
)H I
{ 	
switch 
( 
gradeLevelCodeValue '
)' (
{ 
case 
$str &
:& '
return 
- 
$num 
; 
case 
$str %
:% &
return 
- 
$num 
; 
case 
$str 0
:0 1
return 
- 
$num 
; 
case 
$str #
:# $
return 
$num 
; 
case 
$str "
:" #
return 
$num 
; 
case 
$str #
:# $
return 
$num 
; 
case 
$str "
:" #
return 
$num 
; 
case   
$str   #
:  # $
return!! 
$num!! 
;!! 
case"" 
$str"" "
:""" #
return## 
$num## 
;## 
case$$ 
$str$$ "
:$$" #
return%% 
$num%% 
;%% 
case&& 
$str&& $
:&&$ %
return'' 
$num'' 
;'' 
case(( 
$str(( #
:((# $
return)) 
$num)) 
;)) 
case** 
$str** "
:**" #
return++ 
$num++ 
;++ 
case,, 
$str,, "
:,," #
return-- 
$num-- 
;-- 
case.. 
$str.. %
:..% &
return// 
$num// 
;// 
case00 
$str00 $
:00$ %
return11 
$num11 
;11 
case22 
$str22 $
:22$ %
return33 
$num33 
;33 
case44 
$str44 
:44  
return55 
$num55 
;55 
case66 
$str66 
:66 
return77 
$num77 
;77 
case88 
$str88 
:88  
return99 
$num99 
;99 
case:: 
$str:: &
:::& '
return;; 
$num;; 
;;; 
default<< 
:<< 
return== 
$num== 
;== 
}>> 
}?? 	
}@@ 
}AA ó
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiDescriptor.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{ 
public 

class 
EdFiDescriptor 
{		 
public

 
string

 
	CodeValue

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 
	Namespace 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ö
wC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiEducationOrganizationAddress.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{		 
public

 

class

 ,
 EdFiEducationOrganizationAddress

 1
{ 
public ,
 EdFiEducationOrganizationAddress /
(/ 0
string !
addressTypeDescriptor (
,( )
string '
stateAbbreviationDescriptor .
,. /
string 
city 
, 
string 

postalCode 
, 
string 
streetNumberName #
,# $
string $
apartmentRoomSuiteNumber +
=, -
null. 2
) 	
{ 	
var 
resourceName 
= 
GetType &
(& '
)' (
.( )
Name) -
;- .!
AddressTypeDescriptor !
=" #!
addressTypeDescriptor$ 9
.9 :

IsRequired: D
(D E
nameofE K
(K L!
addressTypeDescriptorL a
)a b
,b c
resourceNamed p
)p q
;q r'
StateAbbreviationDescriptor '
=( )'
stateAbbreviationDescriptor* E
.E F

IsRequiredF P
(P Q
nameofQ W
(W X'
stateAbbreviationDescriptorX s
)s t
,t u
resourceName	v Ç
)
Ç É
;
É Ñ
City 
= 
city 
. 

IsRequired "
(" #
nameof# )
() *
city* .
). /
,/ 0
resourceName1 =
)= >
;> ?

PostalCode 
= 

postalCode #
.# $

IsRequired$ .
(. /
nameof/ 5
(5 6

postalCode6 @
)@ A
,A B
resourceNameC O
)O P
;P Q
StreetNumberName 
= 
streetNumberName /
./ 0

IsRequired0 :
(: ;
nameof; A
(A B
streetNumberNameB R
)R S
,S T
resourceNameU a
)a b
;b c$
ApartmentRoomSuiteNumber $
=% &$
apartmentRoomSuiteNumber' ?
;? @
} 	
public 
string !
AddressTypeDescriptor +
{, -
get. 1
;1 2
}3 4
public 
string '
StateAbbreviationDescriptor 1
{2 3
get4 7
;7 8
}9 :
public   
string   $
ApartmentRoomSuiteNumber   .
{  / 0
get  1 4
;  4 5
}  7 8
public!! 
string!! 
City!! 
{!! 
get!!  
;!!  !
}!!" #
public"" 
string"" 

PostalCode""  
{""! "
get""# &
;""& '
}""( )
public## 
string## 
StreetNumberName## &
{##' (
get##) ,
;##, -
}##. /
}$$ 
}%% ﬁ	
xC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiEducationOrganizationCategory.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{		 
public

 

class

 -
!EdFiEducationOrganizationCategory

 2
{ 
public -
!EdFiEducationOrganizationCategory 0
(0 1
string1 73
'educationOrganizationCategoryDescriptor8 _
)_ `
{ 	3
'EducationOrganizationCategoryDescriptor 3
=4 53
'educationOrganizationCategoryDescriptor 7
.7 8

IsRequired8 B
(B C
nameofC I
(I J3
'educationOrganizationCategoryDescriptorJ q
)q r
,r s
GetType 
( 
) 
. 
Name "
)" #
;# $
} 	
public 
string 3
'EducationOrganizationCategoryDescriptor =
{> ?
get@ C
;C D
}E F
} 
} •"
oC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiLocalEducationAgency.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Api		' *
.		* +
DomainModels		+ 7
{

 
public 

class $
EdFiLocalEducationAgency )
{ 
public $
EdFiLocalEducationAgency '
(' (
string 
id 
, 
List 
< ,
 EdFiEducationOrganizationAddress 1
>1 2
	addresses3 <
,< =
List 
< -
!EdFiEducationOrganizationCategory 2
>2 3

categories4 >
,> ?
int 
? "
localEducationAgencyId '
,' (
string 2
&localEducationAgencyCategoryDescriptor 9
,9 :
string 
nameOfInstitution $
,$ %-
!EdFiStateEducationAgencyReference -)
stateEducationAgencyReference. K
=L M
nullN R
) 	
{ 	
var 
resourceName 
= 
GetType &
(& '
)' (
.( )
Name) -
;- .
Id 
= 
id 
. 

IsRequired 
( 
nameof %
(% &
Id& (
)( )
,) *
resourceName+ 7
)7 8
;8 9
	Addresses 
= 
	addresses !
.! "

IsRequired" ,
(, -
nameof- 3
(3 4
	Addresses4 =
)= >
,> ?
resourceName@ L
)L M
;M N

Categories 
= 

categories #
.# $

IsRequired$ .
(. /
nameof/ 5
(5 6

Categories6 @
)@ A
,A B
resourceNameC O
)O P
;P Q"
LocalEducationAgencyId "
=# $"
localEducationAgencyId% ;
.; <

IsRequired< F
(F G
nameofG M
(M N"
localEducationAgencyIdN d
)d e
,e f
resourceNameg s
)s t
;t u2
&LocalEducationAgencyCategoryDescriptor 2
=3 42
&localEducationAgencyCategoryDescriptor5 [
.[ \

IsRequired\ f
(f g
nameofg m
(m n3
&LocalEducationAgencyCategoryDescriptor	n î
)
î ï
,
ï ñ
resourceName
ó £
)
£ §
;
§ •
NameOfInstitution 
= 
nameOfInstitution  1
.1 2

IsRequired2 <
(< =
nameof= C
(C D
NameOfInstitutionD U
)U V
,V W
resourceNameX d
)d e
;e f)
StateEducationAgencyReference )
=* +)
stateEducationAgencyReference, I
;I J
} 	
public!! 
string!! 
Id!! 
{!! 
get!! 
;!! 
}!!  !
public"" 
int"" 
?"" "
LocalEducationAgencyId"" *
{""+ ,
get""- 0
;""0 1
}""2 3
public## 
string## 
NameOfInstitution## '
{##( )
get##* -
;##- .
}##/ 0
public$$ 
List$$ 
<$$ ,
 EdFiEducationOrganizationAddress$$ 4
>$$4 5
	Addresses$$6 ?
{$$@ A
get$$B E
;$$E F
}$$G H
public%% 
string%% 2
&LocalEducationAgencyCategoryDescriptor%% <
{%%= >
get%%? B
;%%B C
}%%D E
public&& -
!EdFiStateEducationAgencyReference&& 0)
StateEducationAgencyReference&&1 N
{&&O P
get&&Q T
;&&T U
set&&V Y
;&&Y Z
}&&[ \
public'' 
List'' 
<'' -
!EdFiEducationOrganizationCategory'' 5
>''5 6

Categories''7 A
{''B C
get''D G
;''G H
}''I J
}(( 
})) °	
xC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiLocalEducationAgencyReference.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{		 
public

 

class

 -
!EdFiLocalEducationAgencyReference

 2
{ 
public -
!EdFiLocalEducationAgencyReference 0
(0 1
int1 4
?4 5"
localEducationAgencyId6 L
)L M
{ 	"
LocalEducationAgencyId "
=# $"
localEducationAgencyId% ;
.; <

IsRequired< F
(F G
nameofG M
(M N"
localEducationAgencyIdN d
)d e
,e f
GetTypeg n
(n o
)o p
.p q
Nameq u
)u v
;v w
} 	
public 
int 
? "
LocalEducationAgencyId *
{+ ,
get- 0
;0 1
}2 3
} 
} ù%
sC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiPostSecondaryInstitution.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Api		' *
.		* +
DomainModels		+ 7
{

 
public 

class (
EdFiPostSecondaryInstitution -
{ 
public (
EdFiPostSecondaryInstitution +
(+ ,
string 
id 
, 
List 
< ,
 EdFiEducationOrganizationAddress 1
>1 2
	addresses3 <
,< =
List 
< -
!EdFiEducationOrganizationCategory 2
>2 3

categories4 >
,> ?
int 
? &
postSecondaryInstitutionId +
,+ ,
string 3
'postSecondaryInstitutionLevelDescriptor :
,: ;
string 2
&administrativeFundingControlDescriptor 9
,9 :
string 
nameOfInstitution $
) 
{ 	
var 
resourceName 
= 
GetType &
(& '
)' (
.( )
Name) -
;- .
Id 
= 
id 
. 

IsRequired 
( 
nameof %
(% &
Id& (
)( )
,) *
resourceName+ 7
)7 8
;8 9
	Addresses 
= 
	addresses !
.! "

IsRequired" ,
(, -
nameof- 3
(3 4
	Addresses4 =
)= >
,> ?
resourceName@ L
)L M
;M N

Categories 
= 

categories #
.# $

IsRequired$ .
(. /
nameof/ 5
(5 6

Categories6 @
)@ A
,A B
resourceNameC O
)O P
;P Q&
PostSecondaryInstitutionId &
=' (&
postSecondaryInstitutionId) C
.C D

IsRequiredD N
(N O
nameofO U
(U V&
postSecondaryInstitutionIdV p
)p q
,q r
resourceNames 
)	 Ä
;
Ä Å3
'PostSecondaryInstitutionLevelDescriptor 3
=4 53
'postSecondaryInstitutionLevelDescriptor6 ]
.] ^
	MaxLength^ g
(g h
$numh k
,k l
nameofm s
(s t4
'postSecondaryInstitutionLevelDescriptor	t õ
)
õ ú
,
ú ù
GetType
û •
(
• ¶
)
¶ ß
.
ß ®
Name
® ¨
)
¨ ≠
;
≠ Æ2
&AdministrativeFundingControlDescriptor 2
=3 42
&administrativeFundingControlDescriptor5 [
.[ \
	MaxLength\ e
(e f
$numf i
,i j
nameofk q
(q r3
&administrativeFundingControlDescriptor	r ò
)
ò ô
,
ô ö
GetType
õ ¢
(
¢ £
)
£ §
.
§ •
Name
• ©
)
© ™
;
™ ´
NameOfInstitution 
= 
nameOfInstitution  1
.1 2

IsRequired2 <
(< =
nameof= C
(C D
NameOfInstitutionD U
)U V
,V W
resourceNameX d
)d e
;e f
} 	
public!! 
string!! 
Id!! 
{!! 
get!! 
;!! 
}!!  !
public"" 
int"" 
?"" &
PostSecondaryInstitutionId"" .
{""/ 0
get""1 4
;""4 5
}""6 7
public## 
string## 
NameOfInstitution## '
{##( )
get##* -
;##- .
}##/ 0
public$$ 
List$$ 
<$$ ,
 EdFiEducationOrganizationAddress$$ 4
>$$4 5
	Addresses$$6 ?
{$$@ A
get$$B E
;$$E F
}$$G H
public%% 
string%% 3
'PostSecondaryInstitutionLevelDescriptor%% =
{%%> ?
get%%@ C
;%%C D
}%%E F
public&& 
string&& 2
&AdministrativeFundingControlDescriptor&& <
{&&= >
get&&? B
;&&B C
}&&D E
public'' 
List'' 
<'' -
!EdFiEducationOrganizationCategory'' 5
>''5 6

Categories''7 A
{''B C
get''D G
;''G H
}''I J
}(( 
})) Ê	
|C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiPostSecondaryInstitutionReference.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{		 
public

 

class

 1
%EdFiPostSecondaryInstitutionReference

 6
{ 
public 1
%EdFiPostSecondaryInstitutionReference 4
(4 5
int5 8
?8 9&
postSecondaryInstitutionId: T
)T U
{ 	&
PostSecondaryInstitutionId &
=' (&
postSecondaryInstitutionId) C
.C D

IsRequiredD N
(N O
nameofO U
(U V&
postSecondaryInstitutionIdV p
)p q
,q r
GetTypes z
(z {
){ |
.| }
Name	} Å
)
Å Ç
;
Ç É
} 	
public 
int 
? &
PostSecondaryInstitutionId .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
}  $
aC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiSchool.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Api		' *
.		* +
DomainModels		+ 7
{

 
public 

class 

EdFiSchool 
{ 
public 

EdFiSchool 
( 
string 
id 
, 
string 
nameOfInstitution $
,$ %
int 
? 
schoolId 
, 
List 
< ,
 EdFiEducationOrganizationAddress 1
>1 2
	addresses3 <
,< =
List 
< -
!EdFiEducationOrganizationCategory 2
>2 3+
educationOrganizationCategories4 S
,S T
List 
<  
EdFiSchoolGradeLevel %
>% &
gradeLevels' 2
,2 3-
!EdFiLocalEducationAgencyReference -)
localEducationAgencyReference. K
=L M
nullN R
,R S
SchoolExtensions 
ext  
=! "
null# '
) 	
{ 	
var 
resourceName 
= 
GetType &
(& '
)' (
.( )
Name) -
;- .
Id 
= 
id 
. 

IsRequired 
( 
nameof %
(% &
id& (
)( )
,) *
resourceName+ 7
)7 8
;8 9
	Addresses 
= 
	addresses !
.! "

IsRequired" ,
(, -
nameof- 3
(3 4
	addresses4 =
)= >
,> ?
resourceName@ L
)L M
;M N+
EducationOrganizationCategories +
=, -+
educationOrganizationCategories /
./ 0

IsRequired0 :
(: ;
nameof; A
(A B+
educationOrganizationCategoriesB a
)a b
,b c
resourceNamed p
)p q
;q r
GradeLevels 
= 
gradeLevels %
.% &

IsRequired& 0
(0 1
nameof1 7
(7 8
gradeLevels8 C
)C D
,D E
resourceNameF R
)R S
;S T
SchoolId 
= 
schoolId 
.  

IsRequired  *
(* +
nameof+ 1
(1 2
schoolId2 :
): ;
,; <
resourceName= I
)I J
;J K
NameOfInstitution 
= 
nameOfInstitution  1
.1 2

IsRequired2 <
(< =
nameof= C
(C D
nameOfInstitutionD U
)U V
,V W
resourceNameX d
)d e
;e f)
LocalEducationAgencyReference   )
=  * +)
localEducationAgencyReference  , I
;  I J
_ext!! 
=!! 
ext!! 
;!! 
}"" 	
public$$ 
string$$ 
Id$$ 
{$$ 
get$$ 
;$$ 
}$$  !
public%% 
string%% 
NameOfInstitution%% '
{%%( )
get%%* -
;%%- .
}%%/ 0
public&& 
int&& 
?&& 
SchoolId&& 
{&& 
get&& "
;&&" #
}&&$ %
public'' -
!EdFiLocalEducationAgencyReference'' 0)
LocalEducationAgencyReference''1 N
{''O P
get''Q T
;''T U
set''V Y
;''Y Z
}''[ \
public(( 
List(( 
<(( ,
 EdFiEducationOrganizationAddress(( 4
>((4 5
	Addresses((6 ?
{((@ A
get((B E
;((E F
}((G H
public)) 
List)) 
<))  
EdFiSchoolGradeLevel)) (
>))( )
GradeLevels))* 5
{))6 7
get))8 ;
;)); <
}))= >
public** 
List** 
<** -
!EdFiEducationOrganizationCategory** 5
>**5 6+
EducationOrganizationCategories**7 V
{**W X
get**Y \
;**\ ]
}**^ _
public++ 
SchoolExtensions++ 
_ext++  $
{++% &
get++' *
;++* +
set++, /
;++/ 0
}++1 2
},, 
}-- ÿ
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiSchoolGradeLevel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{		 
public

 

class

  
EdFiSchoolGradeLevel

 %
{ 
public  
EdFiSchoolGradeLevel #
(# $
string$ * 
gradeLevelDescriptor+ ?
)? @
{ 	 
GradeLevelDescriptor  
=! " 
gradeLevelDescriptor# 7
.7 8

IsRequired8 B
(B C
nameofC I
(I J 
gradeLevelDescriptorJ ^
)^ _
,_ `
GetTypea h
(h i
)i j
.j k
Namek o
)o p
;p q
} 	
public 
string  
GradeLevelDescriptor *
{+ ,
get- 0
;0 1
}2 3
} 
} °	
xC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\EdFiStateEducationAgencyReference.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{		 
public

 

class

 -
!EdFiStateEducationAgencyReference

 2
{ 
public -
!EdFiStateEducationAgencyReference 0
(0 1
int1 4
?4 5"
stateEducationAgencyId6 L
)L M
{ 	"
StateEducationAgencyId "
=# $"
stateEducationAgencyId% ;
.; <

IsRequired< F
(F G
nameofG M
(M N"
stateEducationAgencyIdN d
)d e
,e f
GetTypeg n
(n o
)o p
.p q
Nameq u
)u v
;v w
} 	
public 
int 
? "
StateEducationAgencyId *
{+ ,
get- 0
;0 1
}2 3
} 
}  
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\SchoolExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{ 
public 

class 
SchoolExtensions !
{		 
public

 
SchoolExtensions

 
(

  
TpdmSchoolExtension

  3
tpdm

4 8
)

8 9
{ 	
TPDM 
= 
tpdm 
; 
} 	
public 
TpdmSchoolExtension "
TPDM# '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} ≥
jC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\DomainModels\TpdmSchoolExtension.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
DomainModels+ 7
{		 
public

 

class

 
TpdmSchoolExtension

 $
{ 
public 
TpdmSchoolExtension "
(" #
string )
accreditationStatusDescriptor 0
,0 1
string '
federalLocaleCodeDescriptor .
,. /
bool 
? 
improvingSchool !
,! "1
%EdFiPostSecondaryInstitutionReference 1-
!postSecondaryInstitutionReference2 S
=T U
nullV Z
) 
{ 	)
AccreditationStatusDescriptor )
=* +)
accreditationStatusDescriptor, I
.I J
	MaxLengthJ S
(S T
$numT W
,W X
nameofY _
(_ `)
accreditationStatusDescriptor` }
)} ~
,~ 
GetType
Ä á
(
á à
)
à â
.
â ä
Name
ä é
)
é è
;
è ê'
FederalLocaleCodeDescriptor '
=( )'
federalLocaleCodeDescriptor* E
.E F
	MaxLengthF O
(O P
$numP S
,S T
nameofU [
([ \'
federalLocaleCodeDescriptor\ w
)w x
,x y
GetType	z Å
(
Å Ç
)
Ç É
.
É Ñ
Name
Ñ à
)
à â
;
â ä
;
ã å
ImprovingSchool 
= 
improvingSchool -
;- .-
!PostSecondaryInstitutionReference -
=. /-
!postSecondaryInstitutionReference0 Q
;Q R
} 	
public 
string )
AccreditationStatusDescriptor 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string '
FederalLocaleCodeDescriptor 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
bool 
? 
ImprovingSchool $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 1
%EdFiPostSecondaryInstitutionReference 4-
!PostSecondaryInstitutionReference5 V
{W X
getY \
;\ ]
set^ a
;a b
}c d
} 
} ˘"
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Enumerations\AddressType.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Enumerations+ 7
{ 
public 

class 
AddressType 
: 
Enumeration *
<* +
AddressType+ 6
>6 7
{		 
public

 
static

 
AddressType

 !
Billing

" )
=

* +
new

, /
AddressType

0 ;
(

; <
$num

< =
,

= >
$str

? H
)

H I
;

I J
public 
static 
AddressType !
FatherAddress" /
=0 1
new2 5
AddressType6 A
(A B
$numB C
,C D
$strE U
)U V
;V W
public 
static 
AddressType !
Home" &
=' (
new) ,
AddressType- 8
(8 9
$num9 :
,: ;
$str< B
)B C
;C D
public 
static 
AddressType !
GuardianAddress" 1
=2 3
new4 7
AddressType8 C
(C D
$numD E
,E F
$strG Y
)Y Z
;Z [
public 
static 
AddressType !
Mailing" )
=* +
new, /
AddressType0 ;
(; <
$num< =
,= >
$str? H
)H I
;I J
public 
static 
AddressType !
MotherAddress" /
=0 1
new2 5
AddressType6 A
(A B
$numB C
,C D
$strE U
)U V
;V W
public 
static 
AddressType !
Other" '
=( )
new* -
AddressType. 9
(9 :
$num: ;
,; <
$str= D
)D E
;E F
public 
static 
AddressType !
Physical" *
=+ ,
new- 0
AddressType1 <
(< =
$num= >
,> ?
$str@ J
)J K
;K L
public 
static 
AddressType !
Shipping" *
=+ ,
new- 0
AddressType1 <
(< =
$num= >
,> ?
$str@ J
)J K
;K L
public 
static 
AddressType !
	Temporary" +
=, -
new. 1
AddressType2 =
(= >
$num> @
,@ A
$strB M
)M N
;N O
public 
static 
AddressType !
Work" &
=' (
new) ,
AddressType- 8
(8 9
$num9 ;
,; <
$str= C
)C D
;D E
public 
static 
AddressType !
Shelter" )
=* +
new, /
AddressType0 ;
(; <
$num< >
,> ?
$str@ v
)v w
;w x
public 
static 
AddressType !
	DoubledUp" +
=, -
new. 1
AddressType2 =
(= >
$num> @
,@ A
$strB s
)s t
;t u
public 
static 
AddressType !
Unsheltered" -
=. /
new0 3
AddressType4 ?
(? @
$num@ B
,B C
$str	D µ
)
µ ∂
;
∂ ∑
public 
static 
AddressType !

HotelMotel" ,
=- .
new/ 2
AddressType3 >
(> ?
$num? A
,A B
$strC R
)R S
;S T
public 
AddressType 
( 
int 
value $
,$ %
string& ,
displayName- 8
)8 9
:: ;
base< @
(@ A
valueA F
,F G
displayNameH S
)S T
{ 	
} 	
} 
} ’)
_C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\InferExtensionDetails.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{ 
public 

	interface "
IInferExtensionDetails +
{ 
Task 
<  
TpdmExtensionDetails !
>! " 
TpdmExtensionVersion# 7
(7 8
string8 >
apiServerUrl? K
)K L
;L M
} 
public 

class !
InferExtensionDetails &
:' ("
IInferExtensionDetails) ?
{ 
private 
readonly 
ISimpleGetRequest *
_getRequest+ 6
;6 7
public !
InferExtensionDetails $
($ %
ISimpleGetRequest% 6

getRequest7 A
)A B
=>C E
_getRequestF Q
=R S

getRequestT ^
;^ _
public 
async 
Task 
<  
TpdmExtensionDetails .
>. / 
TpdmExtensionVersion0 D
(D E
stringE K
apiServerUrlL X
)X Y
{ 	
return 
await 

GetVersion #
(# $
apiServerUrl$ 0
)0 1
;1 2
} 	
private 
async 
Task 
<  
TpdmExtensionDetails /
>/ 0

GetVersion1 ;
(; <
string< B
apiServerUrlC O
)O P
{ 	
var   
response   
=   
JToken   !
.  ! "
Parse  " '
(  ' (
await  ( -
_getRequest  . 9
.  9 :
DownloadString  : H
(  H I
apiServerUrl  I U
)  U V
)  V W
;  W X
var!! 
versionDetails!! 
=!!  
new!!! $ 
TpdmExtensionDetails!!% 9
(!!9 :
)!!: ;
;!!; <
if"" 
("" 
response"" 
["" 
$str"" %
]""% &
is""' )
JArray""* 0

dataModels""1 ;
)""; <
{## 
foreach$$ 
($$ 
var$$ 
	dataModel$$ &
in$$' )

dataModels$$* 4
)$$4 5
{%% 
if&& 
(&& 
	dataModel&& !
is&&" $
JObject&&% ,
&&&&- /
	dataModel&&0 9
[&&9 :
$str&&: @
]&&@ A
is&&B D
JValue&&E K
	nameToken&&L U
)&&U V
if'' 
('' 
	nameToken'' %
.''% &
ToString''& .
(''. /
CultureInfo''/ :
.'': ;
InvariantCulture''; K
)''K L
.''L M
ToUpper''M T
(''T U
)''U V
==''W Y
$str''Z `
)''` a
{(( 
if)) 
())  
	dataModel))  )
[))) *
$str))* 3
]))3 4
is))5 7
JValue))8 >
versionToken))? K
)))K L
{** 
var++  #
version++$ +
=++, -
versionToken++. :
.++: ;
ToString++; C
(++C D
CultureInfo++D O
.++O P
InvariantCulture++P `
)++` a
;++a b
versionDetails,,  .
.,,. /
TpdmVersion,,/ :
=,,; <
new,,= @
Version,,A H
(,,H I
version,,I P
),,P Q
>=,,R T
new,,U X
Version,,Y `
(,,` a
$str,,a h
),,h i
?,,j k
version,,l s
:,,t u
string,,v |
.,,| }
Empty	,,} Ç
;
,,Ç É
}-- 
var// 

isTpdmCore//  *
=//+ ,
	dataModel//- 6
[//6 7
$str//7 M
]//M N
is//O Q
JValue//R X%
informationalVersionToken//Y r
&&00- /%
informationalVersionToken000 I
.00I J
ToString00J R
(00R S
CultureInfo00S ^
.00^ _
InvariantCulture00_ o
)00o p
.00p q
ToLower00q x
(00x y
)00y z
.111 2
Equals112 8
(118 9
$str119 D
)11D E
;11E F
versionDetails22 *
.22* +"
IsTpdmCommunityVersion22+ A
=22B C
	dataModel22D M
[22M N
$str22N d
]22d e
==22f h
null22i m
||22n p
!22q r

isTpdmCore22r |
;22| }
}33 
}44 
}55 
return77 
versionDetails77 !
;77! "
}88 	
}99 
public;; 

class;;  
TpdmExtensionDetails;; %
{<< 
public== 
string== 
TpdmVersion== !
{==" #
get==$ '
;==' (
set==) ,
;==, -
}==. /
public?? 
bool?? "
IsTpdmCommunityVersion?? *
{??+ ,
get??- 0
;??0 1
set??2 5
;??5 6
}??7 8
}@@ 
}AA ≠'
\C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\InferOdsApiVersion.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{ 
public 

	interface 
IInferOdsApiVersion (
{ 
Task 
< 
string 
> 
Version 
( 
string "
apiServerUrl# /
)/ 0
;0 1
Task 
< 
string 
> 
EdFiStandardVersion '
(' (
string( .
apiServerUrl/ ;
); <
;< =
} 
public 

class 
InferOdsApiVersion #
:$ %
IInferOdsApiVersion& 9
{ 
private 
readonly 
IHttpClientFactory +
_clientFactory, :
;: ;
public 
InferOdsApiVersion !
(! "
IHttpClientFactory" 4
clientFactory5 B
)B C
{ 	
_clientFactory 
= 
clientFactory *
;* +
} 	
public 
async 
Task 
< 
string  
>  !
Version" )
() *
string* 0
apiServerUrl1 =
)= >
{ 	
var 

httpClient 
= 
_clientFactory +
.+ ,
CreateClient, 8
(8 9
)9 :
;: ;
using   
(   
var   
response   
=    !
await  " '

httpClient  ( 2
.  2 3
GetAsync  3 ;
(  ; <
apiServerUrl  < H
)  H I
)  I J
{!! 
using"" 
("" 
var"" 
content"" "
=""# $
response""% -
.""- .
Content"". 5
)""5 6
{## 
var$$ 
contentAsString$$ '
=$$( )
await$$* /
content$$0 7
.$$7 8
ReadAsStringAsync$$8 I
($$I J
)$$J K
;$$K L
var&& 
parsedContent&& %
=&&& '
JToken&&( .
.&&. /
Parse&&/ 4
(&&4 5
contentAsString&&5 D
)&&D E
;&&E F
var(( 

apiVersion(( "
=((# $
parsedContent((% 2
[((2 3
$str((3 <
]((< =
?((= >
.((> ?
ToString((? G
(((G H
)((H I
;((I J
return** 

apiVersion** %
;**% &
}++ 
},, 
}-- 	
public// 
async// 
Task// 
<// 
string//  
>//  !
EdFiStandardVersion//" 5
(//5 6
string//6 <
apiServerUrl//= I
)//I J
{00 	
var11 

httpClient11 
=11 
_clientFactory11 +
.11+ ,
CreateClient11, 8
(118 9
)119 :
;11: ;
using33 
(33 
var33 
response33 
=33  !
await33" '

httpClient33( 2
.332 3
GetAsync333 ;
(33; <
apiServerUrl33< H
)33H I
)33I J
{44 
using55 
(55 
var55 
content55 "
=55# $
response55% -
.55- .
Content55. 5
)555 6
{66 
var77 
contentAsString77 '
=77( )
await77* /
content770 7
.777 8
ReadAsStringAsync778 I
(77I J
)77J K
;77K L
var99 
parsedContent99 %
=99& '
JToken99( .
.99. /
Parse99/ 4
(994 5
contentAsString995 D
)99D E
;99E F
var;; 

dataModels;; "
=;;# $
parsedContent;;% 2
[;;2 3
$str;;3 ?
];;? @
;;;@ A
if== 
(== 

dataModels== "
!===# %
null==& *
)==* +
{>> 
foreach?? 
(??  !
var??! $
	dataModel??% .
in??/ 1

dataModels??2 <
)??< =
if@@ 
(@@  
	dataModel@@  )
[@@) *
$str@@* 0
]@@0 1
?@@1 2
.@@2 3
ToString@@3 ;
(@@; <
)@@< =
==@@> @
$str@@A H
)@@H I
returnAA  &
	dataModelAA' 0
[AA0 1
$strAA1 :
]AA: ;
?AA; <
.AA< =
ToStringAA= E
(AAE F
)AAF G
;AAG H
}BB 
throwDD 
newDD 
	ExceptionDD '
(DD' (
$strDD( w
)DDw x
;DDx y
}EE 
}FF 
}GG 	
}HH 
}II Ú
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\IOdsApiConnectionInformationProvider.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{		 
public

 

	interface

 0
$IOdsApiConnectionInformationProvider

 9
{ 
Task 
< '
OdsApiConnectionInformation (
>( )2
&GetConnectionInformationForEnvironment* P
(P Q
)Q R
;R S
} 
} Ä.
WC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\IOdsApiFacade.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Api		' *
{

 
public 

	interface 
IOdsApiFacade "
{ 
List 
< 
School 
> 
GetAllSchools "
(" #
)# $
;$ %
List 
< 
	PsiSchool 
> 
GetAllPsiSchools (
(( )
)) *
;* +
List 
< 
School 
> 
GetSchoolsByLeaIds '
(' (
IEnumerable( 3
<3 4
int4 7
>7 8
leaIds9 ?
)? @
;@ A
List 
<  
LocalEducationAgency !
>! "(
GetAllLocalEducationAgencies# ?
(? @
)@ A
;A B
List 
<  
LocalEducationAgency !
>! "+
GetLocalEducationAgenciesByPage# B
(B C
intC F
offsetG M
=N O
$numP Q
,Q R
intS V
limitW \
=] ^
$num_ a
)a b
;b c
OdsApiResult &
DeleteLocalEducationAgency /
(/ 0
string0 6
id7 9
)9 :
;: ;
OdsApiResult 
DeleteSchool !
(! "
string" (
id) +
)+ ,
;, -
OdsApiResult #
AddLocalEducationAgency ,
(, - 
LocalEducationAgency- A#
newLocalEducationAgencyB Y
)Y Z
;Z [
OdsApiResult 
	AddSchool 
( 
School %
	newSchool& /
)/ 0
;0 1
OdsApiResult 
AddPsiSchool !
(! "
	PsiSchool" +
	newSchool, 5
)5 6
;6 7
List 
< 
SelectOptionModel 
> -
!GetLocalEducationAgencyCategories  A
(A B
)B C
;C D
List 
< 
SelectOptionModel 
> 
GetAllGradeLevels  1
(1 2
)2 3
;3 4
IReadOnlyList 
< 
string 
> 
GetAllDescriptors /
(/ 0
)0 1
;1 2
List 
< 

Descriptor 
>  
GetDescriptorsByPath -
(- .
string. 4
descriptorPath5 C
)C D
;D E
bool 
DoesApiDataExist 
( 
) 
;   
LocalEducationAgency '
GetLocalEducationAgencyById 8
(8 9
string9 ?
id@ B
)B C
;C D
OdsApiResult $
EditLocalEducationAgency -
(- . 
LocalEducationAgency. B&
editedLocalEducationAgencyC ]
)] ^
;^ _
School 
GetSchoolById 
( 
string #
id$ &
)& '
;' (
	PsiSchool 
GetPsiSchoolById "
(" #
string# )
id* ,
), -
;- .
OdsApiResult   

EditSchool   
(    
School    &
editedSchool  ' 3
)  3 4
;  4 5
OdsApiResult!! 
EditPsiSchool!! "
(!!" #
	PsiSchool!!# ,
model!!- 2
)!!2 3
;!!3 4
List"" 
<"" 
SelectOptionModel"" 
>"" $
GetAllStateAbbreviations""  8
(""8 9
)""9 :
;"": ;
List## 
<## 
SelectOptionModel## 
>## -
!GetPostSecondaryInstitutionLevels##  A
(##A B
)##B C
;##C D
List$$ 
<$$ 
SelectOptionModel$$ 
>$$ ,
 GetAdministrativeFundingControls$$  @
($$@ A
)$$A B
;$$B C
List%% 
<%% 
SelectOptionModel%% 
>%% )
GetAccreditationStatusOptions%%  =
(%%= >
)%%> ?
;%%? @
List&& 
<&& 
SelectOptionModel&& 
>&& !
GetFederalLocaleCodes&&  5
(&&5 6
)&&6 7
;&&7 8
List'' 
<'' $
PostSecondaryInstitution'' %
>''% &+
GetAllPostSecondaryInstitutions''' F
(''F G
)''G H
;''H I
List(( 
<(( $
PostSecondaryInstitution(( %
>((% &.
"GetPostSecondaryInstitutionsByPage((' I
(((I J
int((J M
offset((N T
=((U V
$num((W X
,((X Y
int((Z ]
limit((^ c
=((d e
$num((f h
)((h i
;((i j
OdsApiResult)) '
AddPostSecondaryInstitution)) 0
())0 1
Models))1 7
.))7 8$
PostSecondaryInstitution))8 P'
newPostSecondaryInstitution))Q l
)))l m
;))m n$
PostSecondaryInstitution**  +
GetPostSecondaryInstitutionById**! @
(**@ A
string**A G
id**H J
)**J K
;**K L
OdsApiResult++ (
EditPostSecondaryInstitution++ 1
(++1 2
Models++2 8
.++8 9$
PostSecondaryInstitution++9 Q
model++R W
)++W X
;++X Y
OdsApiResult,, *
DeletePostSecondaryInstitution,, 3
(,,3 4
string,,4 :
id,,; =
),,= >
;,,> ?
}-- 
}.. §
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\IOdsApiFacadeFactory.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{		 
public

 

	interface

  
IOdsApiFacadeFactory

 )
{ 
Task 
< 
IOdsApiFacade 
> 
Create "
(" #
)# $
;$ %
} 
} û
XC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\IOdsRestClient.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{		 
public

 

	interface

 
IOdsRestClient

 #
{ 
IReadOnlyList 
< 
T 
> 
GetAll 
<  
T  !
>! "
(" #
string# )
elementPath* 5
)5 6
where7 <
T= >
:? @
classA F
;F G
IReadOnlyList 
< 
T 
> 
GetAll 
<  
T  !
>! "
(" #
string# )
elementPath* 5
,5 6
int7 :
offset; A
,A B
intC F
limitG L
)L M
whereN S
TT U
:V W
classX ]
;] ^
IReadOnlyList 
< 
T 
> 
GetAll 
<  
T  !
>! "
(" #
string# )
elementPath* 5
,5 6

Dictionary7 A
<A B
stringB H
,H I
objectJ P
>P Q
filtersR Y
)Y Z
where[ `
Ta b
:c d
classe j
;j k
T 	
GetById
 
< 
T 
> 
( 
string 
elementPath '
,' (
string) /
id0 2
)2 3
where4 9
T: ;
:< =
class> C
;C D
OdsApiResult 
PostResource !
<! "
T" #
># $
($ %
T% &
resource' /
,/ 0
string1 7
elementPath8 C
,C D
boolE I
refreshTokenJ V
=W X
falseY ^
)^ _
;_ `
OdsApiResult 
PutResource  
<  !
T! "
>" #
(# $
T$ %
resource& .
,. /
string0 6
elementPath7 B
,B C
stringD J
idK M
,M N
boolO S
refreshTokenT `
=a b
falsec h
)h i
;i j
IReadOnlyList 
< 
string 
> 
GetAllDescriptors /
(/ 0
)0 1
;1 2
OdsApiResult 
DeleteResource #
(# $
string$ *
elementPath+ 6
,6 7
string8 >
id? A
,A B
boolC G
refreshTokenH T
=U V
falseW \
)\ ]
;] ^
} 
} ß
_C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\IOdsRestClientFactory.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{		 
public

 

	interface

 !
IOdsRestClientFactory

 *
{ 
Task 
< 
IOdsRestClient 
> 
Create #
(# $
)$ %
;% &
} 
} ¸
[C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Models\Descriptor.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Models+ 1
{ 
public 

class 

Descriptor 
{		 
public

 
string

 
Id

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 
string 
	Namespace 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Ë
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Models\EducationOrganization.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Models+ 1
{ 
public 

class !
EducationOrganization &
{		 
public

 
string

 
Id

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 
int #
EducationOrganizationId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
int 
? "
LocalEducationAgencyId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
StreetNumberName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string $
ApartmentRoomSuiteNumber .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} à
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Models\LocalEducationAgency.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Models+ 1
{ 
public 

class  
LocalEducationAgency %
:& '!
EducationOrganization( =
{		 
public

 
string

 )
EducationOrganizationCategory

 3
{

4 5
get

6 9
;

9 :
set

; >
;

> ?
}

@ A
public 
string ,
 LocalEducationAgencyCategoryType 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
int 
? 
StateOrganizationId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} ƒ	
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Models\PostSecondaryInstitution.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Models+ 1
{ 
public 

class $
PostSecondaryInstitution )
:* +!
EducationOrganization, A
{		 
public

 
int

 
?

 &
PostSecondaryInstitutionId

 .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
public 
string )
EducationOrganizationCategory 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string )
PostSecondaryInstitutionLevel 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AdministrativeFundingControl 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} Å	
ZC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Models\PsiSchool.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Models+ 1
{ 
public 

class 
	PsiSchool 
: 
School #
{		 
public

 
int

 
?

 &
PostSecondaryInstitutionId

 .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
public 
string 
AccreditationStatus )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
FederalLocaleCode '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
bool 
? 
ImprovingSchool $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ‘
WC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Models\School.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Models+ 1
{		 
public

 

class

 
School

 
:

 !
EducationOrganization

 /
{ 
public 
string )
EducationOrganizationCategory 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
List 
< 
string 
> 
GradeLevels '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} 
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\Models\SelectOptionModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
.* +
Models+ 1
{ 
public 

class 
SelectOptionModel "
{		 
public

 
string

 
Value

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
DisplayText !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Ì
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\OdsApiConnectionInformation.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{		 
public

 

class

 '
OdsApiConnectionInformation

 ,
{ 
public 
string 
ApiServerUrl "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
	ClientKey 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
ClientSecret "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
OAuthUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

ApiBaseUrl  
{ 	
get 
{ 
var 
uri 
= 
ApiServerUrl &
.& '
AppendPathSegments' 9
(9 :
$str: @
,@ A
$strB F
)F G
;G H
return 
uri 
; 
} 
} 	
public 
string 
MetadataUrl !
{ 	
get 
{ 
var   
uri   
=   
ApiServerUrl   &
.  & '
AppendPathSegment  ' 8
(  8 9
$str  9 C
)  C D
;  D E
return"" 
uri"" 
;"" 
}## 
}$$ 	
public&& 
string&& 
DependenciesUrl&& %
{'' 	
get(( 
{)) 
var** 
uri** 
=** 
ApiServerUrl** &
.**& '
AppendPathSegments**' 9
(**9 :
$str**: D
,**D E
$str**F L
,**L M
$str**N R
)**R S
;**S T
uri,, 
=,, 
uri,, 
.,, 
AppendPathSegment,, +
(,,+ ,
$str,,, :
),,: ;
;,,; <
return.. 
uri.. 
;.. 
}// 
}00 	
public22 
string22 
DescriptorsUrl22 $
{33 	
get44 
{55 
var66 
uri66 
=66 
ApiServerUrl66 &
.66& '
AppendPathSegments66' 9
(669 :
$str66: D
,66D E
$str66F L
,66L M
$str66N R
)66R S
;66S T
uri88 
=88 
uri88 
.88 
AppendPathSegment88 +
(88+ ,
$str88, 9
)889 :
;88: ;
return:: 
uri:: 
;:: 
};; 
}<< 	
}== 
}>> ˇÈ
VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\OdsApiFacade.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{ 
public 

class 
OdsApiFacade 
: 
IOdsApiFacade  -
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IOdsRestClient '
_restClient( 3
;3 4
public 
OdsApiFacade 
( 
IMapper #
mapper$ *
,* +
IOdsRestClient, :

restClient; E
)E F
{ 	
_mapper 
= 
mapper 
; 
_restClient 
= 

restClient $
;$ %
} 	
public 
List 
< 
Models 
. 
School !
>! "
GetAllSchools# 0
(0 1
)1 2
{ 	
var 
response 
= 
_restClient &
.& '
GetAll' -
<- .
School. 4
>4 5
(5 6
ResourcePaths6 C
.C D
SchoolsD K
)K L
;L M
return   
_mapper   
.   
Map   
<   
List   #
<  # $
Models  $ *
.  * +
School  + 1
>  1 2
>  2 3
(  3 4
response  4 <
)  < =
;  = >
}!! 	
public## 
List## 
<## 
Models## 
.## 
	PsiSchool## $
>##$ %
GetAllPsiSchools##& 6
(##6 7
)##7 8
{$$ 	
var%% 
response%% 
=%% 
_restClient%% &
.%%& '
GetAll%%' -
<%%- .
School%%. 4
>%%4 5
(%%5 6
ResourcePaths%%6 C
.%%C D
Schools%%D K
)%%K L
;%%L M
return&& 
_mapper&& 
.&& 
Map&& 
<&& 
List&& #
<&&# $
Models&&$ *
.&&* +
	PsiSchool&&+ 4
>&&4 5
>&&5 6
(&&6 7
response&&7 ?
)&&? @
;&&@ A
}'' 	
public)) 
List)) 
<)) 
Models)) 
.)) 
School)) !
>))! "
GetSchoolsByLeaIds))# 5
())5 6
IEnumerable))6 A
<))A B
int))B E
>))E F
leaIds))G M
)))M N
{** 	
var++ 
response++ 
=++ 
new++ 
List++ #
<++# $
School++$ *
>++* +
(+++ ,
)++, -
;++- .
foreach-- 
(-- 
var-- 
leaId-- 
in-- !
leaIds--" (
)--( )
{.. 
var// 
filters// 
=// 
new// !

Dictionary//" ,
<//, -
string//- 3
,//3 4
object//5 ;
>//; <
{00 
{11 
$str11 -
,11- .
leaId11/ 4
}114 5
}22 
;22 
response44 
.44 
AddRange44 !
(44! "
_restClient44" -
.44- .
GetAll44. 4
<444 5
School445 ;
>44; <
(44< =
ResourcePaths44= J
.44J K
Schools44K R
,44R S
filters44T [
)44[ \
)44\ ]
;44] ^
}55 
return77 
_mapper77 
.77 
Map77 
<77 
List77 #
<77# $
Models77$ *
.77* +
School77+ 1
>771 2
>772 3
(773 4
response774 <
)77< =
;77= >
}88 	
public:: 
List:: 
<:: 
SelectOptionModel:: %
>::% &-
!GetLocalEducationAgencyCategories::' H
(::H I
)::I J
{;; 	
var<< 
response<< 
=<< 
_restClient<< &
.<<& '
GetAll<<' -
<<<- .
DomainModels<<. :
.<<: ;
EdFiDescriptor<<; I
><<I J
(<<J K
ResourcePaths<<K X
.<<X Y4
'LocalEducationAgencyCategoryDescriptors	<<Y Ä
)
<<Ä Å
;
<<Å Ç
return== 
response== 
.== 
Select== "
(==" #
x==# $
=>==% ',
 BuildDescriptorSelectOptionModel==( H
(==H I
x==I J
.==J K
	Namespace==K T
,==T U
x==V W
.==W X
	CodeValue==X a
,==a b
x==c d
.==d e
Description==e p
)==p q
)==q r
.>> 
ToList>> 
(>> 
)>> 
;>> 
}?? 	
publicAA 
ListAA 
<AA 
SelectOptionModelAA %
>AA% &-
!GetPostSecondaryInstitutionLevelsAA' H
(AAH I
)AAI J
{BB 	
varCC 
responseCC 
=CC 
_restClientCC &
.CC& '
GetAllCC' -
<CC- .
DomainModelsCC. :
.CC: ;
EdFiDescriptorCC; I
>CCI J
(CCJ K
ResourcePathsCCK X
.CCX Y5
(PostSecondaryInstitutionLevelDescriptors	CCY Å
)
CCÅ Ç
;
CCÇ É
returnDD 
responseDD 
.DD 
SelectDD "
(DD" #
xDD# $
=>DD% ',
 BuildDescriptorSelectOptionModelDD( H
(DDH I
xDDI J
.DDJ K
	NamespaceDDK T
,DDT U
xDDV W
.DDW X
	CodeValueDDX a
,DDa b
xDDc d
.DDd e
DescriptionDDe p
)DDp q
)DDq r
.EE 
ToListEE 
(EE 
)EE 
;EE 
}FF 	
publicHH 
ListHH 
<HH 
SelectOptionModelHH %
>HH% &,
 GetAdministrativeFundingControlsHH' G
(HHG H
)HHH I
{II 	
varJJ 
responseJJ 
=JJ 
_restClientJJ &
.JJ& '
GetAllJJ' -
<JJ- .
DomainModelsJJ. :
.JJ: ;
EdFiDescriptorJJ; I
>JJI J
(JJJ K
ResourcePathsJJK X
.JJX Y4
'AdministrativeFundingControlDescriptors	JJY Ä
)
JJÄ Å
;
JJÅ Ç
returnKK 
responseKK 
.KK 
SelectKK "
(KK" #
xKK# $
=>KK% ',
 BuildDescriptorSelectOptionModelKK( H
(KKH I
xKKI J
.KKJ K
	NamespaceKKK T
,KKT U
xKKV W
.KKW X
	CodeValueKKX a
,KKa b
xKKc d
.KKd e
DescriptionKKe p
)KKp q
)KKq r
.LL 
ToListLL 
(LL 
)LL 
;LL 
}MM 	
publicOO 
ListOO 
<OO 
SelectOptionModelOO %
>OO% &)
GetAccreditationStatusOptionsOO' D
(OOD E
)OOE F
{PP 	
varQQ 
responseQQ 
=QQ 
_restClientQQ &
.QQ& '
GetAllQQ' -
<QQ- .
DomainModelsQQ. :
.QQ: ;
EdFiDescriptorQQ; I
>QQI J
(QQJ K
ResourcePathsQQK X
.QQX Y*
AccreditationStatusDescriptorsQQY w
)QQw x
;QQx y
returnRR 
responseRR 
.RR 
SelectRR "
(RR" #
xRR# $
=>RR% ',
 BuildDescriptorSelectOptionModelRR( H
(RRH I
xRRI J
.RRJ K
	NamespaceRRK T
,RRT U
xRRV W
.RRW X
	CodeValueRRX a
,RRa b
xRRc d
.RRd e
DescriptionRRe p
)RRp q
)RRq r
.SS 
ToListSS 
(SS 
)SS 
;SS 
}TT 	
publicVV 
ListVV 
<VV 
SelectOptionModelVV %
>VV% &!
GetFederalLocaleCodesVV' <
(VV< =
)VV= >
{WW 	
varXX 
responseXX 
=XX 
_restClientXX &
.XX& '
GetAllXX' -
<XX- .
DomainModelsXX. :
.XX: ;
EdFiDescriptorXX; I
>XXI J
(XXJ K
ResourcePathsXXK X
.XXX Y(
FederalLocaleCodeDescriptorsXXY u
)XXu v
;XXv w
returnYY 
responseYY 
.YY 
SelectYY "
(YY" #
xYY# $
=>YY% ',
 BuildDescriptorSelectOptionModelYY( H
(YYH I
xYYI J
.YYJ K
	NamespaceYYK T
,YYT U
xYYV W
.YYW X
	CodeValueYYX a
,YYa b
xYYc d
.YYd e
DescriptionYYe p
)YYp q
)YYq r
.ZZ 
ToListZZ 
(ZZ 
)ZZ 
;ZZ 
}[[ 	
public]] 
List]] 
<]] 
Models]] 
.]]  
LocalEducationAgency]] /
>]]/ 0(
GetAllLocalEducationAgencies]]1 M
(]]M N
)]]N O
{^^ 	
var__ 
response__ 
=__ 
_restClient__ &
.__& '
GetAll__' -
<__- . 
LocalEducationAgency__. B
>__B C
(__C D
ResourcePaths__D Q
.__Q R"
LocalEducationAgencies__R h
)__h i
;__i j
return`` 
_mapper`` 
.`` 
Map`` 
<`` 
List`` #
<``# $
Models``$ *
.``* + 
LocalEducationAgency``+ ?
>``? @
>``@ A
(``A B
response``B J
)``J K
;``K L
}aa 	
publiccc 
Listcc 
<cc 
Modelscc 
.cc $
PostSecondaryInstitutioncc 3
>cc3 4+
GetAllPostSecondaryInstitutionscc5 T
(ccT U
)ccU V
{dd 	
varee 
responseee 
=ee 
_restClientee &
.ee& '
GetAllee' -
<ee- .$
PostSecondaryInstitutionee. F
>eeF G
(eeG H
ResourcePathseeH U
.eeU V%
PostSecondaryInstitutionseeV o
)eeo p
;eep q
returnff 
_mapperff 
.ff 
Mapff 
<ff 
Listff #
<ff# $
Modelsff$ *
.ff* +$
PostSecondaryInstitutionff+ C
>ffC D
>ffD E
(ffE F
responseffF N
)ffN O
;ffO P
}gg 	
publicii 
Listii 
<ii 
Modelsii 
.ii  
LocalEducationAgencyii /
>ii/ 0+
GetLocalEducationAgenciesByPageii1 P
(iiP Q
intiiQ T
offsetiiU [
,ii[ \
intii] `
limitiia f
)iif g
{jj 	
varkk 
responsekk 
=kk 
_restClientkk &
.kk& '
GetAllkk' -
<kk- . 
LocalEducationAgencykk. B
>kkB C
(kkC D
ResourcePathskkD Q
.kkQ R"
LocalEducationAgencieskkR h
,kkh i
offsetkkj p
,kkp q
limitkkr w
)kkw x
;kkx y
returnll 
_mapperll 
.ll 
Mapll 
<ll 
Listll #
<ll# $
Modelsll$ *
.ll* + 
LocalEducationAgencyll+ ?
>ll? @
>ll@ A
(llA B
responsellB J
)llJ K
;llK L
}mm 	
publicoo 
Listoo 
<oo 
Modelsoo 
.oo $
PostSecondaryInstitutionoo 3
>oo3 4.
"GetPostSecondaryInstitutionsByPageoo5 W
(ooW X
intooX [
offsetoo\ b
,oob c
intood g
limitooh m
)oom n
{pp 	
varqq 
responseqq 
=qq 
_restClientqq &
.qq& '
GetAllqq' -
<qq- .$
PostSecondaryInstitutionqq. F
>qqF G
(qqG H
ResourcePathsqqH U
.qqU V%
PostSecondaryInstitutionsqqV o
,qqo p
offsetqqq w
,qqw x
limitqqy ~
)qq~ 
;	qq Ä
returnrr 
_mapperrr 
.rr 
Maprr 
<rr 
Listrr #
<rr# $
Modelsrr$ *
.rr* +$
PostSecondaryInstitutionrr+ C
>rrC D
>rrD E
(rrE F
responserrF N
)rrN O
;rrO P
}ss 	
publicuu 
Listuu 
<uu 
SelectOptionModeluu %
>uu% &
GetAllGradeLevelsuu' 8
(uu8 9
)uu9 :
{vv 	
varww 
responseww 
=ww 
_restClientww &
.ww& '
GetAllww' -
<ww- .
DomainModelsww. :
.ww: ;
EdFiDescriptorww; I
>wwI J
(wwJ K
ResourcePathswwK X
.wwX Y!
GradeLevelDescriptorswwY n
)wwn o
;wwo p
returnxx 
responsexx 
.xx 
OrderByxx #
(xx# $
xxx$ %
=>xx& (
GradeLevelOrderxx) 8
.xx8 9
GetDefaultSortValuexx9 L
(xxL M
xxxM N
.xxN O
	CodeValuexxO X
)xxX Y
)xxY Z
.yy 
Selectyy 
(yy 
xyy 
=>yy ,
 BuildDescriptorSelectOptionModelyy =
(yy= >
xyy> ?
.yy? @
	Namespaceyy@ I
,yyI J
xyyK L
.yyL M
	CodeValueyyM V
,yyV W
xyyX Y
.yyY Z
DescriptionyyZ e
)yye f
)yyf g
.zz 
ToListzz 
(zz 
)zz 
;zz 
}{{ 	
public}} 
OdsApiResult}} #
AddLocalEducationAgency}} 3
(}}3 4
Models}}4 :
.}}: ; 
LocalEducationAgency}}; O#
newLocalEducationAgency}}P g
)}}g h
{~~ 	
var 
request 
= 
_mapper "
." #
Map# &
<& ' 
LocalEducationAgency' ;
>; <
(< =#
newLocalEducationAgency= T
)T U
;U V
return
ÄÄ 
_restClient
ÄÄ 
.
ÄÄ  
PostResource
ÄÄ  ,
(
ÄÄ, -
request
ÄÄ- 4
,
ÄÄ4 5
ResourcePaths
ÄÄ6 C
.
ÄÄC D$
LocalEducationAgencies
ÄÄD Z
)
ÄÄZ [
;
ÄÄ[ \
}
ÅÅ 	
public
ÉÉ 
OdsApiResult
ÉÉ )
AddPostSecondaryInstitution
ÉÉ 7
(
ÉÉ7 8
Models
ÉÉ8 >
.
ÉÉ> ?&
PostSecondaryInstitution
ÉÉ? W)
newPostSecondaryInstitution
ÉÉX s
)
ÉÉs t
{
ÑÑ 	
var
ÖÖ 
request
ÖÖ 
=
ÖÖ 
_mapper
ÖÖ !
.
ÖÖ! "
Map
ÖÖ" %
<
ÖÖ% &&
PostSecondaryInstitution
ÖÖ& >
>
ÖÖ> ?
(
ÖÖ? @)
newPostSecondaryInstitution
ÖÖ@ [
)
ÖÖ[ \
;
ÖÖ\ ]
return
ÜÜ 
_restClient
ÜÜ 
.
ÜÜ 
PostResource
ÜÜ +
(
ÜÜ+ ,
request
ÜÜ, 3
,
ÜÜ3 4
ResourcePaths
ÜÜ5 B
.
ÜÜB C'
PostSecondaryInstitutions
ÜÜC \
)
ÜÜ\ ]
;
ÜÜ] ^
}
áá 	
public
ää 
Models
ää 
.
ää "
LocalEducationAgency
ää *)
GetLocalEducationAgencyById
ää+ F
(
ääF G
string
ääG M
id
ääN P
)
ääP Q
{
ãã 	
var
åå "
localEducationAgency
åå $
=
åå% &
_restClient
çç 
.
çç 
GetById
çç #
<
çç# $"
LocalEducationAgency
çç$ 8
>
çç8 9
(
çç9 :
ResourcePaths
çç: G
.
ççG H&
LocalEducationAgencyById
ççH `
,
çç` a
id
ççb d
)
ççd e
;
ççe f
return
éé 
_mapper
éé 
.
éé 
Map
éé 
<
éé 
Models
éé %
.
éé% &"
LocalEducationAgency
éé& :
>
éé: ;
(
éé; <"
localEducationAgency
éé< P
)
ééP Q
;
ééQ R
}
èè 	
public
ëë 
Models
ëë 
.
ëë &
PostSecondaryInstitution
ëë .-
GetPostSecondaryInstitutionById
ëë/ N
(
ëëN O
string
ëëO U
id
ëëV X
)
ëëX Y
{
íí 	
var
ìì &
postSecondaryInstitution
ìì (
=
ìì) *
_restClient
îî 
.
îî 
GetById
îî #
<
îî# $&
PostSecondaryInstitution
îî$ <
>
îî< =
(
îî= >
ResourcePaths
îî> K
.
îîK L*
PostSecondaryInstitutionById
îîL h
,
îîh i
id
îîj l
)
îîl m
;
îîm n
return
ïï 
_mapper
ïï 
.
ïï 
Map
ïï 
<
ïï 
Models
ïï %
.
ïï% &&
PostSecondaryInstitution
ïï& >
>
ïï> ?
(
ïï? @&
postSecondaryInstitution
ïï@ X
)
ïïX Y
;
ïïY Z
}
ññ 	
public
òò 
OdsApiResult
òò *
EditPostSecondaryInstitution
òò 8
(
òò8 9
Models
òò9 ?
.
òò? @&
PostSecondaryInstitution
òò@ X
model
òòY ^
)
òò^ _
{
ôô 	
var
öö 
request
öö 
=
öö 
_mapper
öö !
.
öö! "
Map
öö" %
<
öö% &&
PostSecondaryInstitution
öö& >
>
öö> ?
(
öö? @
model
öö@ E
)
ööE F
;
ööF G
return
õõ 
_restClient
õõ 
.
õõ 
PutResource
õõ *
(
õõ* +
request
õõ+ 2
,
õõ2 3
ResourcePaths
õõ4 A
.
õõA B'
PostSecondaryInstitutions
õõB [
,
õõ[ \
request
õõ] d
.
õõd e
Id
õõe g
)
õõg h
;
õõh i
}
úú 	
public
ûû 
OdsApiResult
ûû &
EditLocalEducationAgency
ûû 4
(
ûû4 5
Models
ûû5 ;
.
ûû; <"
LocalEducationAgency
ûû< P
model
ûûQ V
)
ûûV W
{
üü 	
var
†† 
request
†† 
=
†† 
_mapper
†† !
.
††! "
Map
††" %
<
††% &"
LocalEducationAgency
††& :
>
††: ;
(
††; <
model
††< A
)
††A B
;
††B C
return
°° 
_restClient
°° 
.
°° 
PutResource
°° *
(
°°* +
request
°°+ 2
,
°°2 3
ResourcePaths
°°4 A
.
°°A B$
LocalEducationAgencies
°°B X
,
°°X Y
request
°°Z a
.
°°a b
Id
°°b d
)
°°d e
;
°°e f
}
¢¢ 	
public
§§ 
OdsApiResult
§§ (
DeleteLocalEducationAgency
§§ 6
(
§§6 7
string
§§7 =
id
§§> @
)
§§@ A
{
•• 	
return
¶¶ 
_restClient
¶¶ 
.
¶¶ 
DeleteResource
¶¶ -
(
¶¶- .
ResourcePaths
¶¶. ;
.
¶¶; <&
LocalEducationAgencyById
¶¶< T
,
¶¶T U
id
¶¶V X
)
¶¶X Y
;
¶¶Y Z
}
ßß 	
public
©© 
OdsApiResult
©© ,
DeletePostSecondaryInstitution
©© :
(
©©: ;
string
©©; A
id
©©B D
)
©©D E
{
™™ 	
return
´´ 
_restClient
´´ 
.
´´ 
DeleteResource
´´ -
(
´´- .
ResourcePaths
´´. ;
.
´´; <*
PostSecondaryInstitutionById
´´< X
,
´´X Y
id
´´Z \
)
´´\ ]
;
´´] ^
}
¨¨ 	
public
ÆÆ 
OdsApiResult
ÆÆ 
DeleteSchool
ÆÆ (
(
ÆÆ( )
string
ÆÆ) /
id
ÆÆ0 2
)
ÆÆ2 3
{
ØØ 	
return
∞∞ 
_restClient
∞∞ 
.
∞∞ 
DeleteResource
∞∞ -
(
∞∞- .
ResourcePaths
∞∞. ;
.
∞∞; <

SchoolById
∞∞< F
,
∞∞F G
id
∞∞H J
)
∞∞J K
;
∞∞K L
}
±± 	
public
≥≥ 
OdsApiResult
≥≥ 
	AddSchool
≥≥ %
(
≥≥% &
Models
≥≥& ,
.
≥≥, -
School
≥≥- 3
	newSchool
≥≥4 =
)
≥≥= >
{
¥¥ 	
var
µµ 
request
µµ 
=
µµ 
_mapper
µµ !
.
µµ! "
Map
µµ" %
<
µµ% &
School
µµ& ,
>
µµ, -
(
µµ- .
	newSchool
µµ. 7
)
µµ7 8
;
µµ8 9
return
∂∂ 
_restClient
∂∂ 
.
∂∂ 
PostResource
∂∂ +
(
∂∂+ ,
request
∂∂, 3
,
∂∂3 4
ResourcePaths
∂∂5 B
.
∂∂B C
Schools
∂∂C J
)
∂∂J K
;
∂∂K L
}
∑∑ 	
public
ππ 
OdsApiResult
ππ 
AddPsiSchool
ππ (
(
ππ( )
Models
ππ) /
.
ππ/ 0
	PsiSchool
ππ0 9
	newSchool
ππ: C
)
ππC D
{
∫∫ 	
var
ªª 
request
ªª 
=
ªª 
_mapper
ªª !
.
ªª! "
Map
ªª" %
<
ªª% &
School
ªª& ,
>
ªª, -
(
ªª- .
	newSchool
ªª. 7
)
ªª7 8
;
ªª8 9
return
ºº 
_restClient
ºº 
.
ºº 
PostResource
ºº +
(
ºº+ ,
request
ºº, 3
,
ºº3 4
ResourcePaths
ºº5 B
.
ººB C
Schools
ººC J
)
ººJ K
;
ººK L
}
ΩΩ 	
public
øø 
IReadOnlyList
øø 
<
øø 
string
øø #
>
øø# $
GetAllDescriptors
øø% 6
(
øø6 7
)
øø7 8
{
¿¿ 	
return
¡¡ 
_restClient
¡¡ 
.
¡¡ 
GetAllDescriptors
¡¡ 0
(
¡¡0 1
)
¡¡1 2
;
¡¡2 3
}
¬¬ 	
public
ƒƒ 
List
ƒƒ 
<
ƒƒ 

Descriptor
ƒƒ 
>
ƒƒ "
GetDescriptorsByPath
ƒƒ  4
(
ƒƒ4 5
string
ƒƒ5 ;
descriptorPath
ƒƒ< J
)
ƒƒJ K
{
≈≈ 	
var
∆∆ 
response
∆∆ 
=
∆∆ 
_restClient
∆∆ &
.
∆∆& '
GetAll
∆∆' -
<
∆∆- .
DomainModels
∆∆. :
.
∆∆: ;
EdFiDescriptor
∆∆; I
>
∆∆I J
(
∆∆J K
descriptorPath
∆∆K Y
)
∆∆Y Z
;
∆∆Z [
var
»» 
descriptors
»» 
=
»» 
new
»» !
List
»»" &
<
»»& '

Descriptor
»»' 1
>
»»1 2
(
»»2 3
)
»»3 4
;
»»4 5
foreach
…… 
(
…… 
var
…… 

descriptor
…… #
in
……$ &
response
……' /
)
……/ 0
{
   
descriptors
ÀÀ 
.
ÀÀ 
Add
ÀÀ 
(
ÀÀ  
new
ÀÀ  #

Descriptor
ÀÀ$ .
{
ÃÃ 
Id
ÕÕ 
=
ÕÕ 

descriptor
ÕÕ #
.
ÕÕ# $
	CodeValue
ÕÕ$ -
,
ÕÕ- .
	Namespace
ŒŒ 
=
ŒŒ 

descriptor
ŒŒ  *
.
ŒŒ* +
	Namespace
ŒŒ+ 4
,
ŒŒ4 5
Description
œœ 
=
œœ  !

descriptor
œœ" ,
.
œœ, -
Description
œœ- 8
,
œœ8 9
}
–– 
)
–– 
;
–– 
}
—— 
return
““ 
descriptors
““ 
;
““ 
}
”” 	
public
’’ 
Models
’’ 
.
’’ 
School
’’ 
GetSchoolById
’’ *
(
’’* +
string
’’+ 1
id
’’2 4
)
’’4 5
{
÷÷ 	
var
◊◊ 
school
◊◊ 
=
◊◊ 
_restClient
◊◊ $
.
◊◊$ %
GetById
◊◊% ,
<
◊◊, -
School
◊◊- 3
>
◊◊3 4
(
◊◊4 5
ResourcePaths
◊◊5 B
.
◊◊B C

SchoolById
◊◊C M
,
◊◊M N
id
◊◊O Q
)
◊◊Q R
;
◊◊R S
return
ÿÿ 
_mapper
ÿÿ 
.
ÿÿ 
Map
ÿÿ 
<
ÿÿ 
Models
ÿÿ %
.
ÿÿ% &
School
ÿÿ& ,
>
ÿÿ, -
(
ÿÿ- .
school
ÿÿ. 4
)
ÿÿ4 5
;
ÿÿ5 6
}
ŸŸ 	
public
€€ 
Models
€€ 
.
€€ 
	PsiSchool
€€ 
GetPsiSchoolById
€€  0
(
€€0 1
string
€€1 7
id
€€8 :
)
€€: ;
{
‹‹ 	
var
›› 
school
›› 
=
›› 
_restClient
›› $
.
››$ %
GetById
››% ,
<
››, -
School
››- 3
>
››3 4
(
››4 5
ResourcePaths
››5 B
.
››B C

SchoolById
››C M
,
››M N
id
››O Q
)
››Q R
;
››R S
return
ﬁﬁ 
_mapper
ﬁﬁ 
.
ﬁﬁ 
Map
ﬁﬁ 
<
ﬁﬁ 
Models
ﬁﬁ %
.
ﬁﬁ% &
	PsiSchool
ﬁﬁ& /
>
ﬁﬁ/ 0
(
ﬁﬁ0 1
school
ﬁﬁ1 7
)
ﬁﬁ7 8
;
ﬁﬁ8 9
}
ﬂﬂ 	
public
·· 
OdsApiResult
·· 

EditSchool
·· &
(
··& '
Models
··' -
.
··- .
School
··. 4
model
··5 :
)
··: ;
{
‚‚ 	
var
„„ 
request
„„ 
=
„„ 
_mapper
„„ !
.
„„! "
Map
„„" %
<
„„% &
School
„„& ,
>
„„, -
(
„„- .
model
„„. 3
)
„„3 4
;
„„4 5
return
‰‰ 
_restClient
‰‰ 
.
‰‰ 
PutResource
‰‰ *
(
‰‰* +
request
‰‰+ 2
,
‰‰2 3
ResourcePaths
‰‰4 A
.
‰‰A B
Schools
‰‰B I
,
‰‰I J
request
‰‰K R
.
‰‰R S
Id
‰‰S U
)
‰‰U V
;
‰‰V W
}
ÂÂ 	
public
ÁÁ 
OdsApiResult
ÁÁ 
EditPsiSchool
ÁÁ )
(
ÁÁ) *
Models
ÁÁ* 0
.
ÁÁ0 1
	PsiSchool
ÁÁ1 :
model
ÁÁ; @
)
ÁÁ@ A
{
ËË 	
var
ÈÈ 
request
ÈÈ 
=
ÈÈ 
_mapper
ÈÈ !
.
ÈÈ! "
Map
ÈÈ" %
<
ÈÈ% &
School
ÈÈ& ,
>
ÈÈ, -
(
ÈÈ- .
model
ÈÈ. 3
)
ÈÈ3 4
;
ÈÈ4 5
return
ÍÍ 
_restClient
ÍÍ 
.
ÍÍ 
PutResource
ÍÍ *
(
ÍÍ* +
request
ÍÍ+ 2
,
ÍÍ2 3
ResourcePaths
ÍÍ4 A
.
ÍÍA B
Schools
ÍÍB I
,
ÍÍI J
request
ÍÍK R
.
ÍÍR S
Id
ÍÍS U
)
ÍÍU V
;
ÍÍV W
}
ÎÎ 	
public
ÌÌ 
bool
ÌÌ 
DoesApiDataExist
ÌÌ $
(
ÌÌ$ %
)
ÌÌ% &
{
ÓÓ 	
var
ÔÔ 
response
ÔÔ 
=
ÔÔ 
_restClient
ÔÔ &
.
ÔÔ& '
GetAll
ÔÔ' -
<
ÔÔ- .
DomainModels
ÔÔ. :
.
ÔÔ: ;
EdFiDescriptor
ÔÔ; I
>
ÔÔI J
(
ÔÔJ K
ResourcePaths
ÔÔK X
.
ÔÔX Y#
GradeLevelDescriptors
ÔÔY n
)
ÔÔn o
;
ÔÔo p
return
 
response
 
.
 
Count
 !
>
" #
$num
$ %
;
% &
}
ÒÒ 	
public
ÛÛ 
List
ÛÛ 
<
ÛÛ 
SelectOptionModel
ÛÛ %
>
ÛÛ% &&
GetAllStateAbbreviations
ÛÛ' ?
(
ÛÛ? @
)
ÛÛ@ A
{
ÙÙ 	
var
ıı 
response
ıı 
=
ıı 
_restClient
ˆˆ 
.
ˆˆ 
GetAll
ˆˆ "
<
ˆˆ" #
DomainModels
ˆˆ# /
.
ˆˆ/ 0
EdFiDescriptor
ˆˆ0 >
>
ˆˆ> ?
(
ˆˆ? @
ResourcePaths
ˆˆ@ M
.
ˆˆM N*
StateAbbreviationDescriptors
ˆˆN j
)
ˆˆj k
;
ˆˆk l
return
˜˜ 
response
˜˜ 
.
˜˜ 
Select
˜˜ "
(
˜˜" #
x
˜˜# $
=>
˜˜% '.
 BuildDescriptorSelectOptionModel
˜˜( H
(
˜˜H I
x
˜˜I J
.
˜˜J K
	Namespace
˜˜K T
,
˜˜T U
x
˜˜V W
.
˜˜W X
	CodeValue
˜˜X a
,
˜˜a b
x
˜˜c d
.
˜˜d e
Description
˜˜e p
)
˜˜p q
)
˜˜q r
.
¯¯ 
ToList
¯¯ 
(
¯¯ 
)
¯¯ 
;
¯¯ 
}
˘˘ 	
private
˚˚ 
static
˚˚ 
SelectOptionModel
˚˚ (.
 BuildDescriptorSelectOptionModel
˚˚) I
(
˚˚I J
string
˚˚J P
	nameSpace
˚˚Q Z
,
˚˚Z [
string
˚˚\ b
code
˚˚c g
,
˚˚g h
string
˚˚i o
description
˚˚p {
)
˚˚{ |
{
¸¸ 	
return
˝˝ 
new
˝˝ 
SelectOptionModel
˝˝ (
{
˛˛ 
Value
ˇˇ 
=
ˇˇ 
	nameSpace
ˇˇ !
+
ˇˇ" #
$str
ˇˇ$ '
+
ˇˇ( )
code
ˇˇ* .
,
ˇˇ. /
DisplayText
ÄÄ 
=
ÄÄ 
description
ÄÄ )
}
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
}
ÉÉ 
}ÑÑ ÿ
]C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\OdsApiFacadeFactory.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Api		' *
{

 
public 

class 
OdsApiFacadeFactory $
:% & 
IOdsApiFacadeFactory' ;
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly !
IOdsRestClientFactory .
_restClientFactory/ A
;A B
public 
OdsApiFacadeFactory "
(" #
IMapper# *
mapper+ 1
,1 2!
IOdsRestClientFactory3 H
restClientFactoryI Z
)Z [
{ 	
_mapper 
= 
mapper 
; 
_restClientFactory 
=  
restClientFactory! 2
;2 3
} 	
public 
async 
Task 
< 
IOdsApiFacade '
>' (
Create) /
(/ 0
)0 1
{ 	
var 

restClient 
= 
await "
_restClientFactory# 5
.5 6
Create6 <
(< =
)= >
;> ?
return 
new 
OdsApiFacade #
(# $
_mapper$ +
,+ ,

restClient- 7
)7 8
;8 9
} 	
} 
} Ù
VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\OdsApiResult.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{ 
public 

class 
OdsApiResult 
{		 
public

 
string

 
ErrorMessage

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
public 
bool 
Success 
=> 
string %
.% &
IsNullOrEmpty& 3
(3 4
ErrorMessage4 @
)@ A
;A B
} 
} ô=
YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\OdsApiValidator.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{ 
public 

	interface 
IOdsApiValidator %
{ 
Task 
< !
OdsApiValidatorResult "
>" #
Validate$ ,
(, -
string- 3
apiServerUrl4 @
)@ A
;A B
} 
public 

class !
OdsApiValidatorResult &
{ 
public 
bool 
IsValidOdsApi !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Version 
Version 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
	Exception 
	Exception "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
public 

class 
OdsApiValidator  
:! "
IOdsApiValidator# 3
{   
private!! 
readonly!! 
ISimpleGetRequest!! *
_getRequest!!+ 6
;!!6 7
public## 
OdsApiValidator## 
(## 
ISimpleGetRequest## 0

getRequest##1 ;
)##; <
=>##= ?
_getRequest##@ K
=##L M

getRequest##N X
;##X Y
public%% 
async%% 
Task%% 
<%% !
OdsApiValidatorResult%% /
>%%/ 0
Validate%%1 9
(%%9 :
string%%: @
apiServerUrl%%A M
)%%M N
{&& 	
try'' 
{(( 
var)) 
contentAsString)) #
=))$ %
await))& +
_getRequest)), 7
.))7 8
DownloadString))8 F
())F G
apiServerUrl))G S
)))S T
;))T U
var++ 

schemaJson++ 
=++  
GetSchemaJson++! .
(++. /
)++/ 0
;++0 1
var-- 
schema-- 
=-- 
await-- "
NJsonSchema--# .
.--. /

JsonSchema--/ 9
.--9 :
FromJsonAsync--: G
(--G H

schemaJson--H R
)--R S
;--S T
var// 
parsedContent// !
=//" #
	ParseJson//$ -
(//- .
contentAsString//. =
)//= >
;//> ?
var11 
errors11 
=11 
schema11 #
.11# $
Validate11$ ,
(11, -
parsedContent11- :
)11: ;
;11; <
if33 
(33 
errors33 
.33 
Count33  
==33! #
$num33$ %
&&33& (
parsedContent33) 6
.336 7
TryGetValue337 B
(33B C
$str33C L
,33L M
out33N Q
var33R U
version33V ]
)33] ^
)33^ _
{44 
return55 
new55 !
OdsApiValidatorResult55 4
{66 
Version77 
=77  !
Version77" )
.77) *
Parse77* /
(77/ 0
version770 7
.777 8
Value778 =
<77= >
string77> D
>77D E
(77E F
)77F G
!77G H
)77H I
,77I J
IsValidOdsApi88 %
=88& '
true88( ,
}99 
;99 
}:: 
return<< 
errors<< 
.<< 
Count<< #
==<<$ &
$num<<' (
?== 
new== !
OdsApiValidatorResult== /
{==0 1
IsValidOdsApi==2 ?
===@ A
true==B F
}==G H
:>> (
InvalidOdsApiValidatorResult>> 2
(>>2 3
$str>>3 o
)>>o p
;>>p q
}?? 
catch@@ 
(@@ %
InvalidOperationException@@ ,
	exception@@- 6
)@@6 7
{AA 
returnBB (
InvalidOdsApiValidatorResultBB 3
(BB3 4
	exceptionBB4 =
.BB= >
MessageBB> E
)BBE F
;BBF G
}CC 
catchDD 
(DD 
JsonExceptionDD  
	exceptionDD! *
)DD* +
{EE 
returnFF (
InvalidOdsApiValidatorResultFF 3
(FF3 4
$"FF4 6
$str	FF6 î
{
FFî ï
	exception
FFï û
.
FFû ü
Message
FFü ¶
}
FF¶ ß
"
FFß ®
)
FF® ©
;
FF© ™
}GG 
catchHH 
(HH  
HttpRequestExceptionHH '
	exceptionHH( 1
)HH1 2
{II 
returnJJ (
InvalidOdsApiValidatorResultJJ 3
(JJ3 4
	exceptionJJ4 =
.JJ= >
MessageJJ> E
,JJE F
	exceptionJJG P
.JJP Q

StatusCodeJJQ [
??JJ\ ^
HttpStatusCodeJJ_ m
.JJm n
ServiceUnavailable	JJn Ä
)
JJÄ Å
;
JJÅ Ç
}KK 
catchLL 
(LL 
	ExceptionLL 
	exceptionLL &
)LL& '
{MM 
returnNN (
InvalidOdsApiValidatorResultNN 3
(NN3 4
	exceptionNN4 =
.NN= >
MessageNN> E
)NNE F
;NNF G
}OO 
stringQQ 
GetSchemaJsonQQ  
(QQ  !
)QQ! "
=>QQ# %
$str	QÅ& 
;
ÅÅ #
OdsApiValidatorResult
ÉÉ !*
InvalidOdsApiValidatorResult
ÉÉ" >
(
ÉÉ> ?
string
ÉÉ? E
exceptionMessage
ÉÉF V
,
ÉÉV W
HttpStatusCode
ÉÉX f

statusCode
ÉÉg q
=
ÉÉr s
HttpStatusCodeÉÉt Ç
.ÉÉÇ É"
ServiceUnavailableÉÉÉ ï
)ÉÉï ñ
{
ÑÑ 
var
ÖÖ 
message
ÖÖ 
=
ÖÖ 
$"
ÜÜ 
$str
ÜÜ a
{
ÜÜa b
apiServerUrl
ÜÜb n
}
ÜÜn o
$strÜÜo â
"ÜÜâ ä
;ÜÜä ã
if
áá 
(
áá 
!
áá 
string
áá 
.
áá 
IsNullOrEmpty
áá )
(
áá) *
exceptionMessage
áá* :
)
áá: ;
)
áá; <
{
àà 
message
ââ 
+=
ââ 
$"
ââ !
$str
ââ! 1
{
ââ1 2
exceptionMessage
ââ2 B
}
ââB C
"
ââC D
;
ââD E
}
ää 
return
åå 
new
åå #
OdsApiValidatorResult
åå 0
{
çç 
IsValidOdsApi
éé !
=
éé" #
false
éé$ )
,
éé) *
	Exception
èè 
=
èè 
new
èè  #'
OdsApiConnectionException
èè$ =
(
èè= >

statusCode
êê &
,
êê& '
$str
êê( E
,
êêE F
message
êêG N
)
êêN O
{
ëë 
AllowFeedback
ëë #
=
ëë$ %
false
ëë& +
}
ëë, -
}
íí 
;
íí 
}
ìì 
}
îî 	
private
ññ 
static
ññ 
JObject
ññ 
	ParseJson
ññ (
(
ññ( )
string
ññ) /
contentAsString
ññ0 ?
)
ññ? @
{
óó 	
return
òò 
string
òò 
.
òò 
IsNullOrEmpty
òò '
(
òò' (
contentAsString
òò( 7
)
òò7 8
?
ôô 
null
ôô 
:
öö 
JObject
öö 
.
öö 
Parse
öö 
(
öö  
contentAsString
öö  /
)
öö/ 0
;
öö0 1
}
õõ 	
}
úú 
}ùù è¿
WC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\OdsRestClient.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{ 
public 

class 
OdsRestClient 
:  
IOdsRestClient! /
{ 
private 
readonly '
OdsApiConnectionInformation 4"
_connectionInformation5 K
;K L
private 
readonly 
ITokenRetriever (
_tokenRetriever) 8
;8 9
private 
string 
_bearerToken #
;# $
private 
readonly 
IRestClient $
_restClient% 0
;0 1
private 
static 
ILog 
_logger #
;# $
public 
OdsRestClient 
( '
OdsApiConnectionInformation 8!
connectionInformation9 N
,N O
IRestClientP [

restClient\ f
,f g
ITokenRetrieverh w
tokenRetriever	x Ü
)
Ü á
{ 	"
_connectionInformation "
=# $!
connectionInformation% :
;: ;
_tokenRetriever 
= 
tokenRetriever ,
;, -
_restClient 
= 

restClient $
;$ %
_logger 
= 

LogManager  
.  !
	GetLogger! *
(* +
typeof+ 1
(1 2
OdsRestClient2 ?
)? @
)@ A
;A B
}   	
private"" 
string"" 
GetAuthHeaderValue"" )
("") *
bool""* .
refreshToken""/ ;
=""< =
false""> C
)""C D
{## 	
if$$ 
($$ 
_bearerToken$$ 
==$$ 
null$$  $
||$$% '
refreshToken$$( 4
)$$4 5
{%% 
_bearerToken&& 
=&& 
_tokenRetriever&& .
.&&. / 
ObtainNewBearerToken&&/ C
(&&C D
)&&D E
;&&E F
}'' 
return)) 
$str)) 
+)) 
_bearerToken)) +
;))+ ,
}** 	
private,, 
RestRequest,, 

OdsRequest,, &
(,,& '
string,,' -
resource,,. 6
),,6 7
{-- 	
var.. 
request.. 
=.. 
new.. 
RestRequest.. )
(..) *
resource..* 2
)..2 3
{..4 5
RequestFormat..5 B
=..C D

DataFormat..E O
...O P
Json..P T
}..T U
;..U V
request// 
.// 
	AddHeader// 
(// 
$str// &
,//& '
$str//( :
)//: ;
;//; <
request00 
.00 
	AddHeader00 
(00 
$str00 -
,00- .
GetAuthHeaderValue00/ A
(00A B
)00B C
)00C D
;00D E
return11 
request11 
;11 
}22 	
private44 
OdsApiResult44 &
ExecuteWithDefaultResponse44 7
(447 8
IRestRequest448 D
request44E L
)44L M
{55 	
try66 
{77 )
ExecuteRequestAndHandleErrors88 -
(88- .
request88. 5
)885 6
;886 7
return99 
new99 
OdsApiResult99 '
(99' (
)99( )
;99) *
}:: 
catch;; 
(;; 
	Exception;; 
e;; 
);; 
{<< 
return== 
new== 
OdsApiResult== '
{==( )
ErrorMessage==* 6
===7 8
e==9 :
.==: ;
Message==; B
}==C D
;==D E
}>> 
}?? 	
privateAA 
IRestResponseAA )
ExecuteRequestAndHandleErrorsAA ;
(AA; <
IRestRequestAA< H
requestAAI P
)AAP Q
{BB 	
IRestResponseCC 
responseCC "
;CC" #
tryDD 
{EE 
responseFF 
=FF 
_restClientFF &
.FF& '
ExecuteFF' .
(FF. /
requestFF/ 6
)FF6 7
;FF7 8
}GG 
catchHH 
(HH 
	ExceptionHH 
exHH 
)HH  
{II 
throwJJ 
newJJ 
AdminAppExceptionJJ +
(JJ+ ,
$"JJ, .
$strJJ. J
{JJJ K
exJJK M
.JJM N
MessageJJN U
}JJU V
"JJV W
,JJW X
exJJY [
)JJ[ \
;JJ\ ]
}KK 
ifMM 
(MM 
responseMM 
.MM 
IsSuccessfulMM %
)MM% &
returnNN 
responseNN 
;NN  
_loggerPP 
.PP 
DebugPP 
(PP 
$strPP '
)PP' (
;PP( )
_loggerQQ 
.QQ 
DebugQQ 
(QQ 
responseQQ "
.QQ" #

StatusCodeQQ# -
)QQ- .
;QQ. /
_loggerSS 
.SS 
DebugSS 
(SS 
$strSS (
)SS( )
;SS) *
_loggerTT 
.TT 
DebugTT 
(TT 
responseTT "
.TT" #
ContentTT# *
)TT* +
;TT+ ,
_loggerVV 
.VV 
DebugVV 
(VV 
$strVV /
)VV/ 0
;VV0 1
_loggerWW 
.WW 
DebugWW 
(WW 
responseWW "
.WW" #
ErrorExceptionWW# 1
)WW1 2
;WW2 3
varYY 
embeddedErrorYY 
=YY 
responseYY  (
.YY( )
ErrorExceptionYY) 7
?YY7 8
.YY8 9
MessageYY9 @
??YYA C
responseYYD L
.YYL M
ErrorMessageYYM Y
;YYY Z
varZZ 

contentObjZZ 
=ZZ 
JsonConvertZZ (
.ZZ( )
DeserializeObjectZZ) :
<ZZ: ;
JObjectZZ; B
>ZZB C
(ZZC D
responseZZD L
.ZZL M
ContentZZM T
)ZZT U
??ZZV X
newZZY \
JObjectZZ] d
(ZZd e
)ZZe f
;ZZf g

contentObj[[ 
.[[ 
TryGetValue[[ "
([[" #
$str[[# ,
,[[, -
out[[. 1
var[[2 5
contentMessage[[6 D
)[[D E
;[[E F
var]] 
errorMesssage]] 
=]] 
!]]  !
string]]! '
.]]' (
IsNullOrEmpty]]( 5
(]]5 6
embeddedError]]6 C
)]]C D
?^^ 
embeddedError^^ 
:__ 
contentMessage__  
?__  !
.__! "
ToString__" *
(__* +
)__+ ,
??__- /
$"__0 2
$str__2 `
{__` a
response__a i
.__i j

StatusCode__j t
}__t u
"__u v
;__v w
throwaa 
newaa %
OdsApiConnectionExceptionaa /
(aa/ 0
responseaa0 8
.aa8 9

StatusCodeaa9 C
,aaC D
embeddedErroraaE R
,aaR S
errorMesssageaaT a
)aaa b
;aab c
}bb 	
publicdd 
IReadOnlyListdd 
<dd 
Tdd 
>dd 
GetAlldd  &
<dd& '
Tdd' (
>dd( )
(dd) *
stringdd* 0
elementPathdd1 <
,dd< =
intdd> A
offsetddB H
,ddH I
intddJ M
limitddN S
=ddT U
$numddV X
)ddX Y
whereddZ _
Tdd` a
:ddb c
classddd i
{ee 	
varff 
requestff 
=ff 

OdsRequestff $
(ff$ %
elementPathff% 0
)ff0 1
;ff1 2
requestgg 
.gg 
AddParametergg  
(gg  !
$strgg! )
,gg) *
offsetgg+ 1
)gg1 2
;gg2 3
requesthh 
.hh 
AddParameterhh  
(hh  !
$strhh! (
,hh( )
limithh* /
)hh/ 0
;hh0 1
varjj 
responseListjj 
=jj 
newjj "
Listjj# '
<jj' (
Tjj( )
>jj) *
(jj* +
)jj+ ,
;jj, -
Listkk 
<kk 
Tkk 
>kk 
	pageItemskk 
;kk 
varmm 
restResponsemm 
=mm )
ExecuteRequestAndHandleErrorsmm <
(mm< =
requestmm= D
)mmD E
;mmE F
	pageItemsoo 
=oo 
JsonConvertoo #
.oo# $
DeserializeObjectoo$ 5
<oo5 6
Listoo6 :
<oo: ;
Too; <
>oo< =
>oo= >
(oo> ?
restResponseoo? K
.ooK L
ContentooL S
)ooS T
;ooT U
responseListpp 
.pp 
AddRangepp !
(pp! "
	pageItemspp" +
)pp+ ,
;pp, -
returnrr 
responseListrr 
;rr  
}ss 	
publicuu 
IReadOnlyListuu 
<uu 
Tuu 
>uu 
GetAlluu  &
<uu& '
Tuu' (
>uu( )
(uu) *
stringuu* 0
elementPathuu1 <
)uu< =
whereuu> C
TuuD E
:uuF G
classuuH M
{vv 	
varww 
offsetww 
=ww 
$numww 
;ww 
constxx 
intxx 
limitxx 
=xx 
$numxx  
;xx  !
varzz 
requestzz 
=zz 

OdsRequestzz $
(zz$ %
elementPathzz% 0
)zz0 1
;zz1 2
request{{ 
.{{ 
AddParameter{{  
({{  !
$str{{! )
,{{) *
offset{{+ 1
){{1 2
;{{2 3
request|| 
.|| 
AddParameter||  
(||  !
$str||! (
,||( )
limit||* /
)||/ 0
;||0 1
var~~ 
responseList~~ 
=~~ 
new~~ "
List~~# '
<~~' (
T~~( )
>~~) *
(~~* +
)~~+ ,
;~~, -
List 
< 
T 
> 
	pageItems 
; 
do
ÅÅ 
{
ÇÇ 
var
ÉÉ 
restResponse
ÉÉ  
=
ÉÉ! "+
ExecuteRequestAndHandleErrors
ÉÉ# @
(
ÉÉ@ A
request
ÉÉA H
)
ÉÉH I
;
ÉÉI J
	pageItems
ÖÖ 
=
ÖÖ 
JsonConvert
ÖÖ '
.
ÖÖ' (
DeserializeObject
ÖÖ( 9
<
ÖÖ9 :
List
ÖÖ: >
<
ÖÖ> ?
T
ÖÖ? @
>
ÖÖ@ A
>
ÖÖA B
(
ÖÖB C
restResponse
ÖÖC O
.
ÖÖO P
Content
ÖÖP W
)
ÖÖW X
;
ÖÖX Y
responseList
ÜÜ 
.
ÜÜ 
AddRange
ÜÜ %
(
ÜÜ% &
	pageItems
ÜÜ& /
)
ÜÜ/ 0
;
ÜÜ0 1
offset
àà 
+=
àà 
limit
àà 
;
àà  
request
ââ 
.
ââ 

Parameters
ââ "
.
ââ" #
Single
ââ# )
(
ââ) *
x
ââ* +
=>
ââ, .
x
ââ/ 0
.
ââ0 1
Name
ââ1 5
==
ââ6 8
$str
ââ9 A
)
ââA B
.
ââB C
Value
ââC H
=
ââI J
offset
ââK Q
;
ââQ R
}
ää 
while
ãã 
(
ãã 
	pageItems
ãã 
.
ãã 
Count
ãã "
>=
ãã# %
limit
ãã& +
)
ãã+ ,
;
ãã, -
return
çç 
responseList
çç 
;
çç  
}
éé 	
public
êê 
IReadOnlyList
êê 
<
êê 
T
êê 
>
êê 
GetAll
êê  &
<
êê& '
T
êê' (
>
êê( )
(
êê) *
string
êê* 0
elementPath
êê1 <
,
êê< =

Dictionary
êê> H
<
êêH I
string
êêI O
,
êêO P
object
êêQ W
>
êêW X
filters
êêY `
)
êê` a
where
êêb g
T
êêh i
:
êêj k
class
êêl q
{
ëë 	
var
íí 
offset
íí 
=
íí 
$num
íí 
;
íí 
const
ìì 
int
ìì 
limit
ìì 
=
ìì 
$num
ìì  
;
ìì  !
var
ïï 
request
ïï 
=
ïï 

OdsRequest
ïï $
(
ïï$ %
elementPath
ïï% 0
)
ïï0 1
;
ïï1 2
request
ññ 
.
ññ 
AddParameter
ññ  
(
ññ  !
$str
ññ! )
,
ññ) *
offset
ññ+ 1
)
ññ1 2
;
ññ2 3
request
óó 
.
óó 
AddParameter
óó  
(
óó  !
$str
óó! (
,
óó( )
limit
óó* /
)
óó/ 0
;
óó0 1
foreach
ôô 
(
ôô 
var
ôô 
(
ôô 
key
ôô 
,
ôô 
value
ôô $
)
ôô$ %
in
ôô& (
filters
ôô) 0
)
ôô0 1
{
öö 
request
õõ 
.
õõ 
AddParameter
õõ $
(
õõ$ %
key
õõ% (
,
õõ( )
value
õõ* /
)
õõ/ 0
;
õõ0 1
}
úú 
var
ûû 
responseList
ûû 
=
ûû 
new
ûû "
List
ûû# '
<
ûû' (
T
ûû( )
>
ûû) *
(
ûû* +
)
ûû+ ,
;
ûû, -
List
üü 
<
üü 
T
üü 
>
üü 
	pageItems
üü 
;
üü 
do
°° 
{
¢¢ 
var
££ 
restResponse
££  
=
££! "+
ExecuteRequestAndHandleErrors
££# @
(
££@ A
request
££A H
)
££H I
;
££I J
	pageItems
•• 
=
•• 
JsonConvert
•• '
.
••' (
DeserializeObject
••( 9
<
••9 :
List
••: >
<
••> ?
T
••? @
>
••@ A
>
••A B
(
••B C
restResponse
••C O
.
••O P
Content
••P W
)
••W X
;
••X Y
responseList
¶¶ 
.
¶¶ 
AddRange
¶¶ %
(
¶¶% &
	pageItems
¶¶& /
)
¶¶/ 0
;
¶¶0 1
offset
®® 
+=
®® 
limit
®® 
;
®®  
request
©© 
.
©© 

Parameters
©© "
.
©©" #
Single
©©# )
(
©©) *
x
©©* +
=>
©©, .
x
©©/ 0
.
©©0 1
Name
©©1 5
==
©©6 8
$str
©©9 A
)
©©A B
.
©©B C
Value
©©C H
=
©©I J
offset
©©K Q
;
©©Q R
}
™™ 
while
´´ 
(
´´ 
	pageItems
´´ 
.
´´ 
Count
´´ "
>=
´´# %
limit
´´& +
)
´´+ ,
;
´´, -
return
≠≠ 
responseList
≠≠ 
;
≠≠  
}
ÆÆ 	
public
∞∞ 
T
∞∞ 
GetById
∞∞ 
<
∞∞ 
T
∞∞ 
>
∞∞ 
(
∞∞ 
string
∞∞ "
elementPath
∞∞# .
,
∞∞. /
string
∞∞0 6
id
∞∞7 9
)
∞∞9 :
where
∞∞; @
T
∞∞A B
:
∞∞C D
class
∞∞E J
{
±± 	
var
≤≤ 
request
≤≤ 
=
≤≤ 

OdsRequest
≤≤ $
(
≤≤$ %
elementPath
≤≤% 0
)
≤≤0 1
;
≤≤1 2
request
≥≥ 
.
≥≥ 
AddUrlSegment
≥≥ !
(
≥≥! "
$str
≥≥" &
,
≥≥& '
id
≥≥( *
)
≥≥* +
;
≥≥+ ,
var
¥¥ 
response
¥¥ 
=
¥¥ +
ExecuteRequestAndHandleErrors
¥¥ 8
(
¥¥8 9
request
¥¥9 @
)
¥¥@ A
;
¥¥A B
return
µµ 
JsonConvert
µµ 
.
µµ 
DeserializeObject
µµ 0
<
µµ0 1
T
µµ1 2
>
µµ2 3
(
µµ3 4
response
µµ4 <
.
µµ< =
Content
µµ= D
)
µµD E
;
µµE F
}
∂∂ 	
public
∏∏ 
OdsApiResult
∏∏ 
PostResource
∏∏ (
<
∏∏( )
T
∏∏) *
>
∏∏* +
(
∏∏+ ,
T
∏∏, -
resource
∏∏. 6
,
∏∏6 7
string
∏∏8 >
elementPath
∏∏? J
,
∏∏J K
bool
∏∏L P
refreshToken
∏∏Q ]
=
∏∏^ _
false
∏∏` e
)
∏∏e f
{
ππ 	
var
∫∫ 
request
∫∫ 
=
∫∫ 

OdsRequest
∫∫ $
(
∫∫$ %
elementPath
∫∫% 0
)
∫∫0 1
;
∫∫1 2
request
ªª 
.
ªª 
Method
ªª 
=
ªª 
Method
ªª #
.
ªª# $
POST
ªª$ (
;
ªª( )
try
ΩΩ 
{
ææ 
var
øø 
	jsonInput
øø 
=
øø 
JsonConvert
øø  +
.
øø+ ,
SerializeObject
øø, ;
(
øø; <
resource
øø< D
)
øøD E
;
øøE F
request
¿¿ 
.
¿¿ 
AddParameter
¿¿ $
(
¿¿$ %
$str
¿¿% F
,
¿¿F G
	jsonInput
¿¿H Q
,
¿¿Q R
ParameterType
¿¿S `
.
¿¿` a
RequestBody
¿¿a l
)
¿¿l m
;
¿¿m n
}
¡¡ 
catch
¬¬ 
(
¬¬ 
	Exception
¬¬ 
ex
¬¬ 
)
¬¬  
{
√√ 
throw
ƒƒ 
new
ƒƒ 
AdminAppException
ƒƒ +
(
ƒƒ+ ,
$str
ƒƒ, J
,
ƒƒJ K
ex
ƒƒL N
)
ƒƒN O
;
ƒƒO P
}
≈≈ 
return
∆∆ (
ExecuteWithDefaultResponse
∆∆ -
(
∆∆- .
request
∆∆. 5
)
∆∆5 6
;
∆∆6 7
}
«« 	
public
…… 
OdsApiResult
…… 
PutResource
…… '
<
……' (
T
……( )
>
……) *
(
……* +
T
……+ ,
resource
……- 5
,
……5 6
string
……7 =
elementPath
……> I
,
……I J
string
……K Q
id
……R T
,
……T U
bool
……V Z
refreshToken
……[ g
=
……h i
false
……j o
)
……o p
{
   	
var
ÀÀ 
request
ÀÀ 
=
ÀÀ 

OdsRequest
ÀÀ $
(
ÀÀ$ %
$"
ÀÀ% '
{
ÀÀ' (
elementPath
ÀÀ( 3
}
ÀÀ3 4
$str
ÀÀ4 5
{
ÀÀ5 6
id
ÀÀ6 8
}
ÀÀ8 9
"
ÀÀ9 :
)
ÀÀ: ;
;
ÀÀ; <
request
ÃÃ 
.
ÃÃ 
Method
ÃÃ 
=
ÃÃ 
Method
ÃÃ #
.
ÃÃ# $
PUT
ÃÃ$ '
;
ÃÃ' (
try
ŒŒ 
{
œœ 
var
–– 
	jsonInput
–– 
=
–– 
JsonConvert
––  +
.
––+ ,
SerializeObject
––, ;
(
––; <
resource
––< D
)
––D E
;
––E F
request
—— 
.
—— 
AddParameter
—— $
(
——$ %
$str
——% F
,
——F G
	jsonInput
——H Q
,
——Q R
ParameterType
——S `
.
——` a
RequestBody
——a l
)
——l m
;
——m n
}
““ 
catch
”” 
(
”” 
	Exception
”” 
ex
”” 
)
””  
{
‘‘ 
throw
’’ 
new
’’ 
AdminAppException
’’ +
(
’’+ ,
$str
’’, J
,
’’J K
ex
’’L N
)
’’N O
;
’’O P
}
÷÷ 
return
ÿÿ (
ExecuteWithDefaultResponse
ÿÿ -
(
ÿÿ- .
request
ÿÿ. 5
)
ÿÿ5 6
;
ÿÿ6 7
}
ŸŸ 	
public
€€ 
IReadOnlyList
€€ 
<
€€ 
string
€€ #
>
€€# $
GetAllDescriptors
€€% 6
(
€€6 7
)
€€7 8
{
‹‹ 	
_restClient
›› 
.
›› 
BaseUrl
›› 
=
››  !
new
››" %
Uri
››& )
(
››) *$
_connectionInformation
››* @
.
››@ A
DescriptorsUrl
››A O
)
››O P
;
››P Q
var
ﬁﬁ 
request
ﬁﬁ 
=
ﬁﬁ 

OdsRequest
ﬁﬁ $
(
ﬁﬁ$ %
$str
ﬁﬁ% 3
)
ﬁﬁ3 4
;
ﬁﬁ4 5
var
ﬂﬂ 
response
ﬂﬂ 
=
ﬂﬂ +
ExecuteRequestAndHandleErrors
ﬂﬂ 8
(
ﬂﬂ8 9
request
ﬂﬂ9 @
)
ﬂﬂ@ A
;
ﬂﬂA B
var
‡‡ 
swaggerDocument
‡‡ 
=
‡‡  !
JsonConvert
‡‡" -
.
‡‡- .
DeserializeObject
‡‡. ?
<
‡‡? @
JObject
‡‡@ G
>
‡‡G H
(
‡‡H I
response
‡‡I Q
.
‡‡Q R
Content
‡‡R Y
)
‡‡Y Z
;
‡‡Z [
var
·· 
descriptorPaths
·· 
=
··  !
swaggerDocument
··" 1
[
··1 2
$str
··2 9
]
··9 :
.
··: ;
ToObject
··; C
<
··C D

Dictionary
··D N
<
··N O
string
··O U
,
··U V
JObject
··W ^
>
··^ _
>
··_ `
(
··` a
)
··a b
;
··b c
var
„„ 
descriptorsList
„„ 
=
„„  !
new
„„" %
	SortedSet
„„& /
<
„„/ 0
string
„„0 6
>
„„6 7
(
„„7 8
)
„„8 9
;
„„9 :
if
ÂÂ 
(
ÂÂ 
descriptorPaths
ÂÂ 
!=
ÂÂ  "
null
ÂÂ# '
)
ÂÂ' (
{
ÊÊ 
foreach
ÁÁ 
(
ÁÁ 
var
ÁÁ 
descriptorPath
ÁÁ +
in
ÁÁ, .
descriptorPaths
ÁÁ/ >
.
ÁÁ> ?
Keys
ÁÁ? C
)
ÁÁC D
{
ËË 
var
ÎÎ 
resourceParts
ÎÎ %
=
ÎÎ& '
descriptorPath
ÎÎ( 6
.
ÎÎ6 7
	TrimStart
ÎÎ7 @
(
ÎÎ@ A
$char
ÎÎA D
)
ÎÎD E
.
ÎÎE F
Split
ÎÎF K
(
ÎÎK L
$char
ÎÎL O
)
ÎÎO P
.
ÎÎP Q
Take
ÎÎQ U
(
ÎÎU V
$num
ÎÎV W
)
ÎÎW X
.
ÎÎX Y
ToArray
ÎÎY `
(
ÎÎ` a
)
ÎÎa b
;
ÎÎb c
if
ÌÌ 
(
ÌÌ 
resourceParts
ÌÌ %
.
ÌÌ% &
Length
ÌÌ& ,
>=
ÌÌ- /
$num
ÌÌ0 1
)
ÌÌ1 2
descriptorsList
ÓÓ '
.
ÓÓ' (
Add
ÓÓ( +
(
ÓÓ+ ,
$"
ÓÓ, .
$str
ÓÓ. /
{
ÓÓ/ 0
resourceParts
ÓÓ0 =
[
ÓÓ= >
$num
ÓÓ> ?
]
ÓÓ? @
}
ÓÓ@ A
$str
ÓÓA B
{
ÓÓB C
resourceParts
ÓÓC P
[
ÓÓP Q
$num
ÓÓQ R
]
ÓÓR S
}
ÓÓS T
"
ÓÓT U
)
ÓÓU V
;
ÓÓV W
}
ÔÔ 
}
 
return
ÚÚ 
descriptorsList
ÚÚ "
.
ÚÚ" #
ToList
ÚÚ# )
(
ÚÚ) *
)
ÚÚ* +
;
ÚÚ+ ,
}
ÛÛ 	
public
ıı 
OdsApiResult
ıı 
DeleteResource
ıı *
(
ıı* +
string
ıı+ 1
elementPath
ıı2 =
,
ıı= >
string
ıı? E
id
ııF H
,
ııH I
bool
ııJ N
refreshToken
ııO [
=
ıı\ ]
false
ıı^ c
)
ııc d
{
ˆˆ 	
var
˜˜ 
request
˜˜ 
=
˜˜ 

OdsRequest
˜˜ $
(
˜˜$ %
elementPath
˜˜% 0
)
˜˜0 1
;
˜˜1 2
request
¯¯ 
.
¯¯ 
Method
¯¯ 
=
¯¯ 
Method
¯¯ #
.
¯¯# $
DELETE
¯¯$ *
;
¯¯* +
request
˘˘ 
.
˘˘ 
AddUrlSegment
˘˘ !
(
˘˘! "
$str
˘˘" &
,
˘˘& '
id
˘˘( *
)
˘˘* +
;
˘˘+ ,
return
˙˙ (
ExecuteWithDefaultResponse
˙˙ -
(
˙˙- .
request
˙˙. 5
)
˙˙5 6
;
˙˙6 7
}
˚˚ 	
}
¸¸ 
}˝˝ à
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\OdsRestClientFactory.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Api		' *
{

 
public 

class  
OdsRestClientFactory %
:& '!
IOdsRestClientFactory( =
{ 
private 
readonly 0
$IOdsApiConnectionInformationProvider =0
$_odsApiConnectionInformationProvider> b
;b c
private 
readonly 
IOdsApiValidator )
_odsApiValidator* :
;: ;
private 
TokenRetriever 
_tokenRetriever .
;. /
private 

RestClient 
_restClient &
;& '
public  
OdsRestClientFactory #
(# $0
$IOdsApiConnectionInformationProvider$ H/
#odsApiConnectionInformationProviderI l
,l m
IOdsApiValidatorn ~
odsApiValidator	 é
)
é è
{ 	0
$_odsApiConnectionInformationProvider 0
=1 2/
#odsApiConnectionInformationProvider3 V
;V W
_odsApiValidator 
= 
odsApiValidator .
;. /
} 	
public 
async 
Task 
< 
IOdsRestClient (
>( )
Create* 0
(0 1
)1 2
{ 	
var 
connectionInfo 
=  
await! &0
$_odsApiConnectionInformationProvider' K
.K L2
&GetConnectionInformationForEnvironmentL r
(r s
)s t
;t u
var 
validatorResult 
=  !
await" '
_odsApiValidator( 8
.8 9
Validate9 A
(A B
connectionInfoB P
.P Q
ApiServerUrlQ ]
)] ^
;^ _
if 
( 
! 
validatorResult  
.  !
IsValidOdsApi! .
). /
{ 
throw 
validatorResult %
.% &
	Exception& /
;/ 0
}   
_tokenRetriever"" 
="" 
new"" !
TokenRetriever""" 0
(""0 1
connectionInfo""1 ?
)""? @
;""@ A
_restClient## 
=## 
new## 

RestClient## (
(##( )
connectionInfo##) 7
.##7 8

ApiBaseUrl##8 B
)##B C
;##C D
return$$ 
new$$ 
OdsRestClient$$ $
($$$ %
connectionInfo$$% 3
,$$3 4
_restClient$$5 @
,$$@ A
_tokenRetriever$$B Q
)$$Q R
;$$R S
}%% 	
}&& 
}'' ÍC
XC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Api\TokenRetriever.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Api' *
{ 
public 

	interface 
ITokenRetriever $
{ 
string  
ObtainNewBearerToken #
(# $
)$ %
;% &
} 
public 

class 
TokenRetriever 
:  !
ITokenRetriever" 1
{ 
private 
readonly '
OdsApiConnectionInformation 4"
_connectionInformation5 K
;K L
public 
TokenRetriever 
( '
OdsApiConnectionInformation 9!
connectionInformation: O
)O P
{ 	"
_connectionInformation "
=# $!
connectionInformation% :
;: ;
} 	
public 
string  
ObtainNewBearerToken *
(* +
)+ ,
{   	
var!! 
oauthClient!! 
=!! 
new!! !

RestClient!!" ,
(!!, -"
_connectionInformation!!- C
.!!C D
OAuthUrl!!D L
)!!L M
;!!M N
try## 
{$$ 
return%% 
GetBearerToken%% %
(%%% &
oauthClient%%& 1
)%%1 2
;%%2 3
}&& 
catch'' 
('' %
OdsApiConnectionException'' ,
)'', -
{(( 
throw)) 
;)) 
}** 
catch++ 
(++ 
JsonException++  
	exception++! *
)++* +
{,, 
throw-- 
new-- 
AdminAppException-- +
(--+ ,
$"--, .
$str--. n
{--n o#
_connectionInformation	--o Ö
.
--Ö Ü
OAuthUrl
--Ü é
}
--é è
$str
--è ©
"
--© ™
,
--™ ´
	exception
--¨ µ
)
--µ ∂
{
--∑ ∏
AllowFeedback
--π ∆
=
--« »
false
--… Œ
,
--Œ œ
}
--– —
;
--— “
}.. 
catch// 
(// 
	Exception// 
	exception// &
)//& '
{00 
throw11 
new11 
AdminAppException11 +
(11+ ,
$"11, .
$str11. X
{11X Y
	exception11Y b
.11b c
Message11c j
}11j k
"11k l
,11l m
	exception11n w
)11w x
;11x y
}22 
}33 	
private55 
string55 
GetBearerToken55 %
(55% &
IRestClient55& 1
oauthClient552 =
)55= >
{66 	
var77 
bearerTokenRequest77 "
=77# $
new77% (
RestRequest77) 4
(774 5
$str775 B
,77B C
Method77D J
.77J K
POST77K O
)77O P
;77P Q
bearerTokenRequest88 
.88 
AddParameter88 +
(88+ ,
$str88, 7
,887 8"
_connectionInformation889 O
.88O P
	ClientKey88P Y
)88Y Z
;88Z [
bearerTokenRequest99 
.99 
AddParameter99 +
(99+ ,
$str99, ;
,99; <"
_connectionInformation99= S
.99S T
ClientSecret99T `
)99` a
;99a b
bearerTokenRequest:: 
.:: 
AddParameter:: +
(::+ ,
$str::, 8
,::8 9
$str::: N
)::N O
;::O P
var<< 
bearerTokenResponse<< #
=<<$ %
oauthClient<<& 1
.<<1 2
Execute<<2 9
<<<9 :
BearerTokenResponse<<: M
><<M N
(<<N O
bearerTokenRequest<<O a
)<<a b
;<<b c
var>> "
additionalErrorMessage>> &
=>>' (
$str	>>) ¶
;
>>¶ ß
switch@@ 
(@@ 
bearerTokenResponse@@ '
.@@' (

StatusCode@@( 2
)@@2 3
{AA 
caseBB 
HttpStatusCodeBB #
.BB# $
OKBB$ &
:BB& '
breakCC 
;CC 
caseDD 
$numDD 
:DD 
throwEE 
newEE %
OdsApiConnectionExceptionEE 7
(EE7 8
HttpStatusCodeEE8 F
.EEF G
NotFoundEEG O
,EEO P
bearerTokenResponseEEQ d
.EEd e
ErrorMessageEEe q
,EEq r
$"FF 
$strFF G
{FFG H"
_connectionInformationFFH ^
.FF^ _
ApiServerUrlFF_ k
}FFk l
$strFFl {
{FF{ |#
additionalErrorMessage	FF| í
}
FFí ì
"
FFì î
)
FFî ï
{
FFï ñ
AllowFeedback
FFó §
=
FF• ¶
false
FFß ¨
,
FF¨ ≠
}
FFÆ Ø
;
FFØ ∞
caseGG 
HttpStatusCodeGG #
.GG# $
NotFoundGG$ ,
:GG, -
throwHH 
newHH %
OdsApiConnectionExceptionHH 7
(HH7 8
HttpStatusCodeHH8 F
.HHF G
NotFoundHHG O
,HHO P
bearerTokenResponseHHQ d
.HHd e
ErrorMessageHHe q
,HHq r
$"II 
$strII D
{IID E"
_connectionInformationIIE [
.II[ \
ApiServerUrlII\ h
}IIh i
$str	IIi Ñ
"
IIÑ Ö
)
IIÖ Ü
{
IIÜ á
AllowFeedback
IIà ï
=
IIñ ó
false
IIò ù
,
IIù û
}
IIü †
;
II† °
caseJJ 
HttpStatusCodeJJ #
.JJ# $
ServiceUnavailableJJ$ 6
:JJ6 7
throwKK 
newKK %
OdsApiConnectionExceptionKK 7
(KK7 8
HttpStatusCodeKK8 F
.KKF G
ServiceUnavailableKKG Y
,KKY Z
bearerTokenResponseKK[ n
.KKn o
ErrorMessageKKo {
,KK{ |
$strLL m
)LLm n
{LLn o
AllowFeedbackLLp }
=LL~ 
false
LLÄ Ö
,
LLÖ Ü
}
LLá à
;
LLà â
defaultMM 
:MM 
throwNN 
newNN %
OdsApiConnectionExceptionNN 7
(NN7 8
HttpStatusCodeNN8 F
.NNF G
ServiceUnavailableNNG Y
,NNY Z
bearerTokenResponseNN[ n
.NNn o
ErrorMessageNNo {
,NN{ |
$"OO 
$strOO 8
{OO8 9
bearerTokenResponseOO9 L
.OOL M
ErrorMessageOOM Y
}OOY Z
$strOOZ \
{OO\ ]"
additionalErrorMessageOO] s
}OOs t
"OOt u
)OOu v
{OOv w
AllowFeedback	OOx Ö
=
OOÜ á
true
OOà å
,
OOå ç
}
OOé è
;
OOè ê
}PP 
ifRR 
(RR 
bearerTokenResponseRR #
.RR# $
DataRR$ (
.RR( )
ErrorRR) .
!=RR/ 1
nullRR2 6
||RR7 9
bearerTokenResponseRR: M
.RRM N
DataRRN R
.RRR S
	TokenTypeRRS \
!=RR] _
$strRR` h
)RRh i
{SS 
throwTT 
newTT %
OdsApiConnectionExceptionTT 3
(TT3 4
HttpStatusCodeTT4 B
.TTB C
OKTTC E
,TTE F
bearerTokenResponseTTG Z
.TTZ [
ErrorMessageTT[ g
,TTg h
$strUU p
)UUp q
{UUr s
AllowFeedback	UUt Å
=
UUÇ É
false
UUÑ â
,
UUâ ä
}
UUã å
;
UUå ç
}VV 
returnXX 
bearerTokenResponseXX &
.XX& '
DataXX' +
.XX+ ,
AccessTokenXX, 7
;XX7 8
}YY 	
}ZZ 
internal\\ 
class\\ 
BearerTokenResponse\\ &
{]] 
public^^ 
string^^ 
AccessToken^^ !
{^^" #
get^^$ '
;^^' (
set^^) ,
;^^, -
}^^. /
public__ 
string__ 
	ExpiresIn__ 
{__  !
get__" %
;__% &
set__' *
;__* +
}__, -
public`` 
string`` 
	TokenType`` 
{``  !
get``" %
;``% &
set``' *
;``* +
}``, -
publicaa 
stringaa 
Erroraa 
{aa 
getaa !
;aa! "
setaa# &
;aa& '
}aa( )
}bb 
}cc ¶
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\AssessmentVendorAdjustment.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
{ 
public 

	interface '
IAssessmentVendorAdjustment 0
{ 
void 4
(ReadAndCreatePerformanceLevelDescriptors 5
(5 6
)6 7
;7 8
} 
public 

class &
AssessmentVendorAdjustment +
:, -'
IAssessmentVendorAdjustment. I
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public &
AssessmentVendorAdjustment )
() *
ISecurityContext* :
securityContext; J
)J K
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
void 4
(ReadAndCreatePerformanceLevelDescriptors <
(< =
)= >
{ 	
var 
resource 
= 
_securityContext +
.+ ,
ResourceClaims, :
.: ;
FirstOrDefault; I
(I J
xJ K
=>L N
xO P
.P Q
ResourceNameQ ]
==^ `
$stra }
)} ~
;~ 
if 
( 
resource 
== 
null  
)  !
return" (
;( )
var 
claimSet 
= 
_securityContext +
.+ ,
	ClaimSets, 5
.5 6
FirstOrDefault6 D
(D E
xE F
=>G I
xJ K
.K L
ClaimSetNameL X
==Y [
$str\ o
)o p
;p q
if   
(   
claimSet   
==   
null    
)    !
return  " (
;  ( )
var"" 
createAction"" 
="" 
_securityContext"" /
.""/ 0
Actions""0 7
.""7 8
Single""8 >
(""> ?
x""? @
=>""A C
x""D E
.""E F

ActionName""F P
==""Q S
$str""T \
)""\ ]
;""] ^
var## 

readAction## 
=## 
_securityContext## -
.##- .
Actions##. 5
.##5 6
Single##6 <
(##< =
x##= >
=>##? A
x##B C
.##C D

ActionName##D N
==##O Q
$str##R X
)##X Y
;##Y Z
_securityContext%% 
.%% "
ClaimSetResourceClaims%% 3
.%%3 4
AddRange%%4 <
(%%< =
new%%= @
[%%@ A
]%%A B
{&& 
new'' !
ClaimSetResourceClaim'' )
{''* +
Action''+ 1
=''2 3
createAction''4 @
,''@ A
ClaimSet''B J
=''K L
claimSet''M U
,''U V
ResourceClaim''W d
=''e f
resource''g o
}''o p
,''p q
new(( !
ClaimSetResourceClaim(( )
{((* +
Action((+ 1
=((2 3

readAction((4 >
,((> ?
ClaimSet((@ H
=((I J
claimSet((K S
,((S T
ResourceClaim((U b
=((c d
resource((e m
}((m n
})) 
))) 
;)) 
_securityContext++ 
.++ 
SaveChanges++ (
(++( )
)++) *
;++* +
},, 	
}-- 
}.. ≥
[C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\Action.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 
Action 
: 
Enumeration $
<$ %
Action% +
,+ ,
string- 3
>3 4
{		 
public

 
static

 
readonly

 
Action

 %
Create

& ,
=

- .
new

/ 2
Action

3 9
(

9 :
$str

: B
,

B C
$str

D L
)

L M
;

M N
public 
static 
readonly 
Action %
Read& *
=+ ,
new- 0
Action1 7
(7 8
$str8 >
,> ?
$str@ F
)F G
;G H
public 
static 
readonly 
Action %
Update& ,
=- .
new/ 2
Action3 9
(9 :
$str: B
,B C
$strD L
)L M
;M N
public 
static 
readonly 
Action %
Delete& ,
=- .
new/ 2
Action3 9
(9 :
$str: B
,B C
$strD L
)L M
;M N
private 
Action 
( 
string 
value #
,# $
string% +
displayName, 7
)7 8
:9 :
base; ?
(? @
value@ E
,E F
displayNameG R
)R S
{T U
}V W
} 
} ’
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\AddClaimSetCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 
AddClaimSetCommand #
{		 
private

 
readonly

 ,
 IOdsSecurityModelVersionResolver

 9
	_resolver

: C
;

C D
private 
readonly (
AddClaimSetCommandV53Service 5
_v53Service6 A
;A B
private 
readonly '
AddClaimSetCommandV6Service 4

_v6Service5 ?
;? @
public 
AddClaimSetCommand !
(! ",
 IOdsSecurityModelVersionResolver" B
resolverC K
,K L(
AddClaimSetCommandV53Service (

v53Service) 3
,3 4'
AddClaimSetCommandV6Service '
	v6Service( 1
)1 2
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
int 
Execute 
( 
IAddClaimSetModel ,
claimSet- 5
)5 6
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
return 
_v53Service "
." #
Execute# *
(* +
claimSet+ 3
)3 4
;4 5
else 
if 
( 
securityModel "
==# %-
!EdFiOdsSecurityModelCompatibility& G
.G H
SixH K
)K L
return 

_v6Service !
.! "
Execute" )
() *
claimSet* 2
)2 3
;3 4
else 
throw 
new 6
*EdFiOdsSecurityModelCompatibilityException D
(D E
securityModelE R
)R S
;S T
}   	
}!! 
public## 

	interface## 
IAddClaimSetModel## &
{$$ 
string%% 
ClaimSetName%% 
{%% 
get%% !
;%%! "
}%%# $
}&& 
}'' Î
qC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\AddClaimSetCommandV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class (
AddClaimSetCommandV53Service -
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public (
AddClaimSetCommandV53Service +
(+ ,
ISecurityContext, <
context= D
)D E
{ 	
_context 
= 
context 
; 
} 	
public 
int 
Execute 
( 
IAddClaimSetModel ,
claimSet- 5
)5 6
{ 	
var 
newClaimSet 
= 
new !
ClaimSetEntity" 0
{ 
ClaimSetName 
= 
claimSet '
.' (
ClaimSetName( 4
,4 5
Application 
= 
_context &
.& '
Applications' 3
.3 4
Single4 :
(: ;
); <
} 
; 
_context 
. 
	ClaimSets 
. 
Add "
(" #
newClaimSet# .
). /
;/ 0
_context 
. 
SaveChanges  
(  !
)! "
;" #
return   
newClaimSet   
.   

ClaimSetId   )
;  ) *
}!! 	
}"" 
}## 
pC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\AddClaimSetCommandV6Service.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ClaimSetEditor		' 5
{

 
public 

class '
AddClaimSetCommandV6Service ,
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public '
AddClaimSetCommandV6Service *
(* +
ISecurityContext+ ;
context< C
)C D
{ 	
_context 
= 
context 
; 
} 	
public 
int 
Execute 
( 
IAddClaimSetModel ,
claimSet- 5
)5 6
{ 	
var 
newClaimSet 
= 
new !
Security" *
.* +

DataAccess+ 5
.5 6
Models6 <
.< =
ClaimSet= E
{ 
ClaimSetName 
= 
claimSet '
.' (
ClaimSetName( 4
,4 5
Application 
= 
_context &
.& '
Applications' 3
.3 4
Single4 :
(: ;
); <
,< =
IsEdfiPreset 
= 
false $
,$ %!
ForApplicationUseOnly %
=& '
false( -
} 
; 
_context 
. 
	ClaimSets 
. 
Add "
(" #
newClaimSet# .
). /
;/ 0
_context 
. 
SaveChanges  
(  !
)! "
;" #
return   
newClaimSet   
.   

ClaimSetId   )
;  ) *
}!! 	
}"" 
}## åV
xC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\AddOrEditResourcesOnClaimSetCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class /
#AddOrEditResourcesOnClaimSetCommand 4
{ 
private 
readonly )
EditResourceOnClaimSetCommand 6*
_editResourceOnClaimSetCommand7 U
;U V
private 
readonly #
IGetResourceClaimsQuery 0#
_getResourceClaimsQuery1 H
;H I
private 
readonly 7
+OverrideDefaultAuthorizationStrategyCommand D8
,_overrideDefaultAuthorizationStrategyCommandE q
;q r
public /
#AddOrEditResourcesOnClaimSetCommand 2
(2 3)
EditResourceOnClaimSetCommand3 P)
editResourceOnClaimSetCommandQ n
,n o#
IGetResourceClaimsQuery #"
getResourceClaimsQuery$ :
,: ;7
+OverrideDefaultAuthorizationStrategyCommand 77
+overrideDefaultAuthorizationStrategyCommand8 c
)c d
{ 	*
_editResourceOnClaimSetCommand *
=+ ,)
editResourceOnClaimSetCommand- J
;J K#
_getResourceClaimsQuery #
=$ %"
getResourceClaimsQuery& <
;< =8
,_overrideDefaultAuthorizationStrategyCommand 8
=9 :7
+overrideDefaultAuthorizationStrategyCommand; f
;f g
} 	
public 
void 
Execute 
( 
int 

claimSetId  *
,* +
List, 0
<0 1
ResourceClaim1 >
>> ?
	resources@ I
)I J
{ 	
var 
allResources 
= 
GetDbResources -
(- .
). /
;/ 0
var!! 
childResources!! 
=!!  
new!!! $
List!!% )
<!!) *
ResourceClaim!!* 7
>!!7 8
(!!8 9
)!!9 :
;!!: ;
foreach"" 
("" 
var"" 
resourceClaims"" '
in""( *
	resources""+ 4
.""4 5
Select""5 ;
(""; <
x""< =
=>""> @
x""A B
.""B C
Children""C K
)""K L
)""L M
childResources## 
.## 
AddRange## '
(##' (
resourceClaims##( 6
)##6 7
;##7 8
	resources$$ 
.$$ 
AddRange$$ 
($$ 
childResources$$ -
)$$- .
;$$. /
var%% 
currentResources%%  
=%%! "
	resources%%# ,
.%%, -
Select%%- 3
(%%3 4
r%%4 5
=>%%6 8
{&& 
var'' 
resource''  
=''! "
allResources''# /
.''/ 0
FirstOrDefault''0 >
(''> ?
dr''? A
=>''B D
dr''E G
.''G H
Name''H L
.''L M
Equals''M S
(''S T
r''T U
.''U V
Name''V Z
)''Z [
)''[ \
;''\ ]
if(( 
((( 
resource((  
!=((! #
null(($ (
)((( )
{)) 
resource**  
.**  !
Create**! '
=**( )
r*** +
.**+ ,
Create**, 2
;**2 3
resource++  
.++  !
Read++! %
=++& '
r++( )
.++) *
Read++* .
;++. /
resource,,  
.,,  !
Update,,! '
=,,( )
r,,* +
.,,+ ,
Update,,, 2
;,,2 3
resource--  
.--  !
Delete--! '
=--( )
r--* +
.--+ ,
Delete--, 2
;--2 3
resource..  
...  !(
AuthStrategyOverridesForCRUD..! =
=..> ?
r..@ A
...A B(
AuthStrategyOverridesForCRUD..B ^
;..^ _
}// 
return00 
resource00 #
;00# $
}11 
)11 
.11 
ToList11 
(11 
)11 
;11 
currentResources22 
.22 
	RemoveAll22 &
(22& '
x22' (
=>22) +
x22, -
==22. 0
null221 5
)225 6
;226 7
foreach33 
(33 
var33 
resource33 !
in33" $
currentResources33% 5
)335 6
{44 
var55 
editResourceModel55 %
=55& '
new55( +'
EditResourceOnClaimSetModel55, G
{66 

ClaimSetId77 
=77  

claimSetId77! +
,77+ ,
ResourceClaim88 !
=88" #
resource88$ ,
}99 
;99 *
_editResourceOnClaimSetCommand;; .
.;;. /
Execute;;/ 6
(;;6 7
editResourceModel;;7 H
);;H I
;;;I J
if== 
(== 
resource== 
.== (
AuthStrategyOverridesForCRUD== 9
!===: <
null=== A
&&==B D
resource==E M
.==M N(
AuthStrategyOverridesForCRUD==N j
.==j k
Any==k n
(==n o
)==o p
)==p q
{>> 
var?? %
overrideAuthStrategyModel?? 1
=??2 3
new??4 7.
"OverrideAuthorizationStrategyModel??8 Z
{@@ 

ClaimSetIdAA "
=AA# $

claimSetIdAA% /
,AA/ 0
ResourceClaimIdBB '
=BB( )
resourceBB* 2
.BB2 3
IdBB3 5
,BB5 6*
AuthorizationStrategyForCreateCC 6
=CC7 8)
AuthStrategyOverrideForActionCC9 V
(CCV W
resourceCCW _
.CC_ `(
AuthStrategyOverridesForCRUDCC` |
.CC| }
Create	CC} É
(
CCÉ Ñ
)
CCÑ Ö
)
CCÖ Ü
,
CCÜ á(
AuthorizationStrategyForReadDD 4
=DD5 6)
AuthStrategyOverrideForActionDD7 T
(DDT U
resourceDDU ]
.DD] ^(
AuthStrategyOverridesForCRUDDD^ z
.DDz {
ReadDD{ 
(	DD Ä
)
DDÄ Å
)
DDÅ Ç
,
DDÇ É*
AuthorizationStrategyForUpdateEE 6
=EE7 8)
AuthStrategyOverrideForActionEE9 V
(EEV W
resourceEEW _
.EE_ `(
AuthStrategyOverridesForCRUDEE` |
.EE| }
Update	EE} É
(
EEÉ Ñ
)
EEÑ Ö
)
EEÖ Ü
,
EEÜ á*
AuthorizationStrategyForDeleteFF 6
=FF7 8)
AuthStrategyOverrideForActionFF9 V
(FFV W
resourceFFW _
.FF_ `(
AuthStrategyOverridesForCRUDFF` |
.FF| }
Delete	FF} É
(
FFÉ Ñ
)
FFÑ Ö
)
FFÖ Ü
}GG 
;GG 8
,_overrideDefaultAuthorizationStrategyCommandHH @
.HH@ A
ExecuteHHA H
(HHH I%
overrideAuthStrategyModelHHI b
)HHb c
;HHc d
}II 
}JJ 
staticLL 
intLL )
AuthStrategyOverrideForActionLL 4
(LL4 5!
AuthorizationStrategyLL5 J!
authorizationStrategyLLK `
)LL` a
{MM 
returnNN !
authorizationStrategyNN ,
!=NN- /
nullNN0 4
?NN5 6!
authorizationStrategyNN7 L
.NNL M
AuthStrategyIdNNM [
:NN\ ]
$numNN^ _
;NN_ `
}OO 
}PP 	
privateRR 
ListRR 
<RR 
ResourceClaimRR "
>RR" #
GetDbResourcesRR$ 2
(RR2 3
)RR3 4
{SS 	
varTT 
allResourcesTT 
=TT 
newTT "
ListTT# '
<TT' (
ResourceClaimTT( 5
>TT5 6
(TT6 7
)TT7 8
;TT8 9
varUU 
parentResourcesUU 
=UU  !#
_getResourceClaimsQueryUU" 9
.UU9 :
ExecuteUU: A
(UUA B
)UUB C
.UUC D
ToListUUD J
(UUJ K
)UUK L
;UUL M
allResourcesVV 
.VV 
AddRangeVV !
(VV! "
parentResourcesVV" 1
)VV1 2
;VV2 3
foreachWW 
(WW 
varWW 
childrenWW !
inWW" $
parentResourcesWW% 4
.WW4 5
SelectWW5 ;
(WW; <
xWW< =
=>WW> @
xWWA B
.WWB C
ChildrenWWC K
)WWK L
)WWL M
{XX 
allResourcesYY 
.YY 
AddRangeYY %
(YY% &
childrenYY& .
)YY. /
;YY/ 0
}ZZ 
return\\ 
allResources\\ 
;\\  
}]] 	
}^^ 
public`` 

class`` 
AddClaimSetModel`` !
:``" #
IAddClaimSetModel``$ 5
{aa 
publicbb 
stringbb 
ClaimSetNamebb "
{bb# $
getbb% (
;bb( )
setbb* -
;bb- .
}bb/ 0
}cc 
publicee 

classee '
EditResourceOnClaimSetModelee ,
:ee- .(
IEditResourceOnClaimSetModelee/ K
{ff 
publicgg 
intgg 

ClaimSetIdgg 
{gg 
getgg  #
;gg# $
setgg% (
;gg( )
}gg* +
publichh 
ResourceClaimhh 
ResourceClaimhh *
{hh+ ,
gethh- 0
;hh0 1
sethh2 5
;hh5 6
}hh7 8
}ii 
publickk 

classkk .
"OverrideAuthorizationStrategyModelkk 3
:kk4 56
*IOverrideDefaultAuthorizationStrategyModelkk6 `
{ll 
publicmm 
intmm 

ClaimSetIdmm 
{mm 
getmm  #
;mm# $
setmm% (
;mm( )
}mm* +
publicnn 
intnn 
ResourceClaimIdnn "
{nn# $
getnn% (
;nn( )
setnn* -
;nn- .
}nn/ 0
publicoo 
intoo *
AuthorizationStrategyForCreateoo 1
{oo2 3
getoo4 7
;oo7 8
setoo9 <
;oo< =
}oo> ?
publicpp 
intpp (
AuthorizationStrategyForReadpp /
{pp0 1
getpp2 5
;pp5 6
setpp7 :
;pp: ;
}pp< =
publicqq 
intqq *
AuthorizationStrategyForUpdateqq 1
{qq2 3
getqq4 7
;qq7 8
setqq9 <
;qq< =
}qq> ?
publicrr 
intrr *
AuthorizationStrategyForDeleterr 1
{rr2 3
getrr4 7
;rr7 8
setrr9 <
;rr< =
}rr> ?
}ss 
}tt Œ
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\Application.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 
Application 
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 

VendorName  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} µ
jC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\AuthorizationStrategy.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class !
AuthorizationStrategy &
{		 
public

 
int

 
AuthStrategyId

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
AuthStrategyName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool !
IsInheritedFromParent )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} Ÿ-
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\AuthStrategyResolver.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
;5 6
public 
	interface !
IAuthStrategyResolver &
{ 
IEnumerable 
< 
ResourceClaim 
> !
ResolveAuthStrategies 4
(4 5
IEnumerable5 @
<@ A
ResourceClaimA N
>N O
resourceClaimsP ^
)^ _
;_ `
} 
public 
class  
AuthStrategyResolver !
:" #!
IAuthStrategyResolver$ 9
{ 
private 
readonly 
ISecurityContext %
_securityContext& 6
;6 7
public 
 
AuthStrategyResolver 
(  
ISecurityContext  0
securityContext1 @
)@ A
{ 
_securityContext 
= 
securityContext *
;* +
} 
public 

IEnumerable 
< 
ResourceClaim $
>$ %!
ResolveAuthStrategies& ;
(; <
IEnumerable< G
<G H
ResourceClaimH U
>U V
resourceClaimsW e
)e f
{ 
var 
dbAuthStrategies 
= 
_securityContext /
./ 0#
AuthorizationStrategies0 G
;G H
foreach 
( 
var 
claim 
in 
resourceClaims ,
), -
{   	
if!! 
(!! 
claim!! 
.!! (
DefaultAuthStrategiesForCRUD!! 2
!=!!3 5
null!!6 :
&&!!; =
claim!!> C
.!!C D(
DefaultAuthStrategiesForCRUD!!D `
.!!` a
Any!!a d
(!!d e
)!!e f
)!!f g
{"" 
foreach## 
(## 
var## 
defaultStrategy## ,
in##- /
claim##0 5
.##5 6(
DefaultAuthStrategiesForCRUD##6 R
.##R S
Where##S X
(##X Y
x##Y Z
=>##[ ]
x##^ _
!=##` b
null##c g
)##g h
)##h i
{$$ 
var%% 
authStrategy%% $
=%%% &
dbAuthStrategies%%' 7
.%%7 8
SingleOrDefault%%8 G
(%%G H
x&& 
=>&& 
x&& 
.&& %
AuthorizationStrategyName&& 8
.&&8 9
Equals&&9 ?
(&&? @
defaultStrategy'' +
.''+ ,
AuthStrategyName'', <
,''< =
StringComparison''> N
.''N O&
InvariantCultureIgnoreCase''O i
)''i j
)''j k
;''k l
if)) 
()) 
authStrategy)) $
!=))% '
null))( ,
))), -
{** 
defaultStrategy++ '
.++' (
AuthStrategyId++( 6
=++7 8
authStrategy++9 E
.++E F#
AuthorizationStrategyId++F ]
;++] ^
defaultStrategy,, '
.,,' (
DisplayName,,( 3
=,,4 5
authStrategy,,6 B
.,,B C
DisplayName,,C N
;,,N O
}-- 
}.. 
}// 
if11 
(11 
claim11 
.11 (
AuthStrategyOverridesForCRUD11 2
!=113 5
null116 :
&&11; =
claim11> C
.11C D(
AuthStrategyOverridesForCRUD11D `
.11` a
Any11a d
(11d e
)11e f
)11f g
{22 
foreach33 
(33 
var33  
authStrategyOverride33 1
in332 4
claim335 :
.33: ;(
AuthStrategyOverridesForCRUD33; W
.33W X
Where33X ]
(33] ^
x33^ _
=>33` b
x33c d
!=33e g
null33h l
)33l m
)33m n
{44 
var55 
authStrategy55 $
=55% &
dbAuthStrategies55' 7
.557 8
SingleOrDefault558 G
(55G H
x66 
=>66 
x66 
.66 %
AuthorizationStrategyName66 8
.668 9
Equals669 ?
(66? @ 
authStrategyOverride77 0
.770 1
AuthStrategyName771 A
,77A B
StringComparison88 ,
.88, -&
InvariantCultureIgnoreCase88- G
)88G H
)88H I
;88I J
if:: 
(:: 
authStrategy:: $
!=::% '
null::( ,
)::, -
{;;  
authStrategyOverride<< ,
.<<, -
AuthStrategyId<<- ;
=<<< =
authStrategy<<> J
.<<J K#
AuthorizationStrategyId<<K b
;<<b c 
authStrategyOverride== ,
.==, -
DisplayName==- 8
===9 :
authStrategy==; G
.==G H
DisplayName==H S
;==S T
}>> 
}?? 
}@@ 
ifBB 
(BB 
claimBB 
.BB 
ChildrenBB 
?BB 
.BB  
AnyBB  #
(BB# $
)BB$ %
??BB& (
falseBB) .
)BB. /
{CC 
claimDD 
.DD 
ChildrenDD 
=DD  !
ResolveAuthStrategiesDD! 6
(DD6 7
claimDD7 <
.DD< =
ChildrenDD= E
)DDE F
.DDF G
ToListDDG M
(DDM N
)DDN O
;DDO P
}EE 
yieldGG 
returnGG 
claimGG 
;GG 
}HH 	
}II 
}JJ ˚
]C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\ClaimSet.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 
ClaimSet 
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 

IsEditable 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
ApplicationsCount $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} õ
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\ClaimSetCheckService.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ClaimSetEditor		' 5
{

 
public 

	interface !
IClaimSetCheckService *
{ 
bool "
RequiredClaimSetsExist #
(# $
)$ %
;% &
} 
public 

class  
ClaimSetCheckService %
:& '!
IClaimSetCheckService( =
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public  
ClaimSetCheckService #
(# $
ISecurityContext$ 4
securityContext5 D
)D E
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
bool "
RequiredClaimSetsExist *
(* +
)+ ,
{ 	
return 
ClaimSetExists "
(" #
CloudOdsAdminApp# 3
.3 4$
InternalAdminAppClaimSet4 L
)L M
;M N
bool 
ClaimSetExists 
(  
string  &
claimSetName' 3
)3 4
{ 
return 
_securityContext '
.' (
	ClaimSets( 1
.1 2
Any2 5
(5 6
x6 7
=>8 :
x; <
.< =
ClaimSetName= I
==J L
claimSetNameM Y
)Y Z
;Z [
} 
}   	
}!! 
}"" ä*
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\ClaimSetFileExportCommand.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
ClaimSetEditor

' 5
{ 
public 

class %
ClaimSetFileExportCommand *
{ 
private 
readonly !
IGetClaimSetByIdQuery .!
_getClaimSetByIdQuery/ D
;D E
private 
readonly *
IGetResourcesByClaimSetIdQuery 7*
_getResourcesByClaimSetIdQuery8 V
;V W
public %
ClaimSetFileExportCommand (
(( )!
IGetClaimSetByIdQuery) > 
getClaimSetByIdQuery? S
,S T*
IGetResourcesByClaimSetIdQuery *)
getResourcesByClaimSetIdQuery+ H
)H I
{ 	!
_getClaimSetByIdQuery !
=" # 
getClaimSetByIdQuery$ 8
;8 9*
_getResourcesByClaimSetIdQuery *
=+ ,)
getResourcesByClaimSetIdQuery- J
;J K
} 	
public 
SharingModel 
Execute #
(# $$
IClaimSetFileExportModel$ <
model= B
)B C
{ 	
var 
sharingClaimSets  
=! "
ClaimSetExports# 2
(2 3
model3 8
.8 9
SelectedForExport9 J
.J K
ToArrayK R
(R S
)S T
)T U
;U V
var 
sharingTemplate 
=  !
new" %
SharingTemplate& 5
{ 
	ClaimSets 
= 
sharingClaimSets ,
., -
ToArray- 4
(4 5
)5 6
} 
; 
return   
new   
SharingModel   #
{!! 
Title"" 
="" 
model"" 
."" 
Title"" #
,""# $
Template## 
=## 
sharingTemplate## *
}$$ 
;$$ 
}%% 	
private'' 
List'' 
<'' 
SharingClaimSet'' $
>''$ %
ClaimSetExports''& 5
(''5 6
int''6 9
[''9 :
]'': ;
selectedIds''< G
)''G H
{(( 	
if)) 
()) 
!)) 
selectedIds)) 
.)) 
Any))  
())  !
)))! "
)))" #
return** 
new** 
List** 
<**  
SharingClaimSet**  /
>**/ 0
(**0 1
)**1 2
;**2 3
var++ 
sharingClaimSets++  
=++! "
new++# &
List++' +
<+++ ,
SharingClaimSet++, ;
>++; <
(++< =
)++= >
;++> ?
foreach,, 
(,, 
var,, 

claimSetId,, #
in,,$ &
selectedIds,,' 2
),,2 3
{-- 
var.. 
sharingClaimSet.. #
=..$ %
new..& )
SharingClaimSet..* 9
(..9 :
)..: ;
;..; <
var// 
claimSet// 
=// !
_getClaimSetByIdQuery// 4
.//4 5
Execute//5 <
(//< =

claimSetId//= G
)//G H
;//H I
sharingClaimSet00 
.00  
Name00  $
=00% &
claimSet00' /
.00/ 0
Name000 4
;004 5
var22 
	resources22 
=22 *
_getResourcesByClaimSetIdQuery22  >
.22> ?
AllResources22? K
(22K L

claimSetId22L V
)22V W
;22W X
sharingClaimSet33 
.33  
ResourceClaims33  .
=33/ 0
	resources44 
.44 
Select44 $
(44$ %
x44% &
=>44' )
{55 
var66 

jsonObject66 &
=66' (
JObject66) 0
.660 1

FromObject661 ;
(66; <
x66< =
)66= >
;66> ?

jsonObject77 "
=77# $"
JsonObjectManipulation77% ;
.77; <
RemoveProperties77< L
(77L M

jsonObject77M W
,77W X
new77Y \
List77] a
<77a b
string77b h
>77h i
{88 
$str99 &
,99& '
$str::  
};; 
);; 
;;; 
return<< 

jsonObject<< )
;<<) *
}== 
)== 
.== 
ToList== 
(== 
)== 
;==  
sharingClaimSets>>  
.>>  !
Add>>! $
(>>$ %
sharingClaimSet>>% 4
)>>4 5
;>>5 6
}?? 
returnAA 
sharingClaimSetsAA #
;AA# $
}BB 	
}CC 
publicEE 

	interfaceEE $
IClaimSetFileExportModelEE -
{FF 
stringGG 
TitleGG 
{GG 
getGG 
;GG 
setGG 
;GG  
}GG! "
IListHH 
<HH 
intHH 
>HH 
SelectedForExportHH $
{HH% &
getHH' *
;HH* +
}HH, -
}II 
}JJ û
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\ClaimSetFileImportCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{		 
public

 

class

 %
ClaimSetFileImportCommand

 *
{ 
private 
readonly 
AddClaimSetCommand +
_addClaimSetCommand, ?
;? @
private 
readonly /
#AddOrEditResourcesOnClaimSetCommand <2
&_addOrUpdateResourcesOnClaimSetCommand= c
;c d
public %
ClaimSetFileImportCommand (
(( )
AddClaimSetCommand) ;
addClaimSetCommand< N
,N O/
#AddOrEditResourcesOnClaimSetCommand /1
%addOrUpdateResourcesOnClaimSetCommand0 U
)U V
{ 	
_addClaimSetCommand 
=  !
addClaimSetCommand" 4
;4 52
&_addOrUpdateResourcesOnClaimSetCommand 2
=3 41
%addOrUpdateResourcesOnClaimSetCommand5 Z
;Z [
} 	
public 
void 
Execute 
( 
SharingModel (
model) .
). /
{ 	
var 
sharingClaimSets  
=! "
model# (
.( )
Template) 1
.1 2
	ClaimSets2 ;
;; <
foreach 
( 
var 
claimSet !
in" $
sharingClaimSets% 5
)5 6
{ 
var 

claimSetId 
=  
_addClaimSetCommand! 4
.4 5
Execute5 <
(< =
new= @
AddClaimSetModelA Q
{ 
ClaimSetName  
=! "
claimSet# +
.+ ,
Name, 0
} 
) 
; 
var   
	resources   
=   
claimSet    (
.  ( )
ResourceClaims  ) 7
.  7 8
Select  8 >
(  > ?
x  ? @
=>  A C
x  D E
.  E F
ToObject  F N
<  N O
ResourceClaim  O \
>  \ ]
(  ] ^
)  ^ _
)  _ `
.  ` a
ToList  a g
(  g h
)  h i
;  i j2
&_addOrUpdateResourcesOnClaimSetCommand!! 6
.!!6 7
Execute!!7 >
(!!> ?

claimSetId!!? I
,!!I J
	resources!!K T
)!!T U
;!!U V
}"" 
}## 	
}$$ 
}%% ‚
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\CopyClaimSetCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

	interface  
ICopyClaimSetCommand )
{		 
int

 
Execute

 
(

 
ICopyClaimSetModel

 &
claimSet

' /
)

/ 0
;

0 1
} 
public 

class 
CopyClaimSetCommand $
:% & 
ICopyClaimSetCommand' ;
{ 
private 
readonly ,
 IOdsSecurityModelVersionResolver 9
	_resolver: C
;C D
private 
readonly )
CopyClaimSetCommandV53Service 6
_v53Service7 B
;B C
private 
readonly (
CopyClaimSetCommandV6Service 5

_v6Service6 @
;@ A
public 
CopyClaimSetCommand "
(" #,
 IOdsSecurityModelVersionResolver# C
resolverD L
,L M)
CopyClaimSetCommandV53Service )

v53Service* 4
,4 5(
CopyClaimSetCommandV6Service (
	v6Service) 2
)2 3
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
int 
Execute 
( 
ICopyClaimSetModel -
claimSet. 6
)6 7
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
return   
_v53Service   "
.  " #
Execute  # *
(  * +
claimSet  + 3
)  3 4
;  4 5
else!! 
if!! 
(!! 
securityModel!! "
==!!# %-
!EdFiOdsSecurityModelCompatibility!!& G
.!!G H
Six!!H K
)!!K L
return"" 

_v6Service"" !
.""! "
Execute""" )
("") *
claimSet""* 2
)""2 3
;""3 4
else## 
throw$$ 
new$$ 6
*EdFiOdsSecurityModelCompatibilityException$$ D
($$D E
securityModel$$E R
)$$R S
;$$S T
}%% 	
}&& 
public(( 

	interface(( 
ICopyClaimSetModel(( '
{)) 
string** 
Name** 
{** 
get** 
;** 
}** 
int++ 

OriginalId++ 
{++ 
get++ 
;++ 
}++ 
},, 
}-- Ù
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\CopyClaimSetCommandV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class )
CopyClaimSetCommandV53Service .
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public )
CopyClaimSetCommandV53Service ,
(, -
ISecurityContext- =
context> E
)E F
{ 	
_context 
= 
context 
; 
} 	
public 
int 
Execute 
( 
ICopyClaimSetModel -
claimSet. 6
)6 7
{ 	
var 
newClaimSet 
= 
new !
SecurityClaimSet" 2
{ 
ClaimSetName 
= 
claimSet '
.' (
Name( ,
,, -
Application 
= 
_context &
.& '
Applications' 3
.3 4
Single4 :
(: ;
); <
} 
; 
var   "
originalResourceClaims   &
=  ' (
_context!! 
.!! "
ClaimSetResourceClaims!! /
."" 
Where"" 
("" 
x"" 
=>"" 
x""  !
.""! "
ClaimSet""" *
.""* +

ClaimSetId""+ 5
==""6 8
claimSet""9 A
.""A B

OriginalId""B L
)""L M
.## 
Include## 
(## 
x## 
=>## !
x##" #
.### $
ResourceClaim##$ 1
)##1 2
.$$ 
Include$$ 
($$ 
x$$ 
=>$$ !
x$$" #
.$$# $
Action$$$ *
)$$* +
.%% 
Include%% 
(%% 
x%% 
=>%% !
x%%" #
.%%# $)
AuthorizationStrategyOverride%%$ A
)%%A B
.&& 
ToList&& 
(&& 
)&& 
;&& 
_context'' 
.'' 
	ClaimSets'' 
.'' 
Add'' "
(''" #
newClaimSet''# .
)''. /
;''/ 0
foreach)) 
()) 
var)) 
resourceClaim)) &
in))' )"
originalResourceClaims))* @
)))@ A
{** 
var++ 
copyResourceClaim++ %
=++& '
new++( +!
ClaimSetResourceClaim++, A
{,, 
ClaimSet-- 
=-- 
newClaimSet-- *
,--* +
Action.. 
=.. 
resourceClaim.. *
...* +
Action..+ 1
,..1 2)
AuthorizationStrategyOverride// 1
=//2 3
resourceClaim//4 A
.//A B)
AuthorizationStrategyOverride//B _
,//_ `
ResourceClaim00 !
=00" #
resourceClaim00$ 1
.001 2
ResourceClaim002 ?
}11 
;11 
_context22 
.22 "
ClaimSetResourceClaims22 /
.22/ 0
Add220 3
(223 4
copyResourceClaim224 E
)22E F
;22F G
}33 
_context44 
.44 
SaveChanges44  
(44  !
)44! "
;44" #
return66 
newClaimSet66 
.66 

ClaimSetId66 )
;66) *
}77 	
}88 
}99 ™+
qC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\CopyClaimSetCommandV6Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class (
CopyClaimSetCommandV6Service -
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public (
CopyClaimSetCommandV6Service +
(+ ,
ISecurityContext, <
context= D
)D E
{ 	
_context 
= 
context 
; 
} 	
public 
int 
Execute 
( 
ICopyClaimSetModel -
claimSet. 6
)6 7
{ 	
var 
newClaimSet 
= 
new !
Security" *
.* +

DataAccess+ 5
.5 6
Models6 <
.< =
ClaimSet= E
{ 
ClaimSetName 
= 
claimSet '
.' (
Name( ,
,, -
Application 
= 
_context &
.& '
Applications' 3
.3 4
Single4 :
(: ;
); <
,< =
IsEdfiPreset 
= 
false $
,$ %!
ForApplicationUseOnly %
=& '
false( -
} 
; 
var!! "
originalResourceClaims!! &
=!!' (
_context"" 
."" (
ClaimSetResourceClaimActions"" 5
.## 
Where## 
(## 
x## 
=>## 
x##  !
.##! "
ClaimSet##" *
.##* +

ClaimSetId##+ 5
==##6 8
claimSet##9 A
.##A B

OriginalId##B L
)##L M
.$$ 
Include$$ 
($$ 
x$$ 
=>$$ !
x$$" #
.$$# $
ResourceClaim$$$ 1
)$$1 2
.%% 
Include%% 
(%% 
x%% 
=>%% !
x%%" #
.%%# $
Action%%$ *
)%%* +
.&& 
Include&& 
(&& 
x&& 
=>&& !
x&&" #
.&&# $*
AuthorizationStrategyOverrides&&$ B
.&&B C
Select&&C I
(&&I J
x&&J K
=>&&L N
x&&O P
.&&P Q!
AuthorizationStrategy&&Q f
)&&f g
)&&g h
.'' 
ToList'' 
('' 
)'' 
;'' 
_context(( 
.(( 
	ClaimSets(( 
.(( 
Add(( "
(((" #
newClaimSet((# .
)((. /
;((/ 0
foreach** 
(** 
var** 
resourceClaim** &
in**' )"
originalResourceClaims*** @
.**@ A
ToList**A G
(**G H
)**H I
)**I J
{++ 
List,, 
<,, E
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides,, N
>,,N O!
authStrategyOverrides,,P e
=,,f g
null,,h l
;,,l m
if-- 
(-- 
resourceClaim-- !
.--! "*
AuthorizationStrategyOverrides--" @
!=--A C
null--D H
&&--I K
resourceClaim--L Y
.--Y Z*
AuthorizationStrategyOverrides--Z x
.--x y
Any--y |
(--| }
)--} ~
)--~ 
{.. !
authStrategyOverrides// )
=//* +
new//, /
List//0 4
<//4 5E
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides//5 n
>//n o
(//o p
)//p q
;//q r
foreach00 
(00 
var00   
authStrategyOverride00! 5
in006 8
resourceClaim009 F
.00F G*
AuthorizationStrategyOverrides00G e
)00e f
{11 !
authStrategyOverrides22 -
.22- .
Add22. 1
(221 2
new222 5E
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides226 o
{33 !
AuthorizationStrategy33 /
=330 1 
authStrategyOverride332 F
.33F G!
AuthorizationStrategy33G \
}33] ^
)33^ _
;33_ `
}44 
}55 
var66 
copyResourceClaim66 %
=66& '
new66( +'
ClaimSetResourceClaimAction66, G
{77 
ClaimSet88 
=88 
newClaimSet88 *
,88* +
Action99 
=99 
resourceClaim99 *
.99* +
Action99+ 1
,991 2*
AuthorizationStrategyOverrides:: 2
=::3 4!
authStrategyOverrides::5 J
,::J K
ResourceClaim;; !
=;;" #
resourceClaim;;$ 1
.;;1 2
ResourceClaim;;2 ?
}<< 
;<< 
_context== 
.== (
ClaimSetResourceClaimActions== 5
.==5 6
Add==6 9
(==9 :
copyResourceClaim==: K
)==K L
;==L M
}>> 
_context?? 
.?? 
SaveChanges??  
(??  !
)??! "
;??" #
returnAA 
newClaimSetAA 
.AA 

ClaimSetIdAA )
;AA) *
}BB 	
}CC 
}DD Ã
jC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\DeleteClaimSetCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

	interface "
IDeleteClaimSetCommand +
{		 
void

 
Execute

 
(

  
IDeleteClaimSetModel

 )
claimSet

* 2
)

2 3
;

3 4
} 
public 

class !
DeleteClaimSetCommand &
:' ("
IDeleteClaimSetCommand) ?
{ 
private 
readonly ,
 IOdsSecurityModelVersionResolver 9
	_resolver: C
;C D
private 
readonly +
DeleteClaimSetCommandV53Service 8
_v53Service9 D
;D E
private 
readonly *
DeleteClaimSetCommandV6Service 7

_v6Service8 B
;B C
public !
DeleteClaimSetCommand $
($ %,
 IOdsSecurityModelVersionResolver% E
resolverF N
,N O+
DeleteClaimSetCommandV53Service +

v53Service, 6
,6 7*
DeleteClaimSetCommandV6Service *
	v6Service+ 4
)4 5
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
void 
Execute 
(  
IDeleteClaimSetModel 0
claimSet1 9
)9 :
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
_v53Service   
.   
Execute   #
(  # $
claimSet  $ ,
)  , -
;  - .
else!! 
if!! 
(!! 
securityModel!! "
==!!# %-
!EdFiOdsSecurityModelCompatibility!!& G
.!!G H
Six!!H K
)!!K L

_v6Service"" 
."" 
Execute"" "
(""" #
claimSet""# +
)""+ ,
;"", -
else## 
throw$$ 
new$$ 6
*EdFiOdsSecurityModelCompatibilityException$$ D
($$D E
securityModel$$E R
)$$R S
;$$S T
}%% 	
}&& 
public(( 

	interface((  
IDeleteClaimSetModel(( )
{)) 
string** 
Name** 
{** 
get** 
;** 
}** 
int++ 
Id++ 
{++ 
get++ 
;++ 
}++ 
},, 
}-- °
tC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\DeleteClaimSetCommandV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class +
DeleteClaimSetCommandV53Service 0
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public +
DeleteClaimSetCommandV53Service .
(. /
ISecurityContext/ ?
context@ G
)G H
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
(  
IDeleteClaimSetModel 0
claimSet1 9
)9 :
{ 	
var 
claimSetToDelete  
=! "
_context# +
.+ ,
	ClaimSets, 5
.5 6
Single6 <
(< =
x= >
=>? A
xB C
.C D

ClaimSetIdD N
==O Q
claimSetR Z
.Z [
Id[ ]
)] ^
;^ _
if 
( 
CloudOdsAdminApp  
.  !
DefaultClaimSets! 1
.1 2
Contains2 :
(: ;
claimSetToDelete; K
.K L
ClaimSetNameL X
)X Y
||Z \
CloudOdsAdminApp (
.( )#
SystemReservedClaimSets) @
.@ A
ContainsA I
(I J
claimSetToDeleteJ Z
.Z [
ClaimSetName[ g
)g h
)h i
{ 
throw 
new 
AdminAppException +
(+ ,
$", .
$str. 8
{8 9
claimSetToDelete9 I
.I J
ClaimSetNameJ V
}V W
$strW 
"	 Ä
)
Ä Å
;
Å Ç
} 
var   '
resourceClaimsForClaimSetId   +
=  , -
_context!! 
.!! "
ClaimSetResourceClaims!! /
.!!/ 0
Where!!0 5
(!!5 6
x!!6 7
=>!!8 :
x!!; <
.!!< =
ClaimSet!!= E
.!!E F

ClaimSetId!!F P
==!!Q S
claimSet!!T \
.!!\ ]
Id!!] _
)!!_ `
.!!` a
ToList!!a g
(!!g h
)!!h i
;!!i j
_context"" 
."" "
ClaimSetResourceClaims"" +
.""+ ,
RemoveRange"", 7
(""7 8'
resourceClaimsForClaimSetId""8 S
)""S T
;""T U
_context## 
.## 
	ClaimSets## 
.## 
Remove## %
(##% &
claimSetToDelete##& 6
)##6 7
;##7 8
_context$$ 
.$$ 
SaveChanges$$  
($$  !
)$$! "
;$$" #
}%% 	
}&& 
}'' ≠
sC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\DeleteClaimSetCommandV6Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class *
DeleteClaimSetCommandV6Service /
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public *
DeleteClaimSetCommandV6Service -
(- .
ISecurityContext. >
context? F
)F G
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
(  
IDeleteClaimSetModel 0
claimSet1 9
)9 :
{ 	
var 
claimSetToDelete  
=! "
_context# +
.+ ,
	ClaimSets, 5
.5 6
Single6 <
(< =
x= >
=>? A
xB C
.C D

ClaimSetIdD N
==O Q
claimSetR Z
.Z [
Id[ ]
)] ^
;^ _
if 
( 
claimSetToDelete  
.  !!
ForApplicationUseOnly! 6
||7 9
claimSetToDelete: J
.J K
IsEdfiPresetK W
||X Z
CloudOdsAdminApp $
.$ %#
SystemReservedClaimSets% <
.< =
Contains= E
(E F
claimSetToDeleteF V
.V W
ClaimSetNameW c
)c d
)d e
{ 
throw 
new 
AdminAppException +
(+ ,
$", .
$str. 8
{8 9
claimSetToDelete9 I
.I J
ClaimSetNameJ V
}V W
$strW 
"	 Ä
)
Ä Å
;
Å Ç
} 
var '
resourceClaimsForClaimSetId +
=, -
_context   
.   (
ClaimSetResourceClaimActions   ;
.  ; <
Where  < A
(  A B
x  B C
=>  D F
x  G H
.  H I
ClaimSet  I Q
.  Q R

ClaimSetId  R \
==  ] _
claimSet  ` h
.  h i
Id  i k
)  k l
.  l m
ToList  m s
(  s t
)  t u
;  u v
foreach!! 
(!! 
var!! 
resourceClaimAction!! ,
in!!- /'
resourceClaimsForClaimSetId!!0 K
)!!K L
{"" 
var## =
1resourceClaimActionAuthorizationStrategyOverrides## E
=##F G
_context##H P
.##P QF
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides	##Q ä
.
##ä ã
Where$$ 
($$ 
x$$ 
=>$$ 
x$$  
.$$  !)
ClaimSetResourceClaimActionId$$! >
==$$? A
resourceClaimAction$$B U
.$$U V)
ClaimSetResourceClaimActionId$$V s
)$$s t
;$$t u
_context&& 
.&& E
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides&& R
.&&R S
RemoveRange&&S ^
(&&^ _>
1resourceClaimActionAuthorizationStrategyOverrides	&&_ ê
)
&&ê ë
;
&&ë í
}'' 
_context)) 
.)) (
ClaimSetResourceClaimActions)) 1
.))1 2
RemoveRange))2 =
())= >'
resourceClaimsForClaimSetId))> Y
)))Y Z
;))Z [
_context** 
.** 
	ClaimSets** 
.** 
Remove** %
(**% &
claimSetToDelete**& 6
)**6 7
;**7 8
_context++ 
.++ 
SaveChanges++  
(++  !
)++! "
;++" #
},, 	
}-- 
}.. Å
tC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\DeleteResourceOnClaimSetCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class +
DeleteResourceOnClaimSetCommand 0
{		 
private

 
readonly

 ,
 IOdsSecurityModelVersionResolver

 9
	_resolver

: C
;

C D
private 
readonly 5
)DeleteResourceOnClaimSetCommandV53Service B
_v53ServiceC N
;N O
private 
readonly 4
(DeleteResourceOnClaimSetCommandV6Service A

_v6ServiceB L
;L M
public +
DeleteResourceOnClaimSetCommand .
(. /,
 IOdsSecurityModelVersionResolver/ O
resolverP X
,X Y5
)DeleteResourceOnClaimSetCommandV53Service 5

v53Service6 @
,@ A4
(DeleteResourceOnClaimSetCommandV6Service 4
	v6Service5 >
)> ?
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
void 
Execute 
( *
IDeleteResourceOnClaimSetModel :
model; @
)@ A
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
_v53Service 
. 
Execute #
(# $
model$ )
)) *
;* +
else 
if 
( 
securityModel "
==# %-
!EdFiOdsSecurityModelCompatibility& G
.G H
SixH K
)K L

_v6Service 
. 
Execute "
(" #
model# (
)( )
;) *
else 
throw 
new 6
*EdFiOdsSecurityModelCompatibilityException D
(D E
securityModelE R
)R S
;S T
}   	
}!! 
public## 

	interface## *
IDeleteResourceOnClaimSetModel## 3
{$$ 
int%% 

ClaimSetId%% 
{%% 
get%% 
;%% 
}%% 
int&& 
ResourceClaimId&& 
{&& 
get&& !
;&&! "
}&&# $
}'' 
}(( Œ
~C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\DeleteResourceOnClaimSetCommandV53Service.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ClaimSetEditor		' 5
{

 
public 

class 5
)DeleteResourceOnClaimSetCommandV53Service :
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public 5
)DeleteResourceOnClaimSetCommandV53Service 8
(8 9
ISecurityContext9 I
contextJ Q
)Q R
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
( *
IDeleteResourceOnClaimSetModel :
model; @
)@ A
{ 	
var "
resourceClaimsToRemove &
=' (
_context) 1
.1 2"
ClaimSetResourceClaims2 H
.H I
WhereI N
(N O
xO P
=>Q S
x 
. 
ResourceClaim 
.  
ResourceClaimId  /
==0 2
model3 8
.8 9
ResourceClaimId9 H
&&I K
xL M
.M N
ClaimSetN V
.V W

ClaimSetIdW a
==b d
modele j
.j k

ClaimSetIdk u
)u v
.v w
ToListw }
(} ~
)~ 
;	 Ä
_context 
. "
ClaimSetResourceClaims +
.+ ,
RemoveRange, 7
(7 8"
resourceClaimsToRemove8 N
)N O
;O P
_context 
. 
SaveChanges  
(  !
)! "
;" #
} 	
} 
} É
}C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\DeleteResourceOnClaimSetCommandV6Service.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ClaimSetEditor		' 5
{

 
public 

class 4
(DeleteResourceOnClaimSetCommandV6Service 9
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public 4
(DeleteResourceOnClaimSetCommandV6Service 7
(7 8
ISecurityContext8 H
contextI P
)P Q
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
( *
IDeleteResourceOnClaimSetModel :
model; @
)@ A
{ 	
var "
resourceClaimsToRemove &
=' (
_context) 1
.1 2(
ClaimSetResourceClaimActions2 N
.N O
WhereO T
(T U
xU V
=>W Y
x 
. 
ResourceClaim 
.  
ResourceClaimId  /
==0 2
model3 8
.8 9
ResourceClaimId9 H
&&I K
xL M
.M N
ClaimSetN V
.V W

ClaimSetIdW a
==b d
modele j
.j k

ClaimSetIdk u
)u v
.v w
ToListw }
(} ~
)~ 
;	 Ä
foreach 
( 
var 
resourceClaimAction ,
in- /"
resourceClaimsToRemove0 F
)F G
{ 
var =
1resourceClaimActionAuthorizationStrategyOverrides E
=F G
_contextH P
.P QF
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides	Q ä
.
ä ã
Where 
( 
x 
=> 
x  
.  !)
ClaimSetResourceClaimActionId! >
==? A
resourceClaimActionB U
.U V)
ClaimSetResourceClaimActionIdV s
)s t
;t u
_context 
. E
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides R
.R S
RemoveRangeS ^
(^ _>
1resourceClaimActionAuthorizationStrategyOverrides	_ ê
)
ê ë
;
ë í
} 
_context!! 
.!! (
ClaimSetResourceClaimActions!! 1
.!!1 2
RemoveRange!!2 =
(!!= >"
resourceClaimsToRemove!!> T
)!!T U
;!!U V
_context"" 
."" 
SaveChanges""  
(""  !
)""! "
;""" #
}## 	
}$$ 
}%% Í
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\EditClaimSetCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

	interface  
IEditClaimSetCommand )
{		 
int

 
Execute

 
(

 
IEditClaimSetModel

 &
claimSet

' /
)

/ 0
;

0 1
} 
public 

class 
EditClaimSetCommand $
:% & 
IEditClaimSetCommand' ;
{ 
private 
readonly ,
 IOdsSecurityModelVersionResolver 9
	_resolver: C
;C D
private 
readonly )
EditClaimSetCommandV53Service 6
_v53Service7 B
;B C
private 
readonly (
EditClaimSetCommandV6Service 5

_v6Service6 @
;@ A
public 
EditClaimSetCommand "
(" #,
 IOdsSecurityModelVersionResolver# C
resolverD L
,L M)
EditClaimSetCommandV53Service )

v53Service* 4
,4 5(
EditClaimSetCommandV6Service (
	v6Service) 2
)2 3
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
int 
Execute 
( 
IEditClaimSetModel -
claimSet. 6
)6 7
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
return   
_v53Service   "
.  " #
Execute  # *
(  * +
claimSet  + 3
)  3 4
;  4 5
else!! 
if!! 
(!! 
securityModel!! "
==!!# %-
!EdFiOdsSecurityModelCompatibility!!& G
.!!G H
Six!!H K
)!!K L
return"" 

_v6Service"" !
.""! "
Execute""" )
("") *
claimSet""* 2
)""2 3
;""3 4
else## 
throw$$ 
new$$ 6
*EdFiOdsSecurityModelCompatibilityException$$ D
($$D E
securityModel$$E R
)$$R S
;$$S T
}%% 	
}&& 
public(( 

	interface(( 
IEditClaimSetModel(( '
{)) 
string** 
ClaimSetName** 
{** 
get** !
;**! "
}**# $
int++ 

ClaimSetId++ 
{++ 
get++ 
;++ 
}++ 
},, 
}-- á#
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\EditClaimSetCommandV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class )
EditClaimSetCommandV53Service .
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
public )
EditClaimSetCommandV53Service ,
(, -
ISecurityContext- =
securityContext> M
,M N
IUsersContextO \
usersContext] i
)i j
{ 	
_securityContext 
= 
securityContext .
;. /
_usersContext 
= 
usersContext (
;( )
} 	
public 
int 
Execute 
( 
IEditClaimSetModel -
claimSet. 6
)6 7
{ 	
var 
existingClaimSet  
=! "
_securityContext# 3
.3 4
	ClaimSets4 =
.= >
Single> D
(D E
xE F
=>G I
xJ K
.K L

ClaimSetIdL V
==W Y
claimSetZ b
.b c

ClaimSetIdc m
)m n
;n o
if 
( 
CloudOdsAdminApp  
.  !
DefaultClaimSets! 1
.1 2
Contains2 :
(: ;
existingClaimSet; K
.K L
ClaimSetNameL X
)X Y
||Z \
CloudOdsAdminApp (
.( )#
SystemReservedClaimSets) @
.@ A
ContainsA I
(I J
existingClaimSetJ Z
.Z [
ClaimSetName[ g
)g h
)h i
{ 
throw   
new   
AdminAppException   +
(  + ,
$"  , .
$str  . 9
{  9 :
existingClaimSet  : J
.  J K
ClaimSetName  K W
}  W X
$str	  X Å
"
  Å Ç
)
  Ç É
;
  É Ñ
}!! 
if## 
(## 
!## 
claimSet## 
.## 
ClaimSetName## &
.##& '
Equals##' -
(##- .
existingClaimSet##. >
.##> ?
ClaimSetName##? K
,##K L
StringComparison##M ]
.##] ^&
InvariantCultureIgnoreCase##^ x
)##x y
)##y z
{$$ 4
(ReAssociateApplicationsToRenamedClaimSet%% 8
(%%8 9
existingClaimSet%%9 I
.%%I J
ClaimSetName%%J V
,%%V W
claimSet%%X `
.%%` a
ClaimSetName%%a m
)%%m n
;%%n o
}&& 
existingClaimSet(( 
.(( 
ClaimSetName(( )
=((* +
claimSet((, 4
.((4 5
ClaimSetName((5 A
;((A B
void** 4
(ReAssociateApplicationsToRenamedClaimSet** 9
(**9 :
string**: @ 
existingClaimSetName**A U
,**U V
string**W ]
newClaimSetName**^ m
)**m n
{++ 
var,, "
associatedApplications,, *
=,,+ ,
_usersContext,,- :
.,,: ;
Applications,,; G
.-- 
Where-- 
(-- 
x-- 
=>-- 
x--  !
.--! "
ClaimSetName--" .
==--/ 1 
existingClaimSetName--2 F
)--F G
;--G H
foreach// 
(// 
var// 
application// (
in//) +"
associatedApplications//, B
)//B C
{00 
application11 
.11  
ClaimSetName11  ,
=11- .
newClaimSetName11/ >
;11> ?
}22 
}33 
_securityContext55 
.55 
SaveChanges55 (
(55( )
)55) *
;55* +
_usersContext66 
.66 
SaveChanges66 %
(66% &
)66& '
;66' (
return88 
existingClaimSet88 #
.88# $

ClaimSetId88$ .
;88. /
}99 	
}:: 
};; ÷"
qC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\EditClaimSetCommandV6Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class (
EditClaimSetCommandV6Service -
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
public (
EditClaimSetCommandV6Service +
(+ ,
ISecurityContext, <
securityContext= L
,L M
IUsersContextN [
usersContext\ h
)h i
{ 	
_securityContext 
= 
securityContext .
;. /
_usersContext 
= 
usersContext (
;( )
} 	
public 
int 
Execute 
( 
IEditClaimSetModel -
claimSet. 6
)6 7
{ 	
var 
existingClaimSet  
=! "
_securityContext# 3
.3 4
	ClaimSets4 =
.= >
Single> D
(D E
xE F
=>G I
xJ K
.K L

ClaimSetIdL V
==W Y
claimSetZ b
.b c

ClaimSetIdc m
)m n
;n o
if 
( 
existingClaimSet  
.  !!
ForApplicationUseOnly! 6
||7 9
existingClaimSet: J
.J K
IsEdfiPresetK W
||X Z
CloudOdsAdminApp $
.$ %#
SystemReservedClaimSets% <
.< =
Contains= E
(E F
existingClaimSetF V
.V W
ClaimSetNameW c
)c d
)d e
{ 
throw   
new   
AdminAppException   +
(  + ,
$"  , .
$str  . 9
{  9 :
existingClaimSet  : J
.  J K
ClaimSetName  K W
}  W X
$str	  X Å
"
  Å Ç
)
  Ç É
;
  É Ñ
}!! 
if## 
(## 
!## 
claimSet## 
.## 
ClaimSetName## &
.##& '
Equals##' -
(##- .
existingClaimSet##. >
.##> ?
ClaimSetName##? K
,##K L
StringComparison##M ]
.##] ^&
InvariantCultureIgnoreCase##^ x
)##x y
)##y z
{$$ 4
(ReAssociateApplicationsToRenamedClaimSet%% 8
(%%8 9
existingClaimSet%%9 I
.%%I J
ClaimSetName%%J V
,%%V W
claimSet%%X `
.%%` a
ClaimSetName%%a m
)%%m n
;%%n o
}&& 
existingClaimSet(( 
.(( 
ClaimSetName(( )
=((* +
claimSet((, 4
.((4 5
ClaimSetName((5 A
;((A B
_securityContext** 
.** 
SaveChanges** (
(**( )
)**) *
;*** +
_usersContext++ 
.++ 
SaveChanges++ %
(++% &
)++& '
;++' (
return-- 
existingClaimSet-- #
.--# $

ClaimSetId--$ .
;--. /
void// 4
(ReAssociateApplicationsToRenamedClaimSet// 9
(//9 :
string//: @ 
existingClaimSetName//A U
,//U V
string//W ]
newClaimSetName//^ m
)//m n
{00 
var11 "
associatedApplications11 *
=11+ ,
_usersContext11- :
.11: ;
Applications11; G
.22 
Where22 
(22 
x22 
=>22 
x22  !
.22! "
ClaimSetName22" .
==22/ 1 
existingClaimSetName222 F
)22F G
;22G H
foreach44 
(44 
var44 
application44 (
in44) +"
associatedApplications44, B
)44B C
{55 
application66 
.66  
ClaimSetName66  ,
=66- .
newClaimSetName66/ >
;66> ?
}77 
}88 
}99 	
}:: 
};; ˜
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\EditResourceOnClaimSetCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class )
EditResourceOnClaimSetCommand .
{		 
private

 
readonly

 ,
 IOdsSecurityModelVersionResolver

 9
	_resolver

: C
;

C D
private 
readonly 3
'EditResourceOnClaimSetCommandV53Service @
_v53ServiceA L
;L M
private 
readonly 2
&EditResourceOnClaimSetCommandV6Service ?

_v6Service@ J
;J K
public )
EditResourceOnClaimSetCommand ,
(, -,
 IOdsSecurityModelVersionResolver- M
resolverN V
,V W3
'EditResourceOnClaimSetCommandV53Service 3

v53Service4 >
,> ?2
&EditResourceOnClaimSetCommandV6Service 2
	v6Service3 <
)< =
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
void 
Execute 
( (
IEditResourceOnClaimSetModel 8
model9 >
)> ?
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
_v53Service 
. 
Execute #
(# $
model$ )
)) *
;* +
else 
if 
( 
securityModel "
==# %-
!EdFiOdsSecurityModelCompatibility& G
.G H
SixH K
)K L

_v6Service 
. 
Execute "
(" #
model# (
)( )
;) *
else 
throw 
new 6
*EdFiOdsSecurityModelCompatibilityException D
(D E
securityModelE R
)R S
;S T
}   	
}!! 
public## 

	interface## (
IEditResourceOnClaimSetModel## 1
{$$ 
int%% 

ClaimSetId%% 
{%% 
get%% 
;%% 
}%% 
ResourceClaim&& 
ResourceClaim&& #
{&&$ %
get&&& )
;&&) *
}&&+ ,
}'' 
}(( œb
|C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\EditResourceOnClaimSetCommandV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 3
'EditResourceOnClaimSetCommandV53Service 8
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public 3
'EditResourceOnClaimSetCommandV53Service 6
(6 7
ISecurityContext7 G
contextH O
)O P
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
( (
IEditResourceOnClaimSetModel 8
model9 >
)> ?
{ 	
var 
resourceClaimToEdit #
=$ %
model& +
.+ ,
ResourceClaim, 9
;9 :
var 
claimSetToEdit 
=  
_context! )
.) *
	ClaimSets* 3
.3 4
Single4 :
(: ;
x; <
=>= ?
x@ A
.A B

ClaimSetIdB L
==M O
modelP U
.U V

ClaimSetIdV `
)` a
;a b
var (
claimSetResourceClaimsToEdit ,
=- .
_context/ 7
.7 8"
ClaimSetResourceClaims8 N
.   
Include   
(   
x   
=>   
x   
.    
ResourceClaim    -
)  - .
.!! 
Include!! 
(!! 
x!! 
=>!! 
x!! 
.!!  
Action!!  &
)!!& '
."" 
Include"" 
("" 
x"" 
=>"" 
x"" 
.""  
ClaimSet""  (
)""( )
.## 
Where## 
(## 
x## 
=>## 
x## 
.## 
ResourceClaim## +
.##+ ,
ResourceClaimId##, ;
==##< >
resourceClaimToEdit##? R
.##R S
Id##S U
&&##V X
x##Y Z
.##Z [
ClaimSet##[ c
.##c d

ClaimSetId##d n
==##o q
claimSetToEdit	##r Ä
.
##Ä Å

ClaimSetId
##Å ã
)
##ã å
.$$ 
ToList$$ 
($$ 
)$$ 
;$$ '
AddEnabledActionsToClaimSet&& '
(&&' (
resourceClaimToEdit&&( ;
,&&; <(
claimSetResourceClaimsToEdit&&= Y
,&&Y Z
claimSetToEdit&&[ i
)&&i j
;&&j k-
!RemoveDisabledActionsFromClaimSet(( -
(((- .
resourceClaimToEdit((. A
,((A B(
claimSetResourceClaimsToEdit((C _
)((_ `
;((` a
_context** 
.** 
SaveChanges**  
(**  !
)**! "
;**" #
}++ 	
private-- 
void-- -
!RemoveDisabledActionsFromClaimSet-- 6
(--6 7
ResourceClaim--7 D
modelResourceClaim--E W
,--W X
IEnumerable--Y d
<--d e!
ClaimSetResourceClaim--e z
>--z {!
resourceClaimsToEdit	--| ê
)
--ê ë
{.. 	
var// 
recordsToRemove// 
=//  !
new//" %
List//& *
<//* +!
ClaimSetResourceClaim//+ @
>//@ A
(//A B
)//B C
;//C D
foreach11 
(11 
var11 !
claimSetResourceClaim11 .
in11/ 1 
resourceClaimsToEdit112 F
)11F G
{22 
if33 
(33 !
claimSetResourceClaim33 )
.33) *
Action33* 0
.330 1

ActionName331 ;
==33< >
Action33? E
.33E F
Create33F L
.33L M
Value33M R
&&33S U
!33V W
modelResourceClaim33W i
.33i j
Create33j p
)33p q
{44 
recordsToRemove55 #
.55# $
Add55$ '
(55' (!
claimSetResourceClaim55( =
)55= >
;55> ?
}66 
else77 
if77 
(77 !
claimSetResourceClaim77 .
.77. /
Action77/ 5
.775 6

ActionName776 @
==77A C
Action77D J
.77J K
Read77K O
.77O P
Value77P U
&&77V X
!77Y Z
modelResourceClaim77Z l
.77l m
Read77m q
)77q r
{88 
recordsToRemove99 #
.99# $
Add99$ '
(99' (!
claimSetResourceClaim99( =
)99= >
;99> ?
}:: 
else;; 
if;; 
(;; !
claimSetResourceClaim;; .
.;;. /
Action;;/ 5
.;;5 6

ActionName;;6 @
==;;A C
Action;;D J
.;;J K
Update;;K Q
.;;Q R
Value;;R W
&&;;X Z
!;;[ \
modelResourceClaim;;\ n
.;;n o
Update;;o u
);;u v
{<< 
recordsToRemove== #
.==# $
Add==$ '
(==' (!
claimSetResourceClaim==( =
)=== >
;==> ?
}>> 
else?? 
if?? 
(?? !
claimSetResourceClaim?? .
.??. /
Action??/ 5
.??5 6

ActionName??6 @
==??A C
Action??D J
.??J K
Delete??K Q
.??Q R
Value??R W
&&??X Z
!??[ \
modelResourceClaim??\ n
.??n o
Delete??o u
)??u v
{@@ 
recordsToRemoveAA #
.AA# $
AddAA$ '
(AA' (!
claimSetResourceClaimAA( =
)AA= >
;AA> ?
}BB 
}CC 
ifEE 
(EE 
recordsToRemoveEE 
.EE  
AnyEE  #
(EE# $
)EE$ %
)EE% &
{FF 
_contextGG 
.GG "
ClaimSetResourceClaimsGG /
.GG/ 0
RemoveRangeGG0 ;
(GG; <
recordsToRemoveGG< K
)GGK L
;GGL M
}HH 
}II 	
privateKK 
voidKK '
AddEnabledActionsToClaimSetKK 0
(KK0 1
ResourceClaimKK1 >
modelResourceClaimKK? Q
,KKQ R
IReadOnlyCollectionKKS f
<KKf g!
ClaimSetResourceClaimKKg |
>KK| })
claimSetResourceClaimsToEdit	KK~ ö
,
KKö õ
SecurityClaimSet
KKú ¨
claimSetToEdit
KK≠ ª
)
KKª º
{LL 	
varMM 
actionsFromDbMM 
=MM 
_contextMM  (
.MM( )
ActionsMM) 0
.MM0 1
ToListMM1 7
(MM7 8
)MM8 9
;MM9 :
varOO 
resourceClaimFromDbOO #
=OO$ %
_contextOO& .
.OO. /
ResourceClaimsOO/ =
.OO= >
SingleOO> D
(OOD E
xOOE F
=>OOG I
xOOJ K
.OOK L
ResourceClaimIdOOL [
==OO\ ^
modelResourceClaimOO_ q
.OOq r
IdOOr t
)OOt u
;OOu v
varQQ 
recordsToAddQQ 
=QQ 
newQQ "
ListQQ# '
<QQ' (!
ClaimSetResourceClaimQQ( =
>QQ= >
(QQ> ?
)QQ? @
;QQ@ A
ifSS 
(SS 
modelResourceClaimSS "
.SS" #
CreateSS# )
&&SS* ,(
claimSetResourceClaimsToEditSS- I
.SSI J
AllSSJ M
(SSM N
xSSN O
=>SSP R
xSSS T
.SST U
ActionSSU [
.SS[ \

ActionNameSS\ f
!=SSg i
ActionSSj p
.SSp q
CreateSSq w
.SSw x
ValueSSx }
)SS} ~
)SS~ 
{TT 
recordsToAddUU 
.UU 
AddUU  
(UU  !
newUU! $!
ClaimSetResourceClaimUU% :
{VV 
ActionWW 
=WW 
actionsFromDbWW *
.WW* +
SingleWW+ 1
(WW1 2
xWW2 3
=>WW4 6
xWW7 8
.WW8 9

ActionNameWW9 C
==WWD F
ActionWWG M
.WWM N
CreateWWN T
.WWT U
ValueWWU Z
)WWZ [
,WW[ \
ClaimSetXX 
=XX 
claimSetToEditXX -
,XX- .
ResourceClaimYY !
=YY" #
resourceClaimFromDbYY$ 7
}ZZ 
)ZZ 
;ZZ 
}[[ 
if]] 
(]] 
modelResourceClaim]] "
.]]" #
Read]]# '
&&]]( *(
claimSetResourceClaimsToEdit]]+ G
.]]G H
All]]H K
(]]K L
x]]L M
=>]]N P
x]]Q R
.]]R S
Action]]S Y
.]]Y Z

ActionName]]Z d
!=]]e g
Action]]h n
.]]n o
Read]]o s
.]]s t
Value]]t y
)]]y z
)]]z {
{^^ 
recordsToAdd__ 
.__ 
Add__  
(__  !
new__! $!
ClaimSetResourceClaim__% :
{`` 
Actionaa 
=aa 
actionsFromDbaa *
.aa* +
Singleaa+ 1
(aa1 2
xaa2 3
=>aa4 6
xaa7 8
.aa8 9

ActionNameaa9 C
==aaD F
ActionaaG M
.aaM N
ReadaaN R
.aaR S
ValueaaS X
)aaX Y
,aaY Z
ClaimSetbb 
=bb 
claimSetToEditbb -
,bb- .
ResourceClaimcc !
=cc" #
resourceClaimFromDbcc$ 7
}dd 
)dd 
;dd 
}ee 
ifgg 
(gg 
modelResourceClaimgg "
.gg" #
Updategg# )
&&gg* ,(
claimSetResourceClaimsToEditgg- I
.ggI J
AllggJ M
(ggM N
xggN O
=>ggP R
xggS T
.ggT U
ActionggU [
.gg[ \

ActionNamegg\ f
!=ggg i
Actionggj p
.ggp q
Updateggq w
.ggw x
Valueggx }
)gg} ~
)gg~ 
{hh 
recordsToAddii 
.ii 
Addii  
(ii  !
newii! $!
ClaimSetResourceClaimii% :
{jj 
Actionkk 
=kk 
actionsFromDbkk *
.kk* +
Singlekk+ 1
(kk1 2
xkk2 3
=>kk4 6
xkk7 8
.kk8 9

ActionNamekk9 C
==kkD F
ActionkkG M
.kkM N
UpdatekkN T
.kkT U
ValuekkU Z
)kkZ [
,kk[ \
ClaimSetll 
=ll 
claimSetToEditll -
,ll- .
ResourceClaimmm !
=mm" #
resourceClaimFromDbmm$ 7
}nn 
)nn 
;nn 
}oo 
ifqq 
(qq 
modelResourceClaimqq "
.qq" #
Deleteqq# )
&&qq* ,(
claimSetResourceClaimsToEditqq- I
.qqI J
AllqqJ M
(qqM N
xqqN O
=>qqP R
xqqS T
.qqT U
ActionqqU [
.qq[ \

ActionNameqq\ f
!=qqg i
Actionqqj p
.qqp q
Deleteqqq w
.qqw x
Valueqqx }
)qq} ~
)qq~ 
{rr 
recordsToAddss 
.ss 
Addss  
(ss  !
newss! $!
ClaimSetResourceClaimss% :
{tt 
Actionuu 
=uu 
actionsFromDbuu *
.uu* +
Singleuu+ 1
(uu1 2
xuu2 3
=>uu4 6
xuu7 8
.uu8 9

ActionNameuu9 C
==uuD F
ActionuuG M
.uuM N
DeleteuuN T
.uuT U
ValueuuU Z
)uuZ [
,uu[ \
ClaimSetvv 
=vv 
claimSetToEditvv -
,vv- .
ResourceClaimww !
=ww" #
resourceClaimFromDbww$ 7
}xx 
)xx 
;xx 
}yy 
if{{ 
({{ 
recordsToAdd{{ 
.{{ 
Any{{  
({{  !
){{! "
){{" #
{|| 
_context}} 
.}} "
ClaimSetResourceClaims}} /
.}}/ 0
AddRange}}0 8
(}}8 9
recordsToAdd}}9 E
)}}E F
;}}F G
}~~ 
} 	
}
ÄÄ 
}ÅÅ Öd
{C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\EditResourceOnClaimSetCommandV6Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 2
&EditResourceOnClaimSetCommandV6Service 7
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public 2
&EditResourceOnClaimSetCommandV6Service 5
(5 6
ISecurityContext6 F
contextG N
)N O
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
( (
IEditResourceOnClaimSetModel 8
model9 >
)> ?
{ 	
var 
resourceClaimToEdit #
=$ %
model& +
.+ ,
ResourceClaim, 9
;9 :
var 
claimSetToEdit 
=  
_context! )
.) *
	ClaimSets* 3
.3 4
Single4 :
(: ;
x; <
=>= ?
x@ A
.A B

ClaimSetIdB L
==M O
modelP U
.U V

ClaimSetIdV `
)` a
;a b
var (
claimSetResourceClaimsToEdit ,
=- .
_context/ 7
.7 8(
ClaimSetResourceClaimActions8 T
. 
Include 
( 
x 
=> 
x 
.  
ResourceClaim  -
)- .
. 
Include 
( 
x 
=> 
x 
.  
Action  &
)& '
.   
Include   
(   
x   
=>   
x   
.    
ClaimSet    (
)  ( )
.!! 
Where!! 
(!! 
x!! 
=>!! 
x!! 
.!! 
ResourceClaim!! +
.!!+ ,
ResourceClaimId!!, ;
==!!< >
resourceClaimToEdit!!? R
.!!R S
Id!!S U
&&!!V X
x!!Y Z
.!!Z [
ClaimSet!![ c
.!!c d

ClaimSetId!!d n
==!!o q
claimSetToEdit	!!r Ä
.
!!Ä Å

ClaimSetId
!!Å ã
)
!!ã å
."" 
ToList"" 
("" 
)"" 
;"" '
AddEnabledActionsToClaimSet$$ '
($$' (
resourceClaimToEdit$$( ;
,$$; <(
claimSetResourceClaimsToEdit$$= Y
,$$Y Z
claimSetToEdit$$[ i
)$$i j
;$$j k-
!RemoveDisabledActionsFromClaimSet&& -
(&&- .
resourceClaimToEdit&&. A
,&&A B(
claimSetResourceClaimsToEdit&&C _
)&&_ `
;&&` a
_context(( 
.(( 
SaveChanges((  
(((  !
)((! "
;((" #
})) 	
private++ 
void++ -
!RemoveDisabledActionsFromClaimSet++ 6
(++6 7
ResourceClaim++7 D
modelResourceClaim++E W
,++W X
IEnumerable++Y d
<++d e(
ClaimSetResourceClaimAction	++e Ä
>
++Ä Å"
resourceClaimsToEdit
++Ç ñ
)
++ñ ó
{,, 	
var-- 
recordsToRemove-- 
=--  !
new--" %
List--& *
<--* +'
ClaimSetResourceClaimAction--+ F
>--F G
(--G H
)--H I
;--I J
foreach// 
(// 
var// !
claimSetResourceClaim// .
in/// 1 
resourceClaimsToEdit//2 F
)//F G
{00 
if11 
(11 !
claimSetResourceClaim11 )
.11) *
Action11* 0
.110 1

ActionName111 ;
==11< >
Action11? E
.11E F
Create11F L
.11L M
Value11M R
&&11S U
!11V W
modelResourceClaim11W i
.11i j
Create11j p
)11p q
{22 
recordsToRemove33 #
.33# $
Add33$ '
(33' (!
claimSetResourceClaim33( =
)33= >
;33> ?
}44 
else55 
if55 
(55 !
claimSetResourceClaim55 .
.55. /
Action55/ 5
.555 6

ActionName556 @
==55A C
Action55D J
.55J K
Read55K O
.55O P
Value55P U
&&55V X
!55Y Z
modelResourceClaim55Z l
.55l m
Read55m q
)55q r
{66 
recordsToRemove77 #
.77# $
Add77$ '
(77' (!
claimSetResourceClaim77( =
)77= >
;77> ?
}88 
else99 
if99 
(99 !
claimSetResourceClaim99 .
.99. /
Action99/ 5
.995 6

ActionName996 @
==99A C
Action99D J
.99J K
Update99K Q
.99Q R
Value99R W
&&99X Z
!99[ \
modelResourceClaim99\ n
.99n o
Update99o u
)99u v
{:: 
recordsToRemove;; #
.;;# $
Add;;$ '
(;;' (!
claimSetResourceClaim;;( =
);;= >
;;;> ?
}<< 
else== 
if== 
(== !
claimSetResourceClaim== .
.==. /
Action==/ 5
.==5 6

ActionName==6 @
====A C
Action==D J
.==J K
Delete==K Q
.==Q R
Value==R W
&&==X Z
!==[ \
modelResourceClaim==\ n
.==n o
Delete==o u
)==u v
{>> 
recordsToRemove?? #
.??# $
Add??$ '
(??' (!
claimSetResourceClaim??( =
)??= >
;??> ?
}@@ 
}AA 
ifCC 
(CC 
recordsToRemoveCC 
.CC  
AnyCC  #
(CC# $
)CC$ %
)CC% &
{DD 
_contextEE 
.EE (
ClaimSetResourceClaimActionsEE 5
.EE5 6
RemoveRangeEE6 A
(EEA B
recordsToRemoveEEB Q
)EEQ R
;EER S
}FF 
}GG 	
privateII 
voidII '
AddEnabledActionsToClaimSetII 0
(II0 1
ResourceClaimII1 >
modelResourceClaimII? Q
,IIQ R
IReadOnlyCollectionIIS f
<IIf g(
ClaimSetResourceClaimAction	IIg Ç
>
IIÇ É*
claimSetResourceClaimsToEdit
IIÑ †
,
II† °
Security
II¢ ™
.
II™ ´

DataAccess
II´ µ
.
IIµ ∂
Models
II∂ º
.
IIº Ω
ClaimSet
IIΩ ≈
claimSetToEdit
II∆ ‘
)
II‘ ’
{JJ 	
varKK 
actionsFromDbKK 
=KK 
_contextKK  (
.KK( )
ActionsKK) 0
.KK0 1
ToListKK1 7
(KK7 8
)KK8 9
;KK9 :
varMM 
resourceClaimFromDbMM #
=MM$ %
_contextMM& .
.MM. /
ResourceClaimsMM/ =
.MM= >
SingleMM> D
(MMD E
xMME F
=>MMG I
xMMJ K
.MMK L
ResourceClaimIdMML [
==MM\ ^
modelResourceClaimMM_ q
.MMq r
IdMMr t
)MMt u
;MMu v
varOO 
recordsToAddOO 
=OO 
newOO "
ListOO# '
<OO' ('
ClaimSetResourceClaimActionOO( C
>OOC D
(OOD E
)OOE F
;OOF G
ifQQ 
(QQ 
modelResourceClaimQQ "
.QQ" #
CreateQQ# )
&&QQ* ,(
claimSetResourceClaimsToEditQQ- I
.QQI J
AllQQJ M
(QQM N
xQQN O
=>QQP R
xQQS T
.QQT U
ActionQQU [
.QQ[ \

ActionNameQQ\ f
!=QQg i
ActionQQj p
.QQp q
CreateQQq w
.QQw x
ValueQQx }
)QQ} ~
)QQ~ 
{RR 
recordsToAddSS 
.SS 
AddSS  
(SS  !
newSS! $'
ClaimSetResourceClaimActionSS% @
{TT 
ActionUU 
=UU 
actionsFromDbUU *
.UU* +
SingleUU+ 1
(UU1 2
xUU2 3
=>UU4 6
xUU7 8
.UU8 9

ActionNameUU9 C
==UUD F
ActionUUG M
.UUM N
CreateUUN T
.UUT U
ValueUUU Z
)UUZ [
,UU[ \
ClaimSetVV 
=VV 
claimSetToEditVV -
,VV- .
ResourceClaimWW !
=WW" #
resourceClaimFromDbWW$ 7
}XX 
)XX 
;XX 
}YY 
if[[ 
([[ 
modelResourceClaim[[ "
.[[" #
Read[[# '
&&[[( *(
claimSetResourceClaimsToEdit[[+ G
.[[G H
All[[H K
([[K L
x[[L M
=>[[N P
x[[Q R
.[[R S
Action[[S Y
.[[Y Z

ActionName[[Z d
!=[[e g
Action[[h n
.[[n o
Read[[o s
.[[s t
Value[[t y
)[[y z
)[[z {
{\\ 
recordsToAdd]] 
.]] 
Add]]  
(]]  !
new]]! $'
ClaimSetResourceClaimAction]]% @
{^^ 
Action__ 
=__ 
actionsFromDb__ *
.__* +
Single__+ 1
(__1 2
x__2 3
=>__4 6
x__7 8
.__8 9

ActionName__9 C
==__D F
Action__G M
.__M N
Read__N R
.__R S
Value__S X
)__X Y
,__Y Z
ClaimSet`` 
=`` 
claimSetToEdit`` -
,``- .
ResourceClaimaa !
=aa" #
resourceClaimFromDbaa$ 7
}bb 
)bb 
;bb 
}cc 
ifee 
(ee 
modelResourceClaimee "
.ee" #
Updateee# )
&&ee* ,(
claimSetResourceClaimsToEditee- I
.eeI J
AlleeJ M
(eeM N
xeeN O
=>eeP R
xeeS T
.eeT U
ActioneeU [
.ee[ \

ActionNameee\ f
!=eeg i
Actioneej p
.eep q
Updateeeq w
.eew x
Valueeex }
)ee} ~
)ee~ 
{ff 
recordsToAddgg 
.gg 
Addgg  
(gg  !
newgg! $'
ClaimSetResourceClaimActiongg% @
{hh 
Actionii 
=ii 
actionsFromDbii *
.ii* +
Singleii+ 1
(ii1 2
xii2 3
=>ii4 6
xii7 8
.ii8 9

ActionNameii9 C
==iiD F
ActioniiG M
.iiM N
UpdateiiN T
.iiT U
ValueiiU Z
)iiZ [
,ii[ \
ClaimSetjj 
=jj 
claimSetToEditjj -
,jj- .
ResourceClaimkk !
=kk" #
resourceClaimFromDbkk$ 7
}ll 
)ll 
;ll 
}mm 
ifoo 
(oo 
modelResourceClaimoo "
.oo" #
Deleteoo# )
&&oo* ,(
claimSetResourceClaimsToEditoo- I
.ooI J
AllooJ M
(ooM N
xooN O
=>ooP R
xooS T
.ooT U
ActionooU [
.oo[ \

ActionNameoo\ f
!=oog i
Actionooj p
.oop q
Deleteooq w
.oow x
Valueoox }
)oo} ~
)oo~ 
{pp 
recordsToAddqq 
.qq 
Addqq  
(qq  !
newqq! $'
ClaimSetResourceClaimActionqq% @
{rr 
Actionss 
=ss 
actionsFromDbss *
.ss* +
Singless+ 1
(ss1 2
xss2 3
=>ss4 6
xss7 8
.ss8 9

ActionNamess9 C
==ssD F
ActionssG M
.ssM N
DeletessN T
.ssT U
ValuessU Z
)ssZ [
,ss[ \
ClaimSettt 
=tt 
claimSetToEdittt -
,tt- .
ResourceClaimuu !
=uu" #
resourceClaimFromDbuu$ 7
}vv 
)vv 
;vv 
}ww 
ifyy 
(yy 
recordsToAddyy 
.yy 
Anyyy  
(yy  !
)yy! "
)yy" #
{zz 
_context{{ 
.{{ (
ClaimSetResourceClaimActions{{ 5
.{{5 6
AddRange{{6 >
({{> ?
recordsToAdd{{? K
){{K L
;{{L M
}|| 
}}} 	
}~~ 
} ·
ÄC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\Extensions\AuthorizationStrategiesExtension.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
.5 6

Extensions6 @
{		 
public

 

static

 
class

 ,
 AuthorizationStrategiesExtension

 8
{ 
public 
static !
AuthorizationStrategy +
Create, 2
(2 3
this3 7!
AuthorizationStrategy8 M
[M N
]N O#
authorizationStrategiesP g
)g h
{ 	
return #
authorizationStrategies *
[* +
$num+ ,
], -
;- .
} 	
public 
static !
AuthorizationStrategy +
Read, 0
(0 1
this1 5!
AuthorizationStrategy6 K
[K L
]L M#
authorizationStrategiesN e
)e f
{ 	
return #
authorizationStrategies *
[* +
$num+ ,
], -
;- .
} 	
public 
static !
AuthorizationStrategy +
Update, 2
(2 3
this3 7!
AuthorizationStrategy8 M
[M N
]N O#
authorizationStrategiesP g
)g h
{ 	
return #
authorizationStrategies *
[* +
$num+ ,
], -
;- .
} 	
public 
static !
AuthorizationStrategy +
Delete, 2
(2 3
this3 7!
AuthorizationStrategy8 M
[M N
]N O#
authorizationStrategiesP g
)g h
{ 	
return #
authorizationStrategies *
[* +
$num+ ,
], -
;- .
} 	
public   
static   !
AuthorizationStrategy   +
[  + ,
]  , --
!AddAuthorizationStrategyOverrides  . O
(  O P
this  P T!
AuthorizationStrategy  U j
[  j k
]  k l$
authorizationStrategies	  m Ñ
,
  Ñ Ö
string!! 

actionName!! 
,!! !
AuthorizationStrategy!! 4
strategy!!5 =
)!!= >
{"" 	
if## 
(## 

actionName## 
==## 
Action## $
.##$ %
Create##% +
.##+ ,
Value##, 1
)##1 2#
authorizationStrategies$$ '
[$$' (
$num$$( )
]$$) *
=$$+ ,
strategy$$- 5
;$$5 6
else%% 
if%% 
(%% 

actionName%% 
==%%  "
Action%%# )
.%%) *
Read%%* .
.%%. /
Value%%/ 4
)%%4 5#
authorizationStrategies&& '
[&&' (
$num&&( )
]&&) *
=&&+ ,
strategy&&- 5
;&&5 6
else'' 
if'' 
('' 

actionName'' 
==''  "
Action''# )
.'') *
Update''* 0
.''0 1
Value''1 6
)''6 7#
authorizationStrategies(( '
[((' (
$num((( )
](() *
=((+ ,
strategy((- 5
;((5 6
else)) 
if)) 
()) 

actionName)) 
==))  "
Action))# )
.))) *
Delete))* 0
.))0 1
Value))1 6
)))6 7#
authorizationStrategies** '
[**' (
$num**( )
]**) *
=**+ ,
strategy**- 5
;**5 6
return,, #
authorizationStrategies,, *
;,,* +
}-- 	
}.. 
}// Ã
wC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetAllAuthorizationStrategiesQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
ClaimSetEditor

' 5
;

5 6
public 
class .
"GetAllAuthorizationStrategiesQuery /
{ 
private 
ISecurityContext 
_securityContext -
;- .
public 
.
"GetAllAuthorizationStrategiesQuery -
(- .
ISecurityContext. >
securityContext? N
)N O
{ 
_securityContext 
= 
securityContext *
;* +
} 
public 

List 
< !
AuthorizationStrategy %
>% &
Execute' .
(. /
)/ 0
{ 
return 
_securityContext 
.  #
AuthorizationStrategies  7
. 
OrderBy 
( 
x 
=> 
x 
. %
AuthorizationStrategyName 5
)5 6
. 
Select 
( 
x 
=> 
new !
AuthorizationStrategy 2
{ 
AuthStrategyId 
=  
x! "
." ##
AuthorizationStrategyId# :
,: ;
AuthStrategyName  
=! "
x# $
.$ %%
AuthorizationStrategyName% >
,> ?
DisplayName 
= 
x 
.  
DisplayName  +
} 
) 
. 
ToList 
( 
) 
; 
} 
}   ¿"
uC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetApplicationsByClaimSetIdQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class ,
 GetApplicationsByClaimSetIdQuery 1
:2 3-
!IGetApplicationsByClaimSetIdQuery4 U
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
public ,
 GetApplicationsByClaimSetIdQuery /
(/ 0
ISecurityContext0 @
securityContextA P
,P Q
IUsersContextR _
usersContext` l
)l m
{ 	
_securityContext 
= 
securityContext .
;. /
_usersContext 
= 
usersContext (
;( )
} 	
public 
IEnumerable 
< 
Application &
>& '
Execute( /
(/ 0
int0 3

claimSetId4 >
)> ?
{ 	
var 
claimSetName 
= 
GetClaimSetNameById 2
(2 3

claimSetId3 =
)= >
;> ?
return )
GetApplicationsByClaimSetName 0
(0 1
claimSetName1 =
)= >
;> ?
} 	
private 
string 
GetClaimSetNameById *
(* +
int+ .

claimSetId/ 9
)9 :
{   	
return!! 
_securityContext!! #
.!!# $
	ClaimSets!!$ -
."" 
Select"" 
("" 
x"" 
=>"" 
new""  
{""! "
x""# $
.""$ %

ClaimSetId""% /
,""/ 0
x""1 2
.""2 3
ClaimSetName""3 ?
}""? @
)""@ A
.## 
Single## 
(## 
x## 
=>## 
x## 
.## 

ClaimSetId## )
==##* ,

claimSetId##- 7
)##7 8
.##8 9
ClaimSetName##9 E
;##E F
}$$ 	
private&& 
IEnumerable&& 
<&& 
Application&& '
>&&' ()
GetApplicationsByClaimSetName&&) F
(&&F G
string&&G M
claimSetName&&N Z
)&&Z [
{'' 	
return(( 
_usersContext((  
.((  !
Applications((! -
.)) 
Where)) 
()) 
x)) 
=>)) 
x)) 
.)) 
ClaimSetName)) *
==))+ -
claimSetName)). :
))): ;
.** 
OrderBy** 
(** 
x** 
=>** 
x** 
.**  
ClaimSetName**  ,
)**, -
.++ 
Select++ 
(++ 
x++ 
=>++ 
new++  
Application++! ,
{,, 
Name-- 
=-- 
x-- 
.-- 
ApplicationName-- ,
,--, -

VendorName.. 
=..  
x..! "
..." #
Vendor..# )
...) *

VendorName..* 4
}// 
)// 
.00 
ToList00 
(00 
)00 
;00 
}11 	
public33 
int33 
ExecuteCount33 
(33  
int33  #

claimSetId33$ .
)33. /
{44 	
return55 
Execute55 
(55 

claimSetId55 %
)55% &
.55& '
Count55' ,
(55, -
)55- .
;55. /
}66 	
}77 
public99 

	interface99 -
!IGetApplicationsByClaimSetIdQuery99 6
{:: 
IEnumerable;; 
<;; 
Application;; 
>;;  
Execute;;! (
(;;( )
int;;) ,%
securityContextClaimSetId;;- F
);;F G
;;;G H
int== 
ExecuteCount== 
(== 
int== 

claimSetId== '
)==' (
;==( )
}>> 
}?? È
|C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetAuthStrategiesByApplicationNameQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
ClaimSetEditor

' 5
{ 
public 

class 3
'GetAuthStrategiesByApplicationNameQuery 8
:9 :4
(IGetAuthStrategiesByApplicationNameQuery; c
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public 3
'GetAuthStrategiesByApplicationNameQuery 6
(6 7
ISecurityContext7 G
securityContextH W
)W X
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
List 
< !
AuthorizationStrategy )
>) *
Execute+ 2
(2 3
string3 9
applicationName: I
)I J
{ 	
var 
authStrategies 
=  .
"GetAuthStrategiesByApplicationName! C
(C D
applicationNameD S
)S T
;T U
return 
authStrategies !
.! "
ToList" (
(( )
)) *
;* +
} 	
private !
AuthorizationStrategy %
[% &
]& '.
"GetAuthStrategiesByApplicationName( J
(J K
stringK Q
applicationNameR a
)a b
{ 	
return 
_securityContext #
.# $#
AuthorizationStrategies$ ;
. 
Where 
( 
x 
=> 
x 
. 
Application )
.) *
ApplicationName* 9
==: <
applicationName= L
)L M
.   
OrderBy   
(   
x   
=>   
x   
.    %
AuthorizationStrategyName    9
)  9 :
.!! 
Select!! 
(!! 
x!! 
=>!! 
new!!  !
AuthorizationStrategy!!! 6
{"" 
AuthStrategyId## "
=### $
x##% &
.##& '#
AuthorizationStrategyId##' >
,##> ?
AuthStrategyName$$ $
=$$% &
x$$' (
.$$( )
DisplayName$$) 4
}%% 
)%% 
.%% 
ToArray%% 
(%% 
)%% 
;%% 
}&& 	
}'' 
public)) 

	interface)) 4
(IGetAuthStrategiesByApplicationNameQuery)) =
{** 
List++ 
<++ !
AuthorizationStrategy++ "
>++" #
Execute++$ +
(+++ ,
string++, 2*
securityContextApplicationName++3 Q
)++Q R
;++R S
},, 
}-- ∫
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetClaimSetByIdQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class  
GetClaimSetByIdQuery %
:& '!
IGetClaimSetByIdQuery( =
{		 
private

 
readonly

 ,
 IOdsSecurityModelVersionResolver

 9
	_resolver

: C
;

C D
private 
readonly *
GetClaimSetByIdQueryV53Service 7
_v53Service8 C
;C D
private 
readonly )
GetClaimSetByIdQueryV6Service 6

_v6Service7 A
;A B
public  
GetClaimSetByIdQuery #
(# $,
 IOdsSecurityModelVersionResolver$ D
resolverE M
,M N*
GetClaimSetByIdQueryV53Service *

v53Service+ 5
,5 6)
GetClaimSetByIdQueryV6Service )
	v6Service* 3
)3 4
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
ClaimSet 
Execute 
(  
int  #

claimSetId$ .
). /
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
return 
_v53Service "
." #
Execute# *
(* +

claimSetId+ 5
)5 6
;6 7
else 
if 
( 
securityModel "
==# %-
!EdFiOdsSecurityModelCompatibility& G
.G H
SixH K
)K L
return 

_v6Service !
.! "
Execute" )
() *

claimSetId* 4
)4 5
;5 6
else 
throw 
new 6
*EdFiOdsSecurityModelCompatibilityException D
(D E
securityModelE R
)R S
;S T
}   	
}!! 
public## 

	interface## !
IGetClaimSetByIdQuery## *
{$$ 
ClaimSet%% 
Execute%% 
(%% 
int%% %
securityContextClaimSetId%% 6
)%%6 7
;%%7 8
}&& 
}'' ‘
sC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetClaimSetByIdQueryV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class *
GetClaimSetByIdQueryV53Service /
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public *
GetClaimSetByIdQueryV53Service -
(- .
ISecurityContext. >
securityContext? N
)N O
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
ClaimSet 
Execute 
(  
int  #

claimSetId$ .
). /
{ 	
var #
securityContextClaimSet '
=( )
_securityContext* :
.: ;
	ClaimSets; D
. 
SingleOrDefault  
(  !
x! "
=># %
x& '
.' (

ClaimSetId( 2
==3 5

claimSetId6 @
)@ A
;A B
if 
( #
securityContextClaimSet '
!=( *
null+ /
)/ 0
{ 
return 
new 
ClaimSet #
{ 
Id 
= #
securityContextClaimSet 0
.0 1

ClaimSetId1 ;
,; <
Name   
=   #
securityContextClaimSet   2
.  2 3
ClaimSetName  3 ?
,  ? @

IsEditable!! 
=!!  
!!!! "
CloudOdsAdminApp!!" 2
.!!2 3
DefaultClaimSets!!3 C
.!!C D
Contains!!D L
(!!L M#
securityContextClaimSet!!M d
.!!d e
ClaimSetName!!e q
)!!q r
}"" 
;"" 
}## 
throw%% 
new%% 
AdminAppException%% '
(%%' (
$str%%( S
)%%S T
{&& 

StatusCode'' 
='' 
HttpStatusCode'' +
.''+ ,
NotFound'', 4
}(( 
;(( 
})) 	
}** 
}++ ª
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetClaimSetByIdQueryV6Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class )
GetClaimSetByIdQueryV6Service .
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public )
GetClaimSetByIdQueryV6Service ,
(, -
ISecurityContext- =
securityContext> M
)M N
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
ClaimSet 
Execute 
(  
int  #

claimSetId$ .
). /
{ 	
var #
securityContextClaimSet '
=( )
_securityContext* :
.: ;
	ClaimSets; D
. 
SingleOrDefault 
(  
x  !
=>" $
x% &
.& '

ClaimSetId' 1
==2 4

claimSetId5 ?
)? @
;@ A
if 
( #
securityContextClaimSet '
!=( *
null+ /
)/ 0
{ 
return 
new 
ClaimSet #
{ 
Id 
= #
securityContextClaimSet 0
.0 1

ClaimSetId1 ;
,; <
Name   
=   #
securityContextClaimSet   2
.  2 3
ClaimSetName  3 ?
,  ? @

IsEditable!! 
=!!  
!!!! "#
securityContextClaimSet!!" 9
.!!9 :!
ForApplicationUseOnly!!: O
&&!!P R
!!!S T#
securityContextClaimSet!!T k
.!!k l
IsEdfiPreset!!l x
&&!!y {
!"" 
CloudOdsAdminApp"" %
.""% &#
SystemReservedClaimSets""& =
.""= >
Contains""> F
(""F G#
securityContextClaimSet""G ^
.""^ _
ClaimSetName""_ k
)""k l
}## 
;## 
}$$ 
throw&& 
new&& 
AdminAppException&& '
(&&' (
$str&&( S
)&&S T
{'' 

StatusCode(( 
=(( 
HttpStatusCode(( +
.((+ ,
NotFound((, 4
})) 
;)) 
}** 	
}++ 
},, ¿
wC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetClaimSetsByApplicationNameQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{		 
public

 

class

 .
"GetClaimSetsByApplicationNameQuery

 3
:

4 5/
#IGetClaimSetsByApplicationNameQuery

6 Y
{ 
private 
readonly ,
 IOdsSecurityModelVersionResolver 9
	_resolver: C
;C D
private 
readonly 8
,GetClaimSetsByApplicationNameQueryV53Service E
_v53ServiceF Q
;Q R
private 
readonly 7
+GetClaimSetsByApplicationNameQueryV6Service D

_v6ServiceE O
;O P
public .
"GetClaimSetsByApplicationNameQuery 1
(1 2,
 IOdsSecurityModelVersionResolver2 R
resolverS [
,[ \8
,GetClaimSetsByApplicationNameQueryV53Service 8

v53Service9 C
,C D7
+GetClaimSetsByApplicationNameQueryV6Service 7
	v6Service8 A
)A B
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
IEnumerable 
< 
ClaimSet #
># $
Execute% ,
(, -
string- 3
applicationName4 C
)C D
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
return 
_v53Service "
." #
Execute# *
(* +
applicationName+ :
): ;
;; <
else 
if 
( 
securityModel "
==# %-
!EdFiOdsSecurityModelCompatibility& G
.G H
SixH K
)K L
return 

_v6Service !
.! "
Execute" )
() *
applicationName* 9
)9 :
;: ;
else   
throw!! 
new!! 6
*EdFiOdsSecurityModelCompatibilityException!! D
(!!D E
securityModel!!E R
)!!R S
;!!S T
}"" 	
}## 
public%% 

	interface%% /
#IGetClaimSetsByApplicationNameQuery%% 8
{&& 
IEnumerable'' 
<'' 
ClaimSet'' 
>'' 
Execute'' %
(''% &
string''& ,*
securityContextApplicationName''- K
)''K L
;''L M
}(( 
})) Æ,
ÅC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetClaimSetsByApplicationNameQueryV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 8
,GetClaimSetsByApplicationNameQueryV53Service =
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
public 8
,GetClaimSetsByApplicationNameQueryV53Service ;
(; <
ISecurityContext< L
securityContextM \
,\ ]
IUsersContext^ k
usersContextl x
)x y
{ 	
_securityContext 
= 
securityContext .
;. /
_usersContext 
= 
usersContext (
;( )
} 	
public 
IEnumerable 
< 
ClaimSet #
># $
Execute% ,
(, -
string- 3
applicationName4 C
)C D
{ 	
var 
	claimSets 
= )
GetClaimSetsByApplicationName 9
(9 :
applicationName: I
)I J
;J K*
SetApplicationCountPerClaimSet *
(* +
	claimSets+ 4
)4 5
;5 6
return 
	claimSets 
; 
} 	
private!! 
ClaimSet!! 
[!! 
]!! )
GetClaimSetsByApplicationName!! 8
(!!8 9
string!!9 ?
applicationName!!@ O
)!!O P
{"" 	
return## 
_securityContext## #
.### $
	ClaimSets##$ -
.$$ 
Where$$ 
($$ 
x$$ 
=>$$ 
!$$ 
CloudOdsAdminApp$$ -
.$$- .#
SystemReservedClaimSets$$. E
.$$E F
Contains$$F N
($$N O
x$$O P
.$$P Q
ClaimSetName$$Q ]
)$$] ^
)$$^ _
.%% 
Where%% 
(%% 
x%% 
=>%% 
x%% 
.%% 
Application%% )
.%%) *
ApplicationName%%* 9
==%%: <
applicationName%%= L
)%%L M
.&& 
OrderBy&& 
(&& 
x&& 
=>&& 
x&& 
.&&  
ClaimSetName&&  ,
)&&, -
.'' 
Select'' 
('' 
x'' 
=>'' 
new''  
ClaimSet''! )
{(( 
Id)) 
=)) 
x)) 
.)) 

ClaimSetId)) %
,))% &
Name** 
=** 
x** 
.** 
ClaimSetName** )
}++ 
)++ 
.++ 
ToArray++ 
(++ 
)++ 
;++ 
},, 	
private.. 
void.. *
SetApplicationCountPerClaimSet.. 3
(..3 4
ClaimSet..4 <
[..< =
]..= >
	claimSets..? H
)..H I
{// 	
var00 
claimSetsNames00 
=00  
	claimSets00! *
.00* +
Select00+ 1
(001 2
x002 3
=>004 6
x007 8
.008 9
Name009 =
)00= >
;00> ?
var22 
applicationsCounts22 "
=22# $
_usersContext22% 2
.222 3
Applications223 ?
.33 
Where33 
(33 
x33 
=>33 
claimSetsNames33 *
.33* +
Contains33+ 3
(333 4
x334 5
.335 6
ClaimSetName336 B
)33B C
)33C D
.44 
GroupBy44 
(44 
x44 
=>44 
x44 
.44  
ClaimSetName44  ,
)44, -
.55 
Select55 
(55 
x55 
=>55 
new55  
{66 
ClaimSetName77  
=77! "
x77# $
.77$ %
Key77% (
,77( )
ApplicationsCount88 %
=88& '
x88( )
.88) *
Count88* /
(88/ 0
)880 1
}99 
)99 
.:: 
ToList:: 
(:: 
):: 
;:: 
foreach<< 
(<< 
var<< 
claimSet<< !
in<<" $
	claimSets<<% .
)<<. /
{== 
var>> 
applicationsCount>> %
=>>& '
applicationsCounts>>( :
.?? 
SingleOrDefault?? $
(??$ %
x??% &
=>??' )
x??* +
.??+ ,
ClaimSetName??, 8
==??9 ;
claimSet??< D
.??D E
Name??E I
)??I J
?@@ 
.@@ 
ApplicationsCount@@ '
;@@' (
claimSetAA 
.AA 

IsEditableAA #
=AA$ %
!AA& '
CloudOdsAdminAppAA' 7
.AA7 8
DefaultClaimSetsAA8 H
.AAH I
ContainsAAI Q
(AAQ R
claimSetAAR Z
.AAZ [
NameAA[ _
)AA_ `
;AA` a
claimSetBB 
.BB 
ApplicationsCountBB *
=BB+ ,
applicationsCountBB- >
.BB> ?
GetValueOrDefaultBB? P
(BBP Q
)BBQ R
;BBR S
}CC 
}DD 	
}EE 
}FF Ÿ+
ÄC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetClaimSetsByApplicationNameQueryV6Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 7
+GetClaimSetsByApplicationNameQueryV6Service <
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
public 7
+GetClaimSetsByApplicationNameQueryV6Service :
(: ;
ISecurityContext; K
securityContextL [
,[ \
IUsersContext] j
usersContextk w
)w x
{ 	
_securityContext 
= 
securityContext .
;. /
_usersContext 
= 
usersContext (
;( )
} 	
public 
IEnumerable 
< 
ClaimSet #
># $
Execute% ,
(, -
string- 3
applicationName4 C
)C D
{ 	
var 
	claimSets 
= )
GetClaimSetsByApplicationName 9
(9 :
applicationName: I
)I J
;J K*
SetApplicationCountPerClaimSet *
(* +
	claimSets+ 4
)4 5
;5 6
return 
	claimSets 
; 
} 	
private!! 
ClaimSet!! 
[!! 
]!! )
GetClaimSetsByApplicationName!! 8
(!!8 9
string!!9 ?
applicationName!!@ O
)!!O P
{"" 	
return## 
_securityContext## #
.### $
	ClaimSets##$ -
.$$ 
Where$$ 
($$ 
x$$ 
=>$$ 
!$$ 
x$$ 
.$$ !
ForApplicationUseOnly$$ 2
&&$$3 5
!$$6 7
CloudOdsAdminApp$$7 G
.$$G H#
SystemReservedClaimSets$$H _
.$$_ `
Contains$$` h
($$h i
x$$i j
.$$j k
ClaimSetName$$k w
)$$w x
)$$x y
.%% 
Where%% 
(%% 
x%% 
=>%% 
x%% 
.%% 
Application%% '
.%%' (
ApplicationName%%( 7
==%%8 :
applicationName%%; J
)%%J K
.&& 
OrderBy&& 
(&& 
x&& 
=>&& 
x&& 
.&& 
ClaimSetName&& *
)&&* +
.'' 
Select'' 
('' 
x'' 
=>'' 
new'' 
ClaimSet'' '
{(( 
Id)) 
=)) 
x)) 
.)) 

ClaimSetId)) #
,))# $
Name** 
=** 
x** 
.** 
ClaimSetName** '
,**' (

IsEditable++ 
=++ 
!++  
x++  !
.++! "
IsEdfiPreset++" .
},, 
),, 
.,, 
ToArray,, 
(,, 
),, 
;,, 
}-- 	
private// 
void// *
SetApplicationCountPerClaimSet// 3
(//3 4
ClaimSet//4 <
[//< =
]//= >
	claimSets//? H
)//H I
{00 	
var11 
claimSetsNames11 
=11  
	claimSets11! *
.11* +
Select11+ 1
(111 2
x112 3
=>114 6
x117 8
.118 9
Name119 =
)11= >
;11> ?
var33 
applicationsCounts33 "
=33# $
_usersContext33% 2
.332 3
Applications333 ?
.44 
Where44 
(44 
x44 
=>44 
claimSetsNames44 *
.44* +
Contains44+ 3
(443 4
x444 5
.445 6
ClaimSetName446 B
)44B C
)44C D
.55 
GroupBy55 
(55 
x55 
=>55 
x55 
.55  
ClaimSetName55  ,
)55, -
.66 
Select66 
(66 
x66 
=>66 
new66  
{77 
ClaimSetName88  
=88! "
x88# $
.88$ %
Key88% (
,88( )
ApplicationsCount99 %
=99& '
x99( )
.99) *
Count99* /
(99/ 0
)990 1
}:: 
):: 
.;; 
ToList;; 
(;; 
);; 
;;; 
foreach== 
(== 
var== 
claimSet== !
in==" $
	claimSets==% .
)==. /
{>> 
var?? 
applicationsCount?? %
=??& '
applicationsCounts??( :
.@@ 
SingleOrDefault@@ $
(@@$ %
x@@% &
=>@@' )
x@@* +
.@@+ ,
ClaimSetName@@, 8
==@@9 ;
claimSet@@< D
.@@D E
Name@@E I
)@@I J
?AA 
.AA 
ApplicationsCountAA '
;AA' (
claimSetBB 
.BB 
ApplicationsCountBB *
=BB+ ,
applicationsCountBB- >
.BB> ?
GetValueOrDefaultBB? P
(BBP Q
)BBQ R
;BBR S
}CC 
}DD 	
}EE 
}FF Í0
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetResourcesByClaimSetIdQuery.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ClaimSetEditor		' 5
{

 
public 

class )
GetResourcesByClaimSetIdQuery .
:/ 0*
IGetResourcesByClaimSetIdQuery1 O
{ 
private 
readonly ,
 IOdsSecurityModelVersionResolver 9
	_resolver: C
;C D
private 
readonly 3
'GetResourcesByClaimSetIdQueryV53Service @
_v53ServiceA L
;L M
private 
readonly 2
&GetResourcesByClaimSetIdQueryV6Service ?

_v6Service@ J
;J K
public )
GetResourcesByClaimSetIdQuery ,
(, -,
 IOdsSecurityModelVersionResolver- M
resolverN V
,V W3
'GetResourcesByClaimSetIdQueryV53Service 3

v53Service4 >
,> ?2
&GetResourcesByClaimSetIdQueryV6Service 2
	v6Service3 <
)< =
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
IEnumerable 
< 
ResourceClaim (
>( )
AllResources* 6
(6 7
int7 :

claimSetId; E
)E F
{ 	
List 
< 
ResourceClaim 
> 
parentResources  /
;/ 0
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
{ 
parentResources   
=    !
_v53Service  " -
.  - .
GetParentResources  . @
(  @ A

claimSetId  A K
)  K L
;  L M
var!! 
childResources!! "
=!!# $
_v53Service!!% 0
.!!0 1
GetChildResources!!1 B
(!!B C

claimSetId!!C M
)!!M N
;!!N O
_v53Service"" 
."" &
AddChildResourcesToParents"" 6
(""6 7
childResources""7 E
,""E F
parentResources""G V
)""V W
;""W X
}## 
else$$ 
if$$ 
($$ 
securityModel$$ "
==$$# %-
!EdFiOdsSecurityModelCompatibility$$& G
.$$G H
Six$$H K
)$$K L
{%% 
parentResources&& 
=&&  !

_v6Service&&" ,
.&&, -
GetParentResources&&- ?
(&&? @

claimSetId&&@ J
)&&J K
;&&K L
var'' 
childResources'' "
=''# $

_v6Service''% /
.''/ 0
GetChildResources''0 A
(''A B

claimSetId''B L
)''L M
;''M N

_v6Service(( 
.(( &
AddChildResourcesToParents(( 5
(((5 6
childResources((6 D
,((D E
parentResources((F U
)((U V
;((V W
})) 
else** 
throw++ 
new++ 6
*EdFiOdsSecurityModelCompatibilityException++ D
(++D E
securityModel++E R
)++R S
;++S T
return-- 
parentResources-- "
;--" #
}.. 	
public00 
ResourceClaim00 
SingleResource00 +
(00+ ,
int00, /

claimSetId000 :
,00: ;
int00< ?
resourceClaimId00@ O
)00O P
{11 	
var22 
parentResources22 
=22  !
AllResources22" .
(22. /

claimSetId22/ 9
)229 :
.22: ;
ToList22; A
(22A B
)22B C
;22C D
var33 
parentResourceClaim33 #
=33$ %
parentResources33& 5
.44 
SingleOrDefault44  
(44  !
x44! "
=>44# %
x44& '
.44' (
Id44( *
==44+ -
resourceClaimId44. =
)44= >
;44> ?
var55 
childResources55 
=55  
new55! $
List55% )
<55) *
ResourceClaim55* 7
>557 8
(558 9
)559 :
;55: ;
if66 
(66 
parentResourceClaim66 #
==66$ &
null66' +
)66+ ,
{77 
foreach88 
(88 
var88 
resourceClaims88 +
in88, .
parentResources88/ >
.88> ?
Select88? E
(88E F
x88F G
=>88H J
x88K L
.88L M
Children88M U
)88U V
)88V W
childResources88X f
.88f g
AddRange88g o
(88o p
resourceClaims88p ~
)88~ 
;	88 Ä
return99 
childResources99 %
.99% &
SingleOrDefault99& 5
(995 6
x996 7
=>998 :
x99; <
.99< =
Id99= ?
==99@ B
resourceClaimId99C R
)99R S
;99S T
}:: 
return<< 
parentResourceClaim<< &
;<<& '
}== 	
}>> 
public@@ 

	interface@@ *
IGetResourcesByClaimSetIdQuery@@ 3
{AA 
IEnumerableBB 
<BB 
ResourceClaimBB !
>BB! "
AllResourcesBB# /
(BB/ 0
intBB0 3%
securityContextClaimSetIdBB4 M
)BBM N
;BBN O
ResourceClaimCC 
SingleResourceCC $
(CC$ %
intCC% (

claimSetIdCC) 3
,CC3 4
intCC5 8
resourceClaimIdCC9 H
)CCH I
;CCI J
}DD 
}EE ∏ä
|C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetResourcesByClaimSetIdQueryV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 3
'GetResourcesByClaimSetIdQueryV53Service 8
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
private 
readonly 
IMapper  
_mapper! (
;( )
public 3
'GetResourcesByClaimSetIdQueryV53Service 6
(6 7
ISecurityContext7 G
securityContextH W
,W X
IMapperY `
mappera g
)g h
{ 	
_securityContext 
= 
securityContext .
;. /
_mapper 
= 
mapper 
; 
} 	
internal 
void &
AddChildResourcesToParents 0
(0 1
IEnumerable1 <
<< =
ResourceClaim= J
>J K
childResourcesL Z
,Z [
List\ `
<` a
ResourceClaima n
>n o
parentResourcesp 
)	 Ä
{ 	
foreach   
(   
var   
childResource   &
in  ' )
childResources  * 8
)  8 9
{!! 
var"" 
parentResource"" "
=""# $
parentResources""% 4
.""4 5
SingleOrDefault""5 D
(""D E
x""E F
=>""G I
x""J K
.""K L
Id""L N
==""O Q
childResource""R _
.""_ `
ParentId""` h
)""h i
;""i j
if## 
(## 
parentResource## "
!=### %
null##& *
)##* +
parentResource$$ "
.$$" #
Children$$# +
.$$+ ,
Add$$, /
($$/ 0
childResource$$0 =
)$$= >
;$$> ?
else%% 
{&& 
parentResources'' #
.''# $
Add''$ '
(''' (
childResource''( 5
)''5 6
;''6 7
}(( 
})) 
}** 	
internal,, 
List,, 
<,, 
ResourceClaim,, #
>,,# $
GetParentResources,,% 7
(,,7 8
int,,8 ;

claimSetId,,< F
),,F G
{-- 	
var.. 
dbParentResources.. !
=.." #
_securityContext..$ 4
...4 5"
ClaimSetResourceClaims..5 K
.// 
Include// 
(// 
x// 
=>// 
x// 
.//  
ResourceClaim//  -
)//- .
.00 
Include00 
(00 
x00 
=>00 
x00 
.00  
ResourceClaim00  -
.00- .
ParentResourceClaim00. A
)00A B
.11 
Include11 
(11 
x11 
=>11 
x11 
.11  
Action11  &
)11& '
.22 
Include22 
(22 
x22 
=>22 
x22 
.22  )
AuthorizationStrategyOverride22  =
)22= >
.33 
Where33 
(33 
x33 
=>33 
x33 
.33 
ClaimSet33 &
.33& '

ClaimSetId33' 1
==332 4

claimSetId335 ?
&&44 
x44  
.44  !
ResourceClaim44! .
.44. /!
ParentResourceClaimId44/ D
==44E G
null44H L
)44L M
.44M N
ToList44N T
(44T U
)44U V
;44V W
var66 !
defaultAuthStrategies66 %
=66& '$
GetDefaultAuthStrategies66( @
(66@ A
dbParentResources66A R
.66R S
Select66S Y
(66Y Z
x66Z [
=>66\ ^
x66_ `
.66` a
ResourceClaim66a n
)66n o
.66o p
ToList66p v
(66v w
)66w x
)66x y
;66y z
var77 !
authStrategyOverrides77 %
=77& '$
GetAuthStrategyOverrides77( @
(77@ A
dbParentResources77A R
.77R S
ToList77S Y
(77Y Z
)77Z [
)77[ \
;77\ ]
var99 
parentResources99 
=99  !
dbParentResources99" 3
.993 4
GroupBy994 ;
(99; <
x99< =
=>99> @
x99A B
.99B C
ResourceClaim99C P
)99P Q
.99Q R
Select99R X
(99X Y
x99Y Z
=>99[ ]
new99^ a
ResourceClaim99b o
{:: 
Id;; 
=;; 
x;; 
.;; 
Key;; 
.;; 
ResourceClaimId;; .
,;;. /
Name<< 
=<< 
x<< 
.<< 
Key<<  
.<<  !
ResourceName<<! -
,<<- .
Create== 
=== 
x== 
.== 
Any== "
(==" #
a==# $
=>==% '
a==( )
.==) *
Action==* 0
.==0 1

ActionName==1 ;
====< >
Action==? E
.==E F
Create==F L
.==L M
Value==M R
)==R S
,==S T
Read>> 
=>> 
x>> 
.>> 
Any>>  
(>>  !
a>>! "
=>>># %
a>>& '
.>>' (
Action>>( .
.>>. /

ActionName>>/ 9
==>>: <
Action>>= C
.>>C D
Read>>D H
.>>H I
Value>>I N
)>>N O
,>>O P
Update?? 
=?? 
x?? 
.?? 
Any?? "
(??" #
a??# $
=>??% '
a??( )
.??) *
Action??* 0
.??0 1

ActionName??1 ;
==??< >
Action??? E
.??E F
Update??F L
.??L M
Value??M R
)??R S
,??S T
Delete@@ 
=@@ 
x@@ 
.@@ 
Any@@ "
(@@" #
a@@# $
=>@@% '
a@@( )
.@@) *
Action@@* 0
.@@0 1

ActionName@@1 ;
==@@< >
Action@@? E
.@@E F
Delete@@F L
.@@L M
Value@@M R
)@@R S
,@@S T
IsParentAA 
=AA 
trueAA #
,AA# $(
DefaultAuthStrategiesForCRUDBB 0
=BB1 2!
defaultAuthStrategiesBB3 H
[BBH I
xBBI J
.BBJ K
KeyBBK N
.BBN O
ResourceClaimIdBBO ^
]BB^ _
,BB_ `(
AuthStrategyOverridesForCRUDCC 0
=CC1 2!
authStrategyOverridesCC3 H
[CCH I
xCCI J
.CCJ K
KeyCCK N
.CCN O
ResourceClaimIdCCO ^
]CC^ _
.CC_ `
ToArrayCC` g
(CCg h
)CCh i
}DD 
)DD 
.EE 
ToListEE 
(EE 
)EE 
;EE 
parentResourcesGG 
.GG 
ForEachGG #
(GG# $
xGG$ %
=>GG& (
xGG) *
.GG* +
ChildrenGG+ 3
=GG4 5
newGG6 9
ListGG: >
<GG> ?
ResourceClaimGG? L
>GGL M
(GGM N
)GGN O
)GGO P
;GGP Q
returnHH 
parentResourcesHH "
;HH" #
}II 	
privateKK 

DictionaryKK 
<KK 
intKK 
,KK !
AuthorizationStrategyKK  5
[KK5 6
]KK6 7
>KK7 8$
GetDefaultAuthStrategiesKK9 Q
(KKQ R
IReadOnlyCollectionKKR e
<KKe f!
SecurityResourceClaimKKf {
>KK{ |
resourceClaims	KK} ã
)
KKã å
{LL 	
varMM 
resultDictionaryMM  
=MM! "
newMM# &

DictionaryMM' 1
<MM1 2
intMM2 5
,MM5 6!
AuthorizationStrategyMM7 L
[MML M
]MMM N
>MMN O
(MMO P
)MMP Q
;MMQ R
varOO !
defaultAuthStrategiesOO %
=OO& '
_securityContextOO( 8
.OO8 9/
#ResourceClaimAuthorizationMetadatasOO9 \
.PP 
IncludePP 
(PP 
xPP 
=>PP 
xPP 
.PP  
ResourceClaimPP  -
)PP- .
.PP. /
IncludePP/ 6
(PP6 7
xPP7 8
=>PP9 ;
xPP< =
.PP= >
ActionPP> D
)PPD E
.PPE F
IncludePPF M
(PPM N
xPPN O
=>PPP R
xPPS T
.PPT U!
AuthorizationStrategyPPU j
)PPj k
.PPk l
ToListPPl r
(PPr s
)PPs t
;PPt u
varRR +
defaultAuthStrategiesForParentsRR /
=RR0 1!
defaultAuthStrategiesRR2 G
.SS 
WhereSS 
(SS 
xSS 
=>SS 
xSS 
.SS 
ResourceClaimSS +
.SS+ ,!
ParentResourceClaimIdSS, A
==SSB D
nullSSE I
)SSI J
.SSJ K
ToListSSK Q
(SSQ R
)SSR S
;SSS T
varUU ,
 defaultAuthStrategiesForChildrenUU 0
=UU1 2!
defaultAuthStrategiesUU3 H
.VV 
WhereVV 
(VV 
xVV 
=>VV 
xVV 
.VV 
ResourceClaimVV +
.VV+ ,!
ParentResourceClaimIdVV, A
!=VVB D
nullVVE I
)VVI J
.VVJ K
ToListVVK Q
(VVQ R
)VVR S
;VVS T
foreachXX 
(XX 
varXX 
resourceClaimXX &
inXX( *
resourceClaimsXX+ 9
)XX9 :
{YY 
varZZ 
actionsZZ 
=ZZ 
newZZ !
ListZZ" &
<ZZ& '!
AuthorizationStrategyZZ' <
>ZZ< =
(ZZ= >
)ZZ> ?
;ZZ? @
if[[ 
([[ 
resourceClaim[[ !
.[[! "!
ParentResourceClaimId[[" 7
==[[8 :
null[[; ?
)[[? @
{\\ 
var]] !
createDefaultStrategy]] -
=]]. /+
defaultAuthStrategiesForParents]]1 P
.]]P Q
SingleOrDefault]]Q `
(]]` a
x]]a b
=>]]c e
x^^ 
.^^ 
ResourceClaim^^ +
.^^+ ,
ResourceClaimId^^, ;
==^^< >
resourceClaim^^? L
.^^L M
ResourceClaimId^^M \
&&^^] _
x__ 
.__ 
Action__ $
.__$ %

ActionName__% /
==__0 2
Action__3 9
.__9 :
Create__: @
.__@ A
Value__A F
)__F G
?__G H
.__H I!
AuthorizationStrategy__I ^
;__^ _
actions`` 
.`` 
Add`` 
(``  
_mapper``  '
.``' (
Map``( +
<``+ ,!
AuthorizationStrategy``, A
>``A B
(``B C!
createDefaultStrategy``C X
)``X Y
)``Y Z
;``Z [
varaa 
readDefaultStrategyaa +
=aa, -+
defaultAuthStrategiesForParentsaa. M
.aaM N
SingleOrDefaultaaN ]
(aa] ^
xaa^ _
=>aa` b
xbb  !
.bb! "
ResourceClaimbb" /
.bb/ 0
ResourceClaimIdbb0 ?
==bb@ B
resourceClaimbbC P
.bbP Q
ResourceClaimIdbbQ `
&&bba c
xcc  !
.cc! "
Actioncc" (
.cc( )

ActionNamecc) 3
==cc4 6
Actioncc7 =
.cc= >
Readcc> B
.ccB C
ValueccC H
)ccH I
?ccI J
.ccJ K!
AuthorizationStrategyccK `
;cc` a
actionsdd 
.dd 
Adddd 
(dd  
_mapperdd  '
.dd' (
Mapdd( +
<dd+ ,!
AuthorizationStrategydd, A
>ddA B
(ddB C
readDefaultStrategyddC V
)ddV W
)ddW X
;ddX Y
varee !
updateDefaultStrategyee -
=ee. /+
defaultAuthStrategiesForParentsee0 O
.ff 
SingleOrDefaultff ,
(ff, -
xff- .
=>ff/ 1
xgg  !
.gg! "
ResourceClaimgg" /
.gg/ 0
ResourceClaimIdgg0 ?
==gg@ B
resourceClaimggC P
.ggP Q
ResourceClaimIdggQ `
&&gga c
xhh  !
.hh! "
Actionhh" (
.hh( )

ActionNamehh) 3
==hh4 6
Actionhh7 =
.hh= >
Updatehh> D
.hhD E
ValuehhE J
)hhJ K
?hhK L
.hhL M!
AuthorizationStrategyhhM b
;hhb c
actionsii 
.ii 
Addii 
(ii  
_mapperii  '
.ii' (
Mapii( +
<ii+ ,!
AuthorizationStrategyii, A
>iiA B
(iiB C!
updateDefaultStrategyiiC X
)iiX Y
)iiY Z
;iiZ [
varjj !
deleteDefaultStrategyjj -
=jj. /+
defaultAuthStrategiesForParentsjj0 O
.kk 
SingleOrDefaultkk ,
(kk, -
xkk- .
=>kk/ 1
xll  !
.ll! "
ResourceClaimll" /
.ll/ 0
ResourceClaimIdll0 ?
==ll@ B
resourceClaimllC P
.llP Q
ResourceClaimIdllQ `
&&lla c
xmm  !
.mm! "
Actionmm" (
.mm( )

ActionNamemm) 3
==mm4 6
Actionmm7 =
.mm= >
Deletemm> D
.mmD E
ValuemmE J
)mmJ K
?mmK L
.mmL M!
AuthorizationStrategymmM b
;mmb c
actionsnn 
.nn 
Addnn 
(nn  
_mappernn  '
.nn' (
Mapnn( +
<nn+ ,!
AuthorizationStrategynn, A
>nnA B
(nnB C!
deleteDefaultStrategynnC X
)nnX Y
)nnY Z
;nnZ [
}oo 
elsepp 
{qq 
varrr !
createDefaultStrategyrr -
=rr. /,
 defaultAuthStrategiesForChildrenrr0 P
.rrP Q
SingleOrDefaultrrQ `
(rr` a
xrra b
=>rrc e
xss 
.ss 
ResourceClaimss '
.ss' (
ResourceClaimIdss( 7
==ss8 :
resourceClaimss; H
.ssH I
ResourceClaimIdssI X
&&ssY [
xtt 
.tt 
Actiontt  
.tt  !

ActionNamett! +
==tt, .
Actiontt/ 5
.tt5 6
Creatett6 <
.tt< =
Valuett= B
)ttB C
?ttC D
.ttD E!
AuthorizationStrategyttE Z
;ttZ [
actionsuu 
=uu &
AddStrategyToChildResourceuu 8
(uu8 9!
createDefaultStrategyuu9 N
,uuN O
ActionuuP V
.uuV W
CreateuuW ]
)uu] ^
;uu^ _
varww 
readDefaultStrategyww +
=ww, -,
 defaultAuthStrategiesForChildrenww. N
.wwN O
SingleOrDefaultwwO ^
(ww^ _
xww_ `
=>wwa c
xxx 
.xx 
ResourceClaimxx '
.xx' (
ResourceClaimIdxx( 7
==xx8 :
resourceClaimxx; H
.xxH I
ResourceClaimIdxxI X
&&xxY [
xyy 
.yy 
Actionyy  
.yy  !

ActionNameyy! +
==yy, .
Actionyy/ 5
.yy5 6
Readyy6 :
.yy: ;
Valueyy; @
)yy@ A
?yyA B
.yyB C!
AuthorizationStrategyyyC X
;yyX Y
actionszz 
=zz &
AddStrategyToChildResourcezz 8
(zz8 9
readDefaultStrategyzz9 L
,zzL M
ActionzzN T
.zzT U
ReadzzU Y
)zzY Z
;zzZ [
var|| !
updateDefaultStrategy|| -
=||. /,
 defaultAuthStrategiesForChildren||0 P
.||P Q
SingleOrDefault||Q `
(||` a
x||a b
=>||c e
x}} 
.}} 
ResourceClaim}} '
.}}' (
ResourceClaimId}}( 7
==}}8 :
resourceClaim}}; H
.}}H I
ResourceClaimId}}I X
&&}}Y [
x~~ 
.~~ 
Action~~  
.~~  !

ActionName~~! +
==~~, .
Action~~/ 5
.~~5 6
Update~~6 <
.~~< =
Value~~= B
)~~B C
?~~C D
.~~D E!
AuthorizationStrategy~~E Z
;~~Z [
actions 
= &
AddStrategyToChildResource 8
(8 9!
updateDefaultStrategy9 N
,N O
ActionP V
.V W
UpdateW ]
)] ^
;^ _
var
ÅÅ #
deleteDefaultStrategy
ÅÅ -
=
ÅÅ. /.
 defaultAuthStrategiesForChildren
ÅÅ0 P
.
ÅÅP Q
SingleOrDefault
ÅÅQ `
(
ÅÅ` a
x
ÅÅa b
=>
ÅÅc e
x
ÇÇ 
.
ÇÇ 
ResourceClaim
ÇÇ '
.
ÇÇ' (
ResourceClaimId
ÇÇ( 7
==
ÇÇ8 :
resourceClaim
ÇÇ; H
.
ÇÇH I
ResourceClaimId
ÇÇI X
&&
ÇÇY [
x
ÉÉ 
.
ÉÉ 
Action
ÉÉ  
.
ÉÉ  !

ActionName
ÉÉ! +
==
ÉÉ, .
Action
ÉÉ/ 5
.
ÉÉ5 6
Delete
ÉÉ6 <
.
ÉÉ< =
Value
ÉÉ= B
)
ÉÉB C
?
ÉÉC D
.
ÉÉD E#
AuthorizationStrategy
ÉÉE Z
;
ÉÉZ [
actions
ÑÑ 
=
ÑÑ (
AddStrategyToChildResource
ÑÑ 8
(
ÑÑ8 9#
deleteDefaultStrategy
ÑÑ9 N
,
ÑÑN O
Action
ÑÑP V
.
ÑÑV W
Delete
ÑÑW ]
)
ÑÑ] ^
;
ÑÑ^ _
List
ÜÜ 
<
ÜÜ #
AuthorizationStrategy
ÜÜ .
>
ÜÜ. /(
AddStrategyToChildResource
ÜÜ0 J
(
ÜÜJ K+
SecurityAuthorizationStrategy
ÜÜK h
defaultStrategy
ÜÜi x
,
ÜÜx y
ActionÜÜz Ä
actionÜÜÅ á
)ÜÜá à
{
áá 
if
àà 
(
àà 
defaultStrategy
àà +
==
àà, .
null
àà/ 3
)
àà3 4
{
ââ 
defaultStrategy
ää +
=
ää, --
defaultAuthStrategiesForParents
ää. M
.
ääM N
SingleOrDefault
ääN ]
(
ää] ^
x
ää^ _
=>
ää` b
x
ãã  !
.
ãã! "
ResourceClaim
ãã" /
.
ãã/ 0
ResourceClaimId
ãã0 ?
==
ãã@ B
resourceClaim
ããC P
.
ããP Q#
ParentResourceClaimId
ããQ f
&&
ããg i
x
åå  !
.
åå! "
Action
åå" (
.
åå( )

ActionName
åå) 3
==
åå4 6
action
åå7 =
.
åå= >
Value
åå> C
)
ååC D
?
ååD E
.
ååE F#
AuthorizationStrategy
ååF [
;
åå[ \
var
çç 
mappedStrategy
çç  .
=
çç/ 0
_mapper
çç1 8
.
çç8 9
Map
çç9 <
<
çç< =#
AuthorizationStrategy
çç= R
>
ççR S
(
ççS T
defaultStrategy
ççT c
)
ççc d
;
ççd e
if
éé 
(
éé  
mappedStrategy
éé  .
!=
éé/ 1
null
éé2 6
)
éé6 7
mappedStrategy
éé8 F
.
ééF G#
IsInheritedFromParent
ééG \
=
éé] ^
true
éé_ c
;
ééc d
actions
èè #
.
èè# $
Add
èè$ '
(
èè' (
mappedStrategy
èè( 6
)
èè6 7
;
èè7 8
}
êê 
else
ëë 
{
íí 
actions
ìì #
.
ìì# $
Add
ìì$ '
(
ìì' (
_mapper
ìì( /
.
ìì/ 0
Map
ìì0 3
<
ìì3 4#
AuthorizationStrategy
ìì4 I
>
ììI J
(
ììJ K
defaultStrategy
ììK Z
)
ììZ [
)
ìì[ \
;
ìì\ ]
}
îî 
return
ññ 
actions
ññ &
;
ññ& '
}
óó 
}
òò 
resultDictionary
öö  
[
öö  !
resourceClaim
öö! .
.
öö. /
ResourceClaimId
öö/ >
]
öö> ?
=
öö@ A
actions
ööB I
.
ööI J
ToArray
ööJ Q
(
ööQ R
)
ööR S
;
ööS T
}
õõ 
return
ùù 
resultDictionary
ùù #
;
ùù# $
}
ûû 	
internal
†† 

Dictionary
†† 
<
†† 
int
†† 
,
††  #
AuthorizationStrategy
††! 6
[
††6 7
]
††7 8
>
††8 9&
GetAuthStrategyOverrides
††: R
(
††R S
List
††S W
<
††W X#
ClaimSetResourceClaim
††X m
>
††m n
resourceClaims
††o }
)
††} ~
{
°° 	
var
¢¢ 
resultDictionary
¢¢  
=
¢¢! "
new
¢¢# &

Dictionary
¢¢' 1
<
¢¢1 2
int
¢¢2 5
,
¢¢5 6#
AuthorizationStrategy
¢¢7 L
[
¢¢L M
]
¢¢M N
>
¢¢N O
(
¢¢O P
)
¢¢P Q
;
¢¢Q R
resourceClaims
££ 
=
££ 
new
§§ 
List
§§ 
<
§§ #
ClaimSetResourceClaim
§§ .
>
§§. /
(
§§/ 0
resourceClaims
§§0 >
.
§§> ?
OrderBy
§§? F
(
§§F G
i
§§G H
=>
§§I K
new
§§L O
List
§§P T
<
§§T U
string
§§U [
>
§§[ \
{
§§] ^
Action
§§^ d
.
§§d e
Create
§§e k
.
§§k l
Value
§§l q
,
§§q r
Action
§§s y
.
§§y z
Read
§§z ~
.
§§~ 
Value§§ Ñ
,§§Ñ Ö
Action§§Ü å
.§§å ç
Update§§ç ì
.§§ì î
Value§§î ô
,§§ô ö
Action§§õ °
.§§° ¢
Delete§§¢ ®
.§§® ©
Value§§© Æ
}§§Æ Ø
.§§Ø ∞
IndexOf§§∞ ∑
(§§∑ ∏
i§§∏ π
.§§π ∫
Action§§∫ ¿
.§§¿ ¡

ActionName§§¡ À
)§§À Ã
)§§Ã Õ
)§§Õ Œ
;§§Œ œ
foreach
•• 
(
•• 
var
•• 
resourceClaim
•• &
in
••' )
resourceClaims
••* 8
)
••8 9
{
¶¶ #
AuthorizationStrategy
ßß %
authStrategy
ßß& 2
=
ßß3 4
null
ßß5 9
;
ßß9 :
if
®® 
(
®® 
resourceClaim
®® !
.
®®! "
ResourceClaim
®®" /
.
®®/ 0!
ParentResourceClaim
®®0 C
==
®®D F
null
®®G K
)
®®K L
{
©© 
authStrategy
™™  
=
™™! "
_mapper
™™# *
.
™™* +
Map
™™+ .
<
™™. /#
AuthorizationStrategy
™™/ D
>
™™D E
(
™™E F
resourceClaim
™™F S
.
™™S T+
AuthorizationStrategyOverride
™™T q
)
™™q r
;
™™r s
}
´´ 
else
¨¨ 
{
≠≠ 
var
ÆÆ 
parentResources
ÆÆ '
=
ÆÆ( )
_securityContext
ÆÆ* :
.
ÆÆ: ;$
ClaimSetResourceClaims
ÆÆ; Q
.
ØØ 
Include
ØØ  
(
ØØ  !
x
ØØ! "
=>
ØØ# %
x
ØØ& '
.
ØØ' (
ResourceClaim
ØØ( 5
)
ØØ5 6
.
∞∞ 
Include
∞∞  
(
∞∞  !
x
∞∞! "
=>
∞∞# %
x
∞∞& '
.
∞∞' (
ClaimSet
∞∞( 0
)
∞∞0 1
.
±± 
Include
±±  
(
±±  !
x
±±! "
=>
±±# %
x
±±& '
.
±±' (
Action
±±( .
)
±±. /
.
≤≤ 
Include
≤≤  
(
≤≤  !
x
≤≤! "
=>
≤≤# %
x
≤≤& '
.
≤≤' (+
AuthorizationStrategyOverride
≤≤( E
)
≤≤E F
.
≤≤F G
ToList
≤≤G M
(
≤≤M N
)
≤≤N O
;
≤≤O P
var
≥≥ $
parentResourceOverride
≥≥ .
=
≥≥/ 0
parentResources
≥≥1 @
.
≥≥@ A
SingleOrDefault
≥≥A P
(
≥≥P Q
x
≥≥Q R
=>
≥≥S U
x
≥≥V W
.
≥≥W X
ResourceClaim
≥≥X e
.
≥≥e f
ResourceClaimId
≥≥f u
==
≥≥v x
resourceClaim≥≥y Ü
.≥≥Ü á
ResourceClaim≥≥á î
.≥≥î ï%
ParentResourceClaimId≥≥ï ™
&&
¥¥_ a
x
¥¥b c
.
¥¥c d
ClaimSet
¥¥d l
.
¥¥l m

ClaimSetId
¥¥m w
==
¥¥x z
resourceClaim¥¥{ à
.¥¥à â
ClaimSet¥¥â ë
.¥¥ë í

ClaimSetId¥¥í ú
&&
µµ_ a
x
µµb c
.
µµc d
Action
µµd j
.
µµj k
ActionId
µµk s
==
µµt v
resourceClaimµµw Ñ
.µµÑ Ö
ActionµµÖ ã
.µµã å
ActionIdµµå î
)µµî ï
;µµï ñ
if
∂∂ 
(
∂∂ $
parentResourceOverride
∂∂ .
?
∂∂. /
.
∂∂/ 0+
AuthorizationStrategyOverride
∂∂0 M
!=
∂∂N P
null
∂∂Q U
)
∂∂U V
{
∑∑ 
authStrategy
∏∏ $
=
∏∏% &
_mapper
ππ #
.
ππ# $
Map
ππ$ '
<
ππ' (#
AuthorizationStrategy
ππ( =
>
ππ= >
(
ππ> ?$
parentResourceOverride
ππ? U
.
ππU V+
AuthorizationStrategyOverride
ππV s
)
ππs t
;
ππt u
if
∫∫ 
(
∫∫ 
authStrategy
∫∫ (
!=
∫∫) +
null
∫∫, 0
)
∫∫0 1
{
ªª 
authStrategy
ºº (
.
ºº( )#
IsInheritedFromParent
ºº) >
=
ºº? @
true
ººA E
;
ººE F
}
ΩΩ 
}
ææ 
if
¿¿ 
(
¿¿ 
resourceClaim
¿¿ $
.
¿¿$ %+
AuthorizationStrategyOverride
¿¿% B
!=
¿¿C E
null
¿¿F J
)
¿¿J K
{
¡¡ 
authStrategy
¬¬ $
=
¬¬% &
_mapper
¬¬' .
.
¬¬. /
Map
¬¬/ 2
<
¬¬2 3#
AuthorizationStrategy
¬¬3 H
>
¬¬H I
(
¬¬I J
resourceClaim
¬¬J W
.
¬¬W X+
AuthorizationStrategyOverride
¬¬X u
)
¬¬u v
;
¬¬v w
}
√√ 
}
ƒƒ 
if
∆∆ 
(
∆∆ 
resultDictionary
∆∆ $
.
∆∆$ %
ContainsKey
∆∆% 0
(
∆∆0 1
resourceClaim
∆∆1 >
.
∆∆> ?
ResourceClaim
∆∆? L
.
∆∆L M
ResourceClaimId
∆∆M \
)
∆∆\ ]
)
∆∆] ^
{
«« 
resultDictionary
»» $
[
»»$ %
resourceClaim
»»% 2
.
»»2 3
ResourceClaim
»»3 @
.
»»@ A
ResourceClaimId
»»A P
]
»»P Q
.
»»Q R/
!AddAuthorizationStrategyOverrides
»»R s
(
»»s t
resourceClaim»»t Å
.»»Å Ç
Action»»Ç à
.»»à â

ActionName»»â ì
,»»ì î
authStrategy
…… $
)
……$ %
;
……% &
}
   
else
ÀÀ 
{
ÃÃ 
var
ÕÕ 
actions
ÕÕ 
=
ÕÕ  !
new
ÕÕ" %#
AuthorizationStrategy
ÕÕ& ;
[
ÕÕ; <
]
ÕÕ< =
{
ÕÕ= >
null
ÕÕ> B
,
ÕÕB C
null
ÕÕD H
,
ÕÕH I
null
ÕÕJ N
,
ÕÕN O
null
ÕÕP T
}
ÕÕT U
;
ÕÕU V
resultDictionary
ŒŒ $
[
ŒŒ$ %
resourceClaim
ŒŒ% 2
.
ŒŒ2 3
ResourceClaim
ŒŒ3 @
.
ŒŒ@ A
ResourceClaimId
ŒŒA P
]
ŒŒP Q
=
ŒŒR S
actions
ŒŒT [
.
ŒŒ[ \/
!AddAuthorizationStrategyOverrides
ŒŒ\ }
(
ŒŒ} ~
resourceClaimŒŒ~ ã
.ŒŒã å
ActionŒŒå í
.ŒŒí ì

ActionNameŒŒì ù
,ŒŒù û
authStrategyŒŒü ´
)ŒŒ´ ¨
;ŒŒ¨ ≠
}
œœ 
}
–– 
return
—— 
resultDictionary
—— #
;
——# $
}
““ 	
internal
‘‘ 
IEnumerable
‘‘ 
<
‘‘ 
ResourceClaim
‘‘ *
>
‘‘* +
GetChildResources
‘‘, =
(
‘‘= >
int
‘‘> A

claimSetId
‘‘B L
)
‘‘L M
{
’’ 	
var
÷÷ 
dbChildResources
÷÷  
=
÷÷! "
_securityContext
◊◊  
.
◊◊  !$
ClaimSetResourceClaims
◊◊! 7
.
ÿÿ 
Include
ÿÿ 
(
ÿÿ 
x
ÿÿ 
=>
ÿÿ 
x
ÿÿ 
.
ÿÿ  
ResourceClaim
ÿÿ  -
)
ÿÿ- .
.
ŸŸ 
Include
ŸŸ 
(
ŸŸ 
x
ŸŸ 
=>
ŸŸ 
x
ŸŸ 
.
ŸŸ  
Action
ŸŸ  &
)
ŸŸ& '
.
⁄⁄ 
Where
⁄⁄ 
(
⁄⁄ 
x
⁄⁄ 
=>
⁄⁄ 
x
⁄⁄ 
.
⁄⁄ 
ClaimSet
⁄⁄ &
.
⁄⁄& '

ClaimSetId
⁄⁄' 1
==
⁄⁄2 4

claimSetId
⁄⁄5 ?
&&
€€ 
x
€€  
.
€€  !
ResourceClaim
€€! .
.
€€. /#
ParentResourceClaimId
€€/ D
!=
€€E G
null
€€H L
)
€€L M
.
€€M N
ToList
€€N T
(
€€T U
)
€€U V
;
€€V W
var
‹‹ #
defaultAuthStrategies
‹‹ %
=
‹‹& '&
GetDefaultAuthStrategies
‹‹( @
(
‹‹@ A
dbChildResources
‹‹A Q
.
‹‹Q R
Select
‹‹R X
(
‹‹X Y
x
‹‹Y Z
=>
‹‹[ ]
x
‹‹^ _
.
‹‹_ `
ResourceClaim
‹‹` m
)
‹‹m n
.
‹‹n o
ToList
‹‹o u
(
‹‹u v
)
‹‹v w
)
‹‹w x
;
‹‹x y
var
›› #
authStrategyOverrides
›› %
=
››& '&
GetAuthStrategyOverrides
››( @
(
››@ A
dbChildResources
››A Q
.
››Q R
ToList
››R X
(
››X Y
)
››Y Z
)
››Z [
;
››[ \
var
ﬂﬂ 
childResources
ﬂﬂ 
=
ﬂﬂ  
dbChildResources
ﬂﬂ! 1
.
ﬂﬂ1 2
GroupBy
ﬂﬂ2 9
(
ﬂﬂ9 :
x
ﬂﬂ: ;
=>
ﬂﬂ< >
x
ﬂﬂ? @
.
ﬂﬂ@ A
ResourceClaim
ﬂﬂA N
)
ﬂﬂN O
.
‡‡ 
Select
‡‡ 
(
‡‡ 
x
‡‡ 
=>
‡‡ 
new
‡‡  
ResourceClaim
‡‡! .
{
·· 
Id
‚‚ 
=
‚‚ 
x
‚‚ 
.
‚‚ 
Key
‚‚ 
.
‚‚ 
ResourceClaimId
‚‚ .
,
‚‚. /
ParentId
„„ 
=
„„ 
x
„„  
.
„„  !
Key
„„! $
.
„„$ %#
ParentResourceClaimId
„„% :
.
„„: ;
Value
„„; @
,
„„@ A
Name
‰‰ 
=
‰‰ 
x
‰‰ 
.
‰‰ 
Key
‰‰  
.
‰‰  !
ResourceName
‰‰! -
,
‰‰- .
Create
ÂÂ 
=
ÂÂ 
x
ÂÂ 
.
ÂÂ 
Any
ÂÂ "
(
ÂÂ" #
a
ÂÂ# $
=>
ÂÂ% '
a
ÂÂ( )
.
ÂÂ) *
Action
ÂÂ* 0
.
ÂÂ0 1

ActionName
ÂÂ1 ;
==
ÂÂ< >
Action
ÂÂ? E
.
ÂÂE F
Create
ÂÂF L
.
ÂÂL M
Value
ÂÂM R
)
ÂÂR S
,
ÂÂS T
Read
ÊÊ 
=
ÊÊ 
x
ÊÊ 
.
ÊÊ 
Any
ÊÊ  
(
ÊÊ  !
a
ÊÊ! "
=>
ÊÊ# %
a
ÊÊ& '
.
ÊÊ' (
Action
ÊÊ( .
.
ÊÊ. /

ActionName
ÊÊ/ 9
==
ÊÊ: <
Action
ÊÊ= C
.
ÊÊC D
Read
ÊÊD H
.
ÊÊH I
Value
ÊÊI N
)
ÊÊN O
,
ÊÊO P
Update
ÁÁ 
=
ÁÁ 
x
ÁÁ 
.
ÁÁ 
Any
ÁÁ "
(
ÁÁ" #
a
ÁÁ# $
=>
ÁÁ% '
a
ÁÁ( )
.
ÁÁ) *
Action
ÁÁ* 0
.
ÁÁ0 1

ActionName
ÁÁ1 ;
==
ÁÁ< >
Action
ÁÁ? E
.
ÁÁE F
Update
ÁÁF L
.
ÁÁL M
Value
ÁÁM R
)
ÁÁR S
,
ÁÁS T
Delete
ËË 
=
ËË 
x
ËË 
.
ËË 
Any
ËË "
(
ËË" #
a
ËË# $
=>
ËË% '
a
ËË( )
.
ËË) *
Action
ËË* 0
.
ËË0 1

ActionName
ËË1 ;
==
ËË< >
Action
ËË? E
.
ËËE F
Delete
ËËF L
.
ËËL M
Value
ËËM R
)
ËËR S
,
ËËS T
IsParent
ÈÈ 
=
ÈÈ 
false
ÈÈ $
,
ÈÈ$ %*
DefaultAuthStrategiesForCRUD
ÍÍ 0
=
ÍÍ1 2#
defaultAuthStrategies
ÍÍ3 H
[
ÍÍH I
x
ÍÍI J
.
ÍÍJ K
Key
ÍÍK N
.
ÍÍN O
ResourceClaimId
ÍÍO ^
]
ÍÍ^ _
,
ÍÍ_ `*
AuthStrategyOverridesForCRUD
ÎÎ 0
=
ÎÎ1 2#
authStrategyOverrides
ÎÎ3 H
[
ÎÎH I
x
ÎÎI J
.
ÎÎJ K
Key
ÎÎK N
.
ÎÎN O
ResourceClaimId
ÎÎO ^
]
ÎÎ^ _
.
ÎÎ_ `
ToArray
ÎÎ` g
(
ÎÎg h
)
ÎÎh i
}
ÏÏ 
)
ÏÏ 
.
ÌÌ 
ToList
ÌÌ 
(
ÌÌ 
)
ÌÌ 
;
ÌÌ 
return
ÓÓ 
childResources
ÓÓ !
;
ÓÓ! "
}
ÔÔ 	
}
 
}ÒÒ Å°
{C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\GetResourcesByClaimSetIdQueryV6Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 2
&GetResourcesByClaimSetIdQueryV6Service 7
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
private 
readonly 
IMapper  
_mapper! (
;( )
public 2
&GetResourcesByClaimSetIdQueryV6Service 5
(5 6
ISecurityContext6 F
securityContextG V
,V W
IMapperX _
mapper` f
)f g
{ 	
_securityContext 
= 
securityContext .
;. /
_mapper 
= 
mapper 
; 
} 	
internal 
void &
AddChildResourcesToParents 0
(0 1
IEnumerable1 <
<< =
ResourceClaim= J
>J K
childResourcesL Z
,Z [
List\ `
<` a
ResourceClaima n
>n o
parentResourcesp 
)	 Ä
{   	
foreach!! 
(!! 
var!! 
childResource!! &
in!!' )
childResources!!* 8
)!!8 9
{"" 
var## 
parentResource## "
=### $
parentResources##% 4
.##4 5
SingleOrDefault##5 D
(##D E
x##E F
=>##G I
x##J K
.##K L
Id##L N
==##O Q
childResource##R _
.##_ `
ParentId##` h
)##h i
;##i j
if$$ 
($$ 
parentResource$$ "
!=$$# %
null$$& *
)$$* +
parentResource%% "
.%%" #
Children%%# +
.%%+ ,
Add%%, /
(%%/ 0
childResource%%0 =
)%%= >
;%%> ?
else&& 
{'' 
parentResources(( #
.((# $
Add(($ '
(((' (
childResource((( 5
)((5 6
;((6 7
})) 
}** 
}++ 	
internal-- 
List-- 
<-- 
ResourceClaim-- #
>--# $
GetParentResources--% 7
(--7 8
int--8 ;

claimSetId--< F
)--F G
{.. 	
var// 
dbParentResources// !
=//" #
_securityContext//$ 4
.//4 5(
ClaimSetResourceClaimActions//5 Q
.00 
Include00 
(00 
x00 
=>00 
x00 
.00  
ResourceClaim00  -
)00- .
.11 
Include11 
(11 
x11 
=>11 
x11 
.11  
ResourceClaim11  -
.11- .
ParentResourceClaim11. A
)11A B
.22 
Include22 
(22 
x22 
=>22 
x22 
.22  
Action22  &
)22& '
.33 
Include33 
(33 
x33 
=>33 
x33 
.33  *
AuthorizationStrategyOverrides33  >
.33> ?
Select33? E
(33E F
x33F G
=>33H J
x33K L
.33L M!
AuthorizationStrategy33M b
)33b c
)33c d
.44 
Where44 
(44 
x44 
=>44 
x44 
.44 
ClaimSet44 &
.44& '

ClaimSetId44' 1
==442 4

claimSetId445 ?
&&55 
x55  
.55  !
ResourceClaim55! .
.55. /!
ParentResourceClaimId55/ D
==55E G
null55H L
)55L M
.55M N
ToList55N T
(55T U
)55U V
;55V W
var77 !
defaultAuthStrategies77 %
=77& '$
GetDefaultAuthStrategies77( @
(77@ A
dbParentResources77A R
.77R S
Select77S Y
(77Y Z
x77Z [
=>77\ ^
x77_ `
.77` a
ResourceClaim77a n
)77n o
.77o p
ToList77p v
(77v w
)77w x
)77x y
;77y z
var88 !
authStrategyOverrides88 %
=88& '$
GetAuthStrategyOverrides88( @
(88@ A
dbParentResources88A R
.88R S
ToList88S Y
(88Y Z
)88Z [
)88[ \
;88\ ]
var:: 
parentResources:: 
=::  !
dbParentResources::" 3
.::3 4
GroupBy::4 ;
(::; <
x::< =
=>::> @
x::A B
.::B C
ResourceClaim::C P
)::P Q
.::Q R
Select::R X
(::X Y
x::Y Z
=>::[ ]
new::^ a
ResourceClaim::b o
{;; 
Id<< 
=<< 
x<< 
.<< 
Key<< 
.<< 
ResourceClaimId<< *
,<<* +
Name== 
=== 
x== 
.== 
Key== 
.== 
ResourceName== )
,==) *
Create>> 
=>> 
x>> 
.>> 
Any>> 
(>> 
a>>  
=>>>! #
a>>$ %
.>>% &
Action>>& ,
.>>, -

ActionName>>- 7
==>>8 :
Action>>; A
.>>A B
Create>>B H
.>>H I
Value>>I N
)>>N O
,>>O P
Read?? 
=?? 
x?? 
.?? 
Any?? 
(?? 
a?? 
=>?? !
a??" #
.??# $
Action??$ *
.??* +

ActionName??+ 5
==??6 8
Action??9 ?
.??? @
Read??@ D
.??D E
Value??E J
)??J K
,??K L
Update@@ 
=@@ 
x@@ 
.@@ 
Any@@ 
(@@ 
a@@  
=>@@! #
a@@$ %
.@@% &
Action@@& ,
.@@, -

ActionName@@- 7
==@@8 :
Action@@; A
.@@A B
Update@@B H
.@@H I
Value@@I N
)@@N O
,@@O P
DeleteAA 
=AA 
xAA 
.AA 
AnyAA 
(AA 
aAA  
=>AA! #
aAA$ %
.AA% &
ActionAA& ,
.AA, -

ActionNameAA- 7
==AA8 :
ActionAA; A
.AAA B
DeleteAAB H
.AAH I
ValueAAI N
)AAN O
,AAO P
IsParentBB 
=BB 
trueBB 
,BB  (
DefaultAuthStrategiesForCRUDCC ,
=CC- .!
defaultAuthStrategiesCC/ D
[CCD E
xCCE F
.CCF G
KeyCCG J
.CCJ K
ResourceClaimIdCCK Z
]CCZ [
,CC[ \(
AuthStrategyOverridesForCRUDDD ,
=DD- .!
authStrategyOverridesDD/ D
[DDD E
xDDE F
.DDF G
KeyDDG J
.DDJ K
ResourceClaimIdDDK Z
]DDZ [
.DD[ \
ToArrayDD\ c
(DDc d
)DDd e
}EE 
)EE 
.FF 
ToListFF 
(FF 
)FF 
;FF 
parentResourcesHH 
.HH 
ForEachHH #
(HH# $
xHH$ %
=>HH& (
xHH) *
.HH* +
ChildrenHH+ 3
=HH4 5
newHH6 9
ListHH: >
<HH> ?
ResourceClaimHH? L
>HHL M
(HHM N
)HHN O
)HHO P
;HHP Q
returnII 
parentResourcesII "
;II" #
}JJ 	
privateLL 

DictionaryLL 
<LL 
intLL 
,LL !
AuthorizationStrategyLL  5
[LL5 6
]LL6 7
>LL7 8$
GetDefaultAuthStrategiesLL9 Q
(LLQ R
IReadOnlyCollectionLLR e
<LLe f!
SecurityResourceClaimLLf {
>LL{ |
resourceClaims	LL} ã
)
LLã å
{MM 	
varNN 
resultDictionaryNN  
=NN! "
newNN# &

DictionaryNN' 1
<NN1 2
intNN2 5
,NN5 6!
AuthorizationStrategyNN7 L
[NNL M
]NNM N
>NNN O
(NNO P
)NNP Q
;NNQ R
varPP !
defaultAuthStrategiesPP %
=PP& '
_securityContextPP( 8
.PP8 9 
ResourceClaimActionsPP9 M
.QQ 
IncludeQQ 
(QQ 
xQQ 
=>QQ 
xQQ 
.QQ  
ResourceClaimQQ  -
)QQ- .
.QQ. /
IncludeQQ/ 6
(QQ6 7
xQQ7 8
=>QQ9 ;
xQQ< =
.QQ= >
ActionQQ> D
)QQD E
.QQE F
IncludeQQF M
(QQM N
xQQN O
=>QQP R
xQQS T
.QQT U#
AuthorizationStrategiesQQU l
.QQl m
SelectQQm s
(QQs t
xQQt u
=>QQv x
xQQy z
.QQz {"
AuthorizationStrategy	QQ{ ê
)
QQê ë
)
QQë í
.
QQí ì
ToList
QQì ô
(
QQô ö
)
QQö õ
;
QQõ ú
varSS +
defaultAuthStrategiesForParentsSS /
=SS0 1!
defaultAuthStrategiesSS2 G
.TT 
WhereTT 
(TT 
xTT 
=>TT 
xTT 
.TT 
ResourceClaimTT +
.TT+ ,!
ParentResourceClaimIdTT, A
==TTB D
nullTTE I
)TTI J
.TTJ K
ToListTTK Q
(TTQ R
)TTR S
;TTS T
varVV ,
 defaultAuthStrategiesForChildrenVV 0
=VV1 2!
defaultAuthStrategiesVV3 H
.WW 
WhereWW 
(WW 
xWW 
=>WW 
xWW 
.WW 
ResourceClaimWW +
.WW+ ,!
ParentResourceClaimIdWW, A
!=WWB D
nullWWE I
)WWI J
.WWJ K
ToListWWK Q
(WWQ R
)WWR S
;WWS T
foreachYY 
(YY 
varYY 
resourceClaimYY &
inYY' )
resourceClaimsYY* 8
)YY8 9
{ZZ 
var[[ 
actions[[ 
=[[ 
new[[ !
List[[" &
<[[& '!
AuthorizationStrategy[[' <
>[[< =
([[= >
)[[> ?
;[[? @
if\\ 
(\\ 
resourceClaim\\ !
.\\! "!
ParentResourceClaimId\\" 7
==\\8 :
null\\; ?
)\\? @
{]] 
var^^ !
createDefaultStrategy^^ -
=^^. /+
defaultAuthStrategiesForParents^^0 O
.^^O P
SingleOrDefault^^P _
(^^_ `
x^^` a
=>^^b d
x__ 
.__ 
ResourceClaim__ +
.__+ ,
ResourceClaimId__, ;
==__< >
resourceClaim__? L
.__L M
ResourceClaimId__M \
&&__] _
x`` 
.`` 
Action`` $
.``$ %

ActionName``% /
==``0 2
Action``3 9
.``9 :
Create``: @
.``@ A
Value``A F
)``F G
?``G H
.``H I#
AuthorizationStrategies``I `
.``` a
SingleOrDefault``a p
(``p q
)``q r
?``r s
.``s t"
AuthorizationStrategy	``t â
;
``â ä
actionsaa 
.aa 
Addaa 
(aa  
_mapperaa  '
.aa' (
Mapaa( +
<aa+ ,!
AuthorizationStrategyaa, A
>aaA B
(aaB C!
createDefaultStrategyaaC X
)aaX Y
)aaY Z
;aaZ [
varbb 
readDefaultStrategybb +
=bb, -+
defaultAuthStrategiesForParentsbb. M
.bbM N
SingleOrDefaultbbN ]
(bb] ^
xbb^ _
=>bb` b
xcc  !
.cc! "
ResourceClaimcc" /
.cc/ 0
ResourceClaimIdcc0 ?
==cc@ B
resourceClaimccC P
.ccP Q
ResourceClaimIdccQ `
&&cca c
xdd  !
.dd! "
Actiondd" (
.dd( )

ActionNamedd) 3
==dd4 6
Actiondd7 =
.dd= >
Readdd> B
.ddB C
ValueddC H
)ddH I
?ddI J
.ddJ K#
AuthorizationStrategiesddK b
.ddb c
SingleOrDefaultddc r
(ddr s
)dds t
?ddt u
.ddu v"
AuthorizationStrategy	ddv ã
;
ddã å
actionsee 
.ee 
Addee 
(ee  
_mapperee  '
.ee' (
Mapee( +
<ee+ ,!
AuthorizationStrategyee, A
>eeA B
(eeB C
readDefaultStrategyeeC V
)eeV W
)eeW X
;eeX Y
varff !
updateDefaultStrategyff -
=ff. /+
defaultAuthStrategiesForParentsff0 O
.gg 
SingleOrDefaultgg ,
(gg, -
xgg- .
=>gg/ 1
xhh  !
.hh! "
ResourceClaimhh" /
.hh/ 0
ResourceClaimIdhh0 ?
==hh@ B
resourceClaimhhC P
.hhP Q
ResourceClaimIdhhQ `
&&hha c
xii  !
.ii! "
Actionii" (
.ii( )

ActionNameii) 3
==ii4 6
Actionii7 =
.ii= >
Updateii> D
.iiD E
ValueiiE J
)iiJ K
?iiK L
.iiL M#
AuthorizationStrategiesiiM d
.iid e
SingleOrDefaultiie t
(iit u
)iiu v
?iiv w
.iiw x"
AuthorizationStrategy	iix ç
;
iiç é
actionsjj 
.jj 
Addjj 
(jj  
_mapperjj  '
.jj' (
Mapjj( +
<jj+ ,!
AuthorizationStrategyjj, A
>jjA B
(jjB C!
updateDefaultStrategyjjC X
)jjX Y
)jjY Z
;jjZ [
varkk !
deleteDefaultStrategykk -
=kk. /+
defaultAuthStrategiesForParentskk0 O
.ll 
SingleOrDefaultll ,
(ll, -
xll- .
=>ll/ 1
xmm  !
.mm! "
ResourceClaimmm" /
.mm/ 0
ResourceClaimIdmm0 ?
==mm@ B
resourceClaimmmC P
.mmP Q
ResourceClaimIdmmQ `
&&mma c
xnn  !
.nn! "
Actionnn" (
.nn( )

ActionNamenn) 3
==nn4 6
Actionnn7 =
.nn= >
Deletenn> D
.nnD E
ValuennE J
)nnJ K
?nnK L
.nnL M#
AuthorizationStrategiesnnM d
.nnd e
SingleOrDefaultnne t
(nnt u
)nnu v
?nnv w
.nnw x"
AuthorizationStrategy	nnx ç
;
nnç é
actionsoo 
.oo 
Addoo 
(oo  
_mapperoo  '
.oo' (
Mapoo( +
<oo+ ,!
AuthorizationStrategyoo, A
>ooA B
(ooB C!
deleteDefaultStrategyooC X
)ooX Y
)ooY Z
;ooZ [
}pp 
elseqq 
{rr 
varss !
createDefaultStrategyss -
=ss. /,
 defaultAuthStrategiesForChildrenss0 P
.ssP Q
SingleOrDefaultssQ `
(ss` a
xssa b
=>ssc e
xtt 
.tt 
ResourceClaimtt '
.tt' (
ResourceClaimIdtt( 7
==tt8 :
resourceClaimtt; H
.ttH I
ResourceClaimIdttI X
&&ttY [
xuu 
.uu 
Actionuu  
.uu  !

ActionNameuu! +
==uu, .
Actionuu/ 5
.uu5 6
Createuu6 <
.uu< =
Valueuu= B
)uuB C
?uuC D
.uuD E#
AuthorizationStrategiesuuE \
.uu\ ]
SingleOrDefaultuu] l
(uul m
)uum n
?uun o
.uuo p"
AuthorizationStrategy	uup Ö
;
uuÖ Ü
actionsvv 
=vv &
AddStrategyToChildResourcevv 8
(vv8 9!
createDefaultStrategyvv9 N
,vvN O
ActionvvP V
.vvV W
CreatevvW ]
)vv] ^
;vv^ _
varxx 
readDefaultStrategyxx +
=xx, -,
 defaultAuthStrategiesForChildrenxx. N
.xxN O
SingleOrDefaultxxO ^
(xx^ _
xxx_ `
=>xxa c
xyy 
.yy 
ResourceClaimyy '
.yy' (
ResourceClaimIdyy( 7
==yy8 :
resourceClaimyy; H
.yyH I
ResourceClaimIdyyI X
&&yyY [
xzz 
.zz 
Actionzz  
.zz  !

ActionNamezz! +
==zz, .
Actionzz/ 5
.zz5 6
Readzz6 :
.zz: ;
Valuezz; @
)zz@ A
?zzA B
.zzB C#
AuthorizationStrategieszzC Z
.zzZ [
SingleOrDefaultzz[ j
(zzj k
)zzk l
?zzl m
.zzm n"
AuthorizationStrategy	zzn É
;
zzÉ Ñ
actions{{ 
={{ &
AddStrategyToChildResource{{ 8
({{8 9
readDefaultStrategy{{9 L
,{{L M
Action{{N T
.{{T U
Read{{U Y
){{Y Z
;{{Z [
var}} !
updateDefaultStrategy}} -
=}}. /,
 defaultAuthStrategiesForChildren}}0 P
.}}P Q
SingleOrDefault}}Q `
(}}` a
x}}a b
=>}}c e
x~~ 
.~~ 
ResourceClaim~~ '
.~~' (
ResourceClaimId~~( 7
==~~8 :
resourceClaim~~; H
.~~H I
ResourceClaimId~~I X
&&~~Y [
x 
. 
Action  
.  !

ActionName! +
==, .
Action/ 5
.5 6
Update6 <
.< =
Value= B
)B C
?C D
.D E#
AuthorizationStrategiesE \
.\ ]
SingleOrDefault] l
(l m
)m n
?n o
.o p"
AuthorizationStrategy	p Ö
;
Ö Ü
actions
ÄÄ 
=
ÄÄ (
AddStrategyToChildResource
ÄÄ 8
(
ÄÄ8 9#
updateDefaultStrategy
ÄÄ9 N
,
ÄÄN O
Action
ÄÄP V
.
ÄÄV W
Update
ÄÄW ]
)
ÄÄ] ^
;
ÄÄ^ _
var
ÇÇ #
deleteDefaultStrategy
ÇÇ -
=
ÇÇ. /.
 defaultAuthStrategiesForChildren
ÇÇ0 P
.
ÇÇP Q
SingleOrDefault
ÇÇQ `
(
ÇÇ` a
x
ÇÇa b
=>
ÇÇc e
x
ÉÉ 
.
ÉÉ 
ResourceClaim
ÉÉ '
.
ÉÉ' (
ResourceClaimId
ÉÉ( 7
==
ÉÉ8 :
resourceClaim
ÉÉ; H
.
ÉÉH I
ResourceClaimId
ÉÉI X
&&
ÉÉY [
x
ÑÑ 
.
ÑÑ 
Action
ÑÑ  
.
ÑÑ  !

ActionName
ÑÑ! +
==
ÑÑ, .
Action
ÑÑ/ 5
.
ÑÑ5 6
Delete
ÑÑ6 <
.
ÑÑ< =
Value
ÑÑ= B
)
ÑÑB C
?
ÑÑC D
.
ÑÑD E%
AuthorizationStrategies
ÑÑE \
.
ÑÑ\ ]
SingleOrDefault
ÑÑ] l
(
ÑÑl m
)
ÑÑm n
?
ÑÑn o
.
ÑÑo p$
AuthorizationStrategyÑÑp Ö
;ÑÑÖ Ü
actions
ÖÖ 
=
ÖÖ (
AddStrategyToChildResource
ÖÖ 8
(
ÖÖ8 9#
deleteDefaultStrategy
ÖÖ9 N
,
ÖÖN O
Action
ÖÖP V
.
ÖÖV W
Delete
ÖÖW ]
)
ÖÖ] ^
;
ÖÖ^ _
List
áá 
<
áá #
AuthorizationStrategy
áá .
>
áá. /(
AddStrategyToChildResource
áá0 J
(
ááJ K+
SecurityAuthorizationStrategy
ááK h
defaultStrategy
áái x
,
ááx y
Actionááz Ä
actionááÅ á
)ááá à
{
àà 
if
ââ 
(
ââ 
defaultStrategy
ââ +
==
ââ, .
null
ââ/ 3
)
ââ3 4
{
ää 
defaultStrategy
ãã +
=
ãã, --
defaultAuthStrategiesForParents
ãã. M
.
ããM N
SingleOrDefault
ããN ]
(
ãã] ^
x
ãã^ _
=>
ãã` b
x
åå  !
.
åå! "
ResourceClaim
åå" /
.
åå/ 0
ResourceClaimId
åå0 ?
==
åå@ B
resourceClaim
ååC P
.
ååP Q#
ParentResourceClaimId
ååQ f
&&
ååg i
x
çç  !
.
çç! "
Action
çç" (
.
çç( )

ActionName
çç) 3
==
çç4 6
action
çç7 =
.
çç= >
Value
çç> C
)
ççC D
?
ççD E
.
ççE F%
AuthorizationStrategies
ççF ]
.
çç] ^
SingleOrDefault
çç^ m
(
ççm n
)
ççn o
?
çço p
.
ççp q$
AuthorizationStrategyççq Ü
;ççÜ á
var
éé 
mappedStrategy
éé  .
=
éé/ 0
_mapper
éé1 8
.
éé8 9
Map
éé9 <
<
éé< =#
AuthorizationStrategy
éé= R
>
ééR S
(
ééS T
defaultStrategy
ééT c
)
ééc d
;
ééd e
if
èè 
(
èè  
mappedStrategy
èè  .
!=
èè/ 1
null
èè2 6
)
èè6 7
mappedStrategy
èè8 F
.
èèF G#
IsInheritedFromParent
èèG \
=
èè] ^
true
èè_ c
;
èèc d
actions
êê #
.
êê# $
Add
êê$ '
(
êê' (
mappedStrategy
êê( 6
)
êê6 7
;
êê7 8
}
ëë 
else
íí 
{
ìì 
actions
îî #
.
îî# $
Add
îî$ '
(
îî' (
_mapper
îî( /
.
îî/ 0
Map
îî0 3
<
îî3 4#
AuthorizationStrategy
îî4 I
>
îîI J
(
îîJ K
defaultStrategy
îîK Z
)
îîZ [
)
îî[ \
;
îî\ ]
}
ïï 
return
óó 
actions
óó &
;
óó& '
}
òò 
}
ôô 
resultDictionary
õõ  
[
õõ  !
resourceClaim
õõ! .
.
õõ. /
ResourceClaimId
õõ/ >
]
õõ> ?
=
õõ@ A
actions
õõB I
.
õõI J
ToArray
õõJ Q
(
õõQ R
)
õõR S
;
õõS T
}
úú 
return
ûû 
resultDictionary
ûû #
;
ûû# $
}
üü 	
private
°° 

Dictionary
°° 
<
°° 
int
°° 
,
°° #
AuthorizationStrategy
°°  5
[
°°5 6
]
°°6 7
>
°°7 8&
GetAuthStrategyOverrides
°°9 Q
(
°°Q R
List
°°R V
<
°°V W)
ClaimSetResourceClaimAction
°°W r
>
°°r s
resourceClaims°°t Ç
)°°Ç É
{
¢¢ 	
var
££ 
resultDictionary
££  
=
££! "
new
££# &

Dictionary
££' 1
<
££1 2
int
££2 5
,
££5 6#
AuthorizationStrategy
££7 L
[
££L M
]
££M N
>
££N O
(
££O P
)
££P Q
;
££Q R
resourceClaims
§§ 
=
§§ 
new
•• 
List
•• 
<
•• )
ClaimSetResourceClaimAction
•• 4
>
••4 5
(
••5 6
resourceClaims
••6 D
.
••D E
OrderBy
••E L
(
••L M
i
••M N
=>
••O Q
new
••R U
List
••V Z
<
••Z [
string
••[ a
>
••a b
{
••c d
Action
••e k
.
••k l
Create
••l r
.
••r s
Value
••s x
,
••x y
Action••z Ä
.••Ä Å
Read••Å Ö
.••Ö Ü
Value••Ü ã
,••ã å
Action••ç ì
.••ì î
Update••î ö
.••ö õ
Value••õ †
,••† °
Action••¢ ®
.••® ©
Delete••© Ø
.••Ø ∞
Value••∞ µ
}••∂ ∑
.••∑ ∏
IndexOf••∏ ø
(••ø ¿
i••¿ ¡
.••¡ ¬
Action••¬ »
.••» …

ActionName••… ”
)••” ‘
)••‘ ’
)••’ ÷
;••÷ ◊
foreach
¶¶ 
(
¶¶ 
var
¶¶ 
resourceClaim
¶¶ &
in
¶¶' )
resourceClaims
¶¶* 8
)
¶¶8 9
{
ßß #
AuthorizationStrategy
®® %
authStrategy
®®& 2
=
®®3 4
null
®®5 9
;
®®9 :
if
©© 
(
©© 
resourceClaim
©© !
.
©©! "
ResourceClaim
©©" /
.
©©/ 0!
ParentResourceClaim
©©0 C
==
©©D F
null
©©G K
)
©©K L
{
™™ 
authStrategy
´´  
=
´´! "
_mapper
´´# *
.
´´* +
Map
´´+ .
<
´´. /#
AuthorizationStrategy
´´/ D
>
´´D E
(
´´E F
resourceClaim
´´F S
.
´´S T,
AuthorizationStrategyOverrides
´´T r
.
´´r s
Any
´´s v
(
´´v w
)
´´w x
?
´´y z
resourceClaim
¨¨ %
.
¨¨% &,
AuthorizationStrategyOverrides
¨¨& D
.
¨¨D E
Single
¨¨E K
(
¨¨K L
)
¨¨L M
.
¨¨M N#
AuthorizationStrategy
¨¨N c
:
¨¨d e
null
¨¨f j
)
¨¨j k
;
¨¨k l
}
≠≠ 
else
ÆÆ 
{
ØØ 
var
∞∞ 
parentResources
∞∞ '
=
∞∞( )
_securityContext
∞∞* :
.
∞∞: ;*
ClaimSetResourceClaimActions
∞∞; W
.
±± 
Include
±±  
(
±±  !
x
±±! "
=>
±±# %
x
±±& '
.
±±' (
ResourceClaim
±±( 5
)
±±5 6
.
≤≤ 
Include
≤≤  
(
≤≤  !
x
≤≤! "
=>
≤≤# %
x
≤≤& '
.
≤≤' (
ClaimSet
≤≤( 0
)
≤≤0 1
.
≥≥ 
Include
≥≥  
(
≥≥  !
x
≥≥! "
=>
≥≥# %
x
≥≥& '
.
≥≥' (
Action
≥≥( .
)
≥≥. /
.
¥¥ 
Include
¥¥  
(
¥¥  !
x
¥¥! "
=>
¥¥# %
x
¥¥& '
.
¥¥' (,
AuthorizationStrategyOverrides
¥¥( F
.
¥¥F G
Select
¥¥G M
(
¥¥M N
x
¥¥N O
=>
¥¥P R
x
¥¥S T
.
¥¥T U#
AuthorizationStrategy
¥¥U j
)
¥¥j k
)
¥¥k l
.
¥¥l m
ToList
¥¥m s
(
¥¥s t
)
¥¥t u
;
¥¥u v
var
µµ $
parentResourceOverride
µµ .
=
µµ/ 0
parentResources
µµ1 @
.
µµ@ A
SingleOrDefault
µµA P
(
µµP Q
x
µµQ R
=>
µµS U
x
µµV W
.
µµW X
ResourceClaim
µµX e
.
µµe f
ResourceClaimId
µµf u
==
µµv x
resourceClaimµµy Ü
.µµÜ á
ResourceClaimµµá î
.µµî ï%
ParentResourceClaimIdµµï ™
&&
∂∂_ a
x
∂∂b c
.
∂∂c d
ClaimSet
∂∂d l
.
∂∂l m

ClaimSetId
∂∂m w
==
∂∂x z
resourceClaim∂∂{ à
.∂∂à â
ClaimSet∂∂â ë
.∂∂ë í

ClaimSetId∂∂í ú
&&
∑∑_ a
x
∑∑b c
.
∑∑c d
Action
∑∑d j
.
∑∑j k
ActionId
∑∑k s
==
∑∑t v
resourceClaim∑∑w Ñ
.∑∑Ñ Ö
Action∑∑Ö ã
.∑∑ã å
ActionId∑∑å î
)∑∑î ï
;∑∑ï ñ
if
∏∏ 
(
∏∏ $
parentResourceOverride
∏∏ .
?
∏∏. /
.
∏∏/ 0,
AuthorizationStrategyOverrides
∏∏0 N
!=
∏∏O Q
null
∏∏R V
&&
∏∏W Y$
parentResourceOverride
∏∏Z p
.
∏∏p q-
AuthorizationStrategyOverrides∏∏q è
.∏∏è ê
Any∏∏ê ì
(∏∏ì î
)∏∏î ï
)∏∏ï ñ
{
ππ 
authStrategy
∫∫ $
=
∫∫% &
_mapper
ªª #
.
ªª# $
Map
ªª$ '
<
ªª' (#
AuthorizationStrategy
ªª( =
>
ªª= >
(
ªª> ?$
parentResourceOverride
ªª? U
.
ªªU V,
AuthorizationStrategyOverrides
ªªV t
.
ªªt u
Single
ªªu {
(
ªª{ |
)
ªª| }
.
ªª} ~$
AuthorizationStrategyªª~ ì
)ªªì î
;ªªî ï
if
ºº 
(
ºº 
authStrategy
ºº (
!=
ºº) +
null
ºº, 0
)
ºº0 1
{
ΩΩ 
authStrategy
ææ (
.
ææ( )#
IsInheritedFromParent
ææ) >
=
ææ? @
true
ææA E
;
ææE F
}
øø 
}
¿¿ 
if
¬¬ 
(
¬¬ 
resourceClaim
¬¬ %
.
¬¬% &,
AuthorizationStrategyOverrides
¬¬& D
!=
¬¬E G
null
¬¬H L
&&
¬¬M O
resourceClaim
¬¬P ]
.
¬¬] ^,
AuthorizationStrategyOverrides
¬¬^ |
.
¬¬| }
Any¬¬} Ä
(¬¬Ä Å
)¬¬Å Ç
)¬¬Ç É
{
√√ 
authStrategy
ƒƒ $
=
ƒƒ% &
_mapper
ƒƒ' .
.
ƒƒ. /
Map
ƒƒ/ 2
<
ƒƒ2 3#
AuthorizationStrategy
ƒƒ3 H
>
ƒƒH I
(
ƒƒI J
resourceClaim
ƒƒJ W
.
ƒƒW X,
AuthorizationStrategyOverrides
ƒƒX v
.
ƒƒv w
Single
ƒƒw }
(
ƒƒ} ~
)
ƒƒ~ 
.ƒƒ Ä%
AuthorizationStrategyƒƒÄ ï
)ƒƒï ñ
;ƒƒñ ó
}
≈≈ 
}
∆∆ 
if
»» 
(
»» 
resultDictionary
»» $
.
»»$ %
ContainsKey
»»% 0
(
»»0 1
resourceClaim
»»1 >
.
»»> ?
ResourceClaim
»»? L
.
»»L M
ResourceClaimId
»»M \
)
»»\ ]
)
»»] ^
{
…… 
resultDictionary
   $
[
  $ %
resourceClaim
  % 2
.
  2 3
ResourceClaim
  3 @
.
  @ A
ResourceClaimId
  A P
]
  P Q
.
  Q R/
!AddAuthorizationStrategyOverrides
  R s
(
  s t
resourceClaim  t Å
.  Å Ç
Action  Ç à
.  à â

ActionName  â ì
,  ì î
authStrategy
ÀÀ $
)
ÀÀ$ %
;
ÀÀ% &
}
ÃÃ 
else
ÕÕ 
{
ŒŒ 
var
œœ 
actions
œœ 
=
œœ  !
new
œœ" %#
AuthorizationStrategy
œœ& ;
[
œœ; <
]
œœ< =
{
œœ> ?
null
œœ@ D
,
œœD E
null
œœF J
,
œœJ K
null
œœL P
,
œœP Q
null
œœR V
}
œœW X
;
œœX Y
resultDictionary
–– $
[
––$ %
resourceClaim
––% 2
.
––2 3
ResourceClaim
––3 @
.
––@ A
ResourceClaimId
––A P
]
––P Q
=
––R S
actions
––T [
.
––[ \/
!AddAuthorizationStrategyOverrides
––\ }
(
––} ~
resourceClaim––~ ã
.––ã å
Action––å í
.––í ì

ActionName––ì ù
,––ù û
authStrategy––ü ´
)––´ ¨
;––¨ ≠
}
—— 
}
““ 
return
”” 
resultDictionary
”” #
;
””# $
}
‘‘ 	
internal
÷÷ 
IEnumerable
÷÷ 
<
÷÷ 
ResourceClaim
÷÷ *
>
÷÷* +
GetChildResources
÷÷, =
(
÷÷= >
int
÷÷> A

claimSetId
÷÷B L
)
÷÷L M
{
◊◊ 	
var
ÿÿ 
dbChildResources
ÿÿ  
=
ÿÿ! "
_securityContext
ŸŸ  
.
ŸŸ  !*
ClaimSetResourceClaimActions
ŸŸ! =
.
⁄⁄ 
Include
⁄⁄ 
(
⁄⁄ 
x
⁄⁄ 
=>
⁄⁄ 
x
⁄⁄ 
.
⁄⁄  
ResourceClaim
⁄⁄  -
)
⁄⁄- .
.
€€ 
Include
€€ 
(
€€ 
x
€€ 
=>
€€ 
x
€€ 
.
€€  
Action
€€  &
)
€€& '
.
‹‹ 
Where
‹‹ 
(
‹‹ 
x
‹‹ 
=>
‹‹ 
x
‹‹ 
.
‹‹ 
ClaimSet
‹‹ &
.
‹‹& '

ClaimSetId
‹‹' 1
==
‹‹2 4

claimSetId
‹‹5 ?
&&
›› 
x
››  
.
››  !
ResourceClaim
››! .
.
››. /#
ParentResourceClaimId
››/ D
!=
››E G
null
››H L
)
››L M
.
››M N
ToList
››N T
(
››T U
)
››U V
;
››V W
var
ﬁﬁ #
defaultAuthStrategies
ﬁﬁ %
=
ﬁﬁ& '&
GetDefaultAuthStrategies
ﬁﬁ( @
(
ﬁﬁ@ A
dbChildResources
ﬁﬁA Q
.
ﬁﬁQ R
Select
ﬁﬁR X
(
ﬁﬁX Y
x
ﬁﬁY Z
=>
ﬁﬁ[ ]
x
ﬁﬁ^ _
.
ﬁﬁ_ `
ResourceClaim
ﬁﬁ` m
)
ﬁﬁm n
.
ﬁﬁn o
ToList
ﬁﬁo u
(
ﬁﬁu v
)
ﬁﬁv w
)
ﬁﬁw x
;
ﬁﬁx y
var
ﬂﬂ #
authStrategyOverrides
ﬂﬂ %
=
ﬂﬂ& '&
GetAuthStrategyOverrides
ﬂﬂ( @
(
ﬂﬂ@ A
dbChildResources
ﬂﬂA Q
.
ﬂﬂQ R
ToList
ﬂﬂR X
(
ﬂﬂX Y
)
ﬂﬂY Z
)
ﬂﬂZ [
;
ﬂﬂ[ \
var
·· 
childResources
·· 
=
··  
dbChildResources
··! 1
.
··1 2
GroupBy
··2 9
(
··9 :
x
··: ;
=>
··< >
x
··? @
.
··@ A
ResourceClaim
··A N
)
··N O
.
‚‚ 
Select
‚‚ 
(
‚‚ 
x
‚‚ 
=>
‚‚ 
new
‚‚  
ResourceClaim
‚‚! .
{
„„ 
Id
‰‰ 
=
‰‰ 
x
‰‰ 
.
‰‰ 
Key
‰‰ 
.
‰‰ 
ResourceClaimId
‰‰ .
,
‰‰. /
ParentId
ÂÂ 
=
ÂÂ 
x
ÂÂ  
.
ÂÂ  !
Key
ÂÂ! $
.
ÂÂ$ %#
ParentResourceClaimId
ÂÂ% :
.
ÂÂ: ;
Value
ÂÂ; @
,
ÂÂ@ A
Name
ÊÊ 
=
ÊÊ 
x
ÊÊ 
.
ÊÊ 
Key
ÊÊ  
.
ÊÊ  !
ResourceName
ÊÊ! -
,
ÊÊ- .
Create
ÁÁ 
=
ÁÁ 
x
ÁÁ 
.
ÁÁ 
Any
ÁÁ "
(
ÁÁ" #
a
ÁÁ# $
=>
ÁÁ% '
a
ÁÁ( )
.
ÁÁ) *
Action
ÁÁ* 0
.
ÁÁ0 1

ActionName
ÁÁ1 ;
==
ÁÁ< >
Action
ÁÁ? E
.
ÁÁE F
Create
ÁÁF L
.
ÁÁL M
Value
ÁÁM R
)
ÁÁR S
,
ÁÁS T
Read
ËË 
=
ËË 
x
ËË 
.
ËË 
Any
ËË  
(
ËË  !
a
ËË! "
=>
ËË# %
a
ËË& '
.
ËË' (
Action
ËË( .
.
ËË. /

ActionName
ËË/ 9
==
ËË: <
Action
ËË= C
.
ËËC D
Read
ËËD H
.
ËËH I
Value
ËËI N
)
ËËN O
,
ËËO P
Update
ÈÈ 
=
ÈÈ 
x
ÈÈ 
.
ÈÈ 
Any
ÈÈ "
(
ÈÈ" #
a
ÈÈ# $
=>
ÈÈ% '
a
ÈÈ( )
.
ÈÈ) *
Action
ÈÈ* 0
.
ÈÈ0 1

ActionName
ÈÈ1 ;
==
ÈÈ< >
Action
ÈÈ? E
.
ÈÈE F
Update
ÈÈF L
.
ÈÈL M
Value
ÈÈM R
)
ÈÈR S
,
ÈÈS T
Delete
ÍÍ 
=
ÍÍ 
x
ÍÍ 
.
ÍÍ 
Any
ÍÍ "
(
ÍÍ" #
a
ÍÍ# $
=>
ÍÍ% '
a
ÍÍ( )
.
ÍÍ) *
Action
ÍÍ* 0
.
ÍÍ0 1

ActionName
ÍÍ1 ;
==
ÍÍ< >
Action
ÍÍ? E
.
ÍÍE F
Delete
ÍÍF L
.
ÍÍL M
Value
ÍÍM R
)
ÍÍR S
,
ÍÍS T
IsParent
ÎÎ 
=
ÎÎ 
false
ÎÎ $
,
ÎÎ$ %*
DefaultAuthStrategiesForCRUD
ÏÏ 0
=
ÏÏ1 2#
defaultAuthStrategies
ÏÏ3 H
[
ÏÏH I
x
ÏÏI J
.
ÏÏJ K
Key
ÏÏK N
.
ÏÏN O
ResourceClaimId
ÏÏO ^
]
ÏÏ^ _
,
ÏÏ_ `*
AuthStrategyOverridesForCRUD
ÌÌ 0
=
ÌÌ1 2#
authStrategyOverrides
ÌÌ3 H
[
ÌÌH I
x
ÌÌI J
.
ÌÌJ K
Key
ÌÌK N
.
ÌÌN O
ResourceClaimId
ÌÌO ^
]
ÌÌ^ _
.
ÌÌ_ `
ToArray
ÌÌ` g
(
ÌÌg h
)
ÌÌh i
}
ÓÓ 
)
ÓÓ 
.
ÔÔ 
ToList
ÔÔ 
(
ÔÔ 
)
ÔÔ 
;
ÔÔ 
return
 
childResources
 !
;
! "
}
ÒÒ 	
}
ÚÚ 
}ÛÛ ü
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\JsonObjectManipulation.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
ClaimSetEditor

' 5
{ 
public 

class "
JsonObjectManipulation '
{ 
public 
static 
JObject 
RemoveProperties .
(. /
JObject/ 6

jsonObject7 A
,A B
ListC G
<G H
stringH N
>N O
propertyNamesP ]
)] ^
{ 	
var 
token 
= 
JToken 
. 

FromObject )
() *

jsonObject* 4
)4 5
;5 6
RemoveProperties 
( 
token "
," #
propertyNames$ 1
)1 2
;2 3
return 
token 
. 
ToObject !
<! "
JObject" )
>) *
(* +
)+ ,
;, -
} 	
private 
static 
void 
RemoveProperties ,
(, -
JToken- 3
token4 9
,9 :
List; ?
<? @
string@ F
>F G
propertyNamesH U
)U V
{ 	
switch 
( 
token 
. 
Type 
) 
{ 
case 

JTokenType 
.  
Object  &
:& '
{ 
foreach 
( 
var  
prop! %
in& (
token) .
.. /
Children/ 7
<7 8
	JProperty8 A
>A B
(B C
)C D
.D E
ToListE K
(K L
)L M
)M N
{ 
var 
removed #
=$ %
false& +
;+ ,
foreach 
(  !
var! $
name% )
in* ,
propertyNames- :
): ;
{ 
if   
(    
!    !
name  ! %
.  % &
Equals  & ,
(  , -
prop  - 1
.  1 2
Name  2 6
)  6 7
)  7 8
continue  9 A
;  A B
prop!!  
.!!  !
Remove!!! '
(!!' (
)!!( )
;!!) *
removed"" #
=""$ %
true""& *
;""* +
break## !
;##! "
}$$ 
if%% 
(%% 
!%% 
removed%% $
)%%$ %
{&& 
RemoveProperties'' ,
('', -
prop''- 1
.''1 2
Value''2 7
,''7 8
propertyNames''9 F
)''F G
;''G H
}(( 
})) 
break++ 
;++ 
},, 
case-- 

JTokenType-- 
.--  
Array--  %
:--% &
{.. 
foreach// 
(// 
var//  
child//! &
in//' )
token//* /
./// 0
Children//0 8
(//8 9
)//9 :
)//: ;
{00 
RemoveProperties11 (
(11( )
child11) .
,11. /
propertyNames110 =
)11= >
;11> ?
}22 
break44 
;44 
}55 
}66 
}77 	
}88 
}99 ∞
ÄC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\OverrideDefaultAuthorizationStrategyCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
;5 6
public 
class 7
+OverrideDefaultAuthorizationStrategyCommand 8
{		 
private

 
readonly

 ,
 IOdsSecurityModelVersionResolver

 5
	_resolver

6 ?
;

? @
private 
readonly :
.OverrideDefaultAuthorizationStrategyV53Service C
_v53ServiceD O
;O P
private 
readonly 9
-OverrideDefaultAuthorizationStrategyV6Service B

_v6ServiceC M
;M N
public 
7
+OverrideDefaultAuthorizationStrategyCommand 6
(6 7,
 IOdsSecurityModelVersionResolver7 W
resolverX `
,` a;
.OverrideDefaultAuthorizationStrategyV53Service	b ê

v53Service
ë õ
,
õ ú;
-OverrideDefaultAuthorizationStrategyV6Service
ù  
	v6Service
À ‘
)
‘ ’
{ 
	_resolver 
= 
resolver 
; 
_v53Service 
= 

v53Service  
;  !

_v6Service 
= 
	v6Service 
; 
} 
public 

void 
Execute 
( 6
*IOverrideDefaultAuthorizationStrategyModel B
modelC H
)H I
{ 
var 
securityModel 
= 
	_resolver %
.% &"
DetermineSecurityModel& <
(< =
)= >
;> ?
if 

( 
securityModel 
== -
!EdFiOdsSecurityModelCompatibility >
.> ?
ThreeThroughFive? O
)O P
_v53Service 
. 
Execute 
(  
model  %
)% &
;& '
else 
if 
( 
securityModel 
== !-
!EdFiOdsSecurityModelCompatibility" C
.C D
SixD G
)G H

_v6Service 
. 
Execute 
( 
model $
)$ %
;% &
else 
throw 
new 6
*EdFiOdsSecurityModelCompatibilityException @
(@ A
securityModelA N
)N O
;O P
} 
} 
public!! 
	interface!! 6
*IOverrideDefaultAuthorizationStrategyModel!! ;
{"" 
int## 

ClaimSetId## 
{## 
get## 
;## 
}## 
int$$ 
ResourceClaimId$$ 
{$$ 
get$$ 
;$$ 
}$$  
int%% *
AuthorizationStrategyForCreate%% &
{%%' (
get%%) ,
;%%, -
}%%. /
int&& (
AuthorizationStrategyForRead&& $
{&&% &
get&&' *
;&&* +
}&&, -
int'' *
AuthorizationStrategyForUpdate'' &
{''' (
get'') ,
;'', -
}''. /
int(( *
AuthorizationStrategyForDelete(( &
{((' (
get(() ,
;((, -
}((. /
})) éî
ÉC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\OverrideDefaultAuthorizationStrategyV53Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
;5 6
public 
class :
.OverrideDefaultAuthorizationStrategyV53Service ;
{ 
private 
readonly 
ISecurityContext %
_context& .
;. /
public 
:
.OverrideDefaultAuthorizationStrategyV53Service 9
(9 :
ISecurityContext: J
contextK R
)R S
{ 
_context 
= 
context 
; 
} 
public 

void 
Execute 
( 6
*IOverrideDefaultAuthorizationStrategyModel B
modelC H
)H I
{ 
var (
claimSetResourceClaimsToEdit (
=) *
_context+ 3
.3 4"
ClaimSetResourceClaims4 J
. 
Include 
( 
x 
=> 
x 
. 
ResourceClaim )
)) *
. 
Include 
( 
x 
=> 
x 
. 
Action "
)" #
. 
Include 
( 
x 
=> 
x 
. 
ClaimSet $
)$ %
. 
Include 
( 
x 
=> 
x 
. )
AuthorizationStrategyOverride 9
)9 :
. 
Where 
( 
x 
=> 
x 
. 
ResourceClaim '
.' (
ResourceClaimId( 7
==8 :
model; @
.@ A
ResourceClaimIdA P
&&Q S
xT U
.U V
ClaimSetV ^
.^ _

ClaimSetId_ i
==j l
modelm r
.r s

ClaimSetIds }
)} ~
. 
ToList 
( 
) 
; 
var!! !
parentResourceClaimId!! !
=!!" #
_context!!$ ,
.!!, -
ResourceClaims!!- ;
."" 
Single"" 
("" 
x"" 
=>"" 
x"" 
."" 
ResourceClaimId"" *
==""+ -
model"". 3
.""3 4
ResourceClaimId""4 C
)""C D
.""D E!
ParentResourceClaimId""E Z
;""Z [
var##  
parentResourceClaims##  
=##! "
new### &
List##' +
<##+ ,!
ClaimSetResourceClaim##, A
>##A B
(##B C
)##C D
;##D E
if%% 

(%% !
parentResourceClaimId%% !
!=%%" $
null%%% )
)%%) *
{&& 	 
parentResourceClaims''  
=''! "
_context''# +
.''+ ,"
ClaimSetResourceClaims'', B
.(( 
Include(( 
((( 
x(( 
=>(( 
x(( 
.((  
ResourceClaim((  -
)((- .
.)) 
Include)) 
()) 
x)) 
=>)) 
x)) 
.))  
Action))  &
)))& '
.** 
Include** 
(** 
x** 
=>** 
x** 
.**  
ClaimSet**  (
)**( )
.++ 
Include++ 
(++ 
x++ 
=>++ 
x++ 
.++  )
AuthorizationStrategyOverride++  =
)++= >
.,, 
Where,, 
(,, 
x,, 
=>,, 
x,, 
.,, 
ResourceClaim,, +
.,,+ ,
ResourceClaimId,,, ;
==,,< >!
parentResourceClaimId,,? T
&&,,U W
x,,X Y
.,,Y Z
ClaimSet,,Z b
.,,b c

ClaimSetId,,c m
==,,n p
model,,q v
.,,v w

ClaimSetId	,,w Å
)
,,Å Ç
.-- 
ToList-- 
(-- 
)-- 
;-- 
}.. 	
var00 -
!authorizationStrategiesDictionary00 -
=00. /
new000 3

Dictionary004 >
<00> ?
int00? B
,00B C
EdFi00D H
.00H I"
SecurityCompatiblity5300I _
.00_ `

DataAccess00` j
.00j k
Models00k q
.00q r"
AuthorizationStrategy	00r á
>
00á à
(
00à â
)
00â ä
;
00ä ã
foreach11 
(11 
var11 
authStrategy11 !
in11" $
_context11% -
.11- .#
AuthorizationStrategies11. E
.11E F
ToList11F L
(11L M
)11M N
)11N O
{22 	-
!authorizationStrategiesDictionary33 -
[33- .
authStrategy33. :
.33: ;#
AuthorizationStrategyId33; R
]33R S
=33T U
authStrategy33V b
;33b c
}44 	(
claimSetResourceClaimsToEdit66 $
=66% &
RemoveOverrides66' 6
(666 7
model667 <
,66< =(
claimSetResourceClaimsToEdit66> Z
)66Z [
;66[ \
AddOverrides88 
(88 
model88 
,88 (
claimSetResourceClaimsToEdit88 8
,888 9-
!authorizationStrategiesDictionary88: [
,88[ \ 
parentResourceClaims88] q
)88q r
;88r s
_context:: 
.:: 
SaveChanges:: 
(:: 
):: 
;:: 
};; 
private== 
List== 
<== !
ClaimSetResourceClaim== &
>==& '
RemoveOverrides==( 7
(==7 86
*IOverrideDefaultAuthorizationStrategyModel==8 b
model==c h
,==h i
IEnumerable==j u
<==u v"
ClaimSetResourceClaim	==v ã
>
==ã å"
resourceClaimsToEdit
==ç °
)
==° ¢
{>> 
var?? "
claimSetResourceClaims?? "
=??# $ 
resourceClaimsToEdit??% 9
.??9 :
ToList??: @
(??@ A
)??A B
;??B C
foreach@@ 
(@@ 
var@@ !
claimSetResourceClaim@@ *
in@@+ -"
claimSetResourceClaims@@. D
)@@D E
{AA 	
ifBB 
(BB !
claimSetResourceClaimBB %
.BB% &
ActionBB& ,
.BB, -

ActionNameBB- 7
==BB8 :
ActionBB; A
.BBA B
CreateBBB H
.BBH I
ValueBBI N
&&BBO Q
modelBBR W
.BBW X*
AuthorizationStrategyForCreateBBX v
==BBw y
$numBBz {
)BB{ |
{CC !
claimSetResourceClaimDD %
.DD% &)
AuthorizationStrategyOverrideDD& C
=DDD E
nullDDF J
;DDJ K
}EE 
elseFF 
ifFF 
(FF !
claimSetResourceClaimFF *
.FF* +
ActionFF+ 1
.FF1 2

ActionNameFF2 <
==FF= ?
ActionFF@ F
.FFF G
ReadFFG K
.FFK L
ValueFFL Q
&&FFR T
modelFFU Z
.FFZ [(
AuthorizationStrategyForReadFF[ w
==FFx z
$numFF{ |
)FF| }
{GG !
claimSetResourceClaimHH %
.HH% &)
AuthorizationStrategyOverrideHH& C
=HHD E
nullHHF J
;HHJ K
}II 
elseJJ 
ifJJ 
(JJ !
claimSetResourceClaimJJ *
.JJ* +
ActionJJ+ 1
.JJ1 2

ActionNameJJ2 <
==JJ= ?
ActionJJ@ F
.JJF G
UpdateJJG M
.JJM N
ValueJJN S
&&JJT V
modelJJW \
.JJ\ ]*
AuthorizationStrategyForUpdateJJ] {
==JJ| ~
$num	JJ Ä
)
JJÄ Å
{KK !
claimSetResourceClaimLL %
.LL% &)
AuthorizationStrategyOverrideLL& C
=LLD E
nullLLF J
;LLJ K
}MM 
elseNN 
ifNN 
(NN !
claimSetResourceClaimNN *
.NN* +
ActionNN+ 1
.NN1 2

ActionNameNN2 <
==NN= ?
ActionNN@ F
.NNF G
DeleteNNG M
.NNM N
ValueNNN S
&&NNT V
modelNNW \
.NN\ ]*
AuthorizationStrategyForDeleteNN] {
==NN| ~
$num	NN Ä
)
NNÄ Å
{OO !
claimSetResourceClaimPP %
.PP% &)
AuthorizationStrategyOverridePP& C
=PPD E
nullPPF J
;PPJ K
}QQ 
}RR 	
returnTT "
claimSetResourceClaimsTT %
;TT% &
}UU 
privateWW 
staticWW 
voidWW 
AddOverridesWW $
(WW$ %6
*IOverrideDefaultAuthorizationStrategyModelWW% O
modelWWP U
,WWU V
IEnumerableXX 
<XX !
ClaimSetResourceClaimXX )
>XX) * 
resourceClaimsToEditXX+ ?
,XX? @

DictionaryYY 
<YY 
intYY 
,YY 
EdFiYY 
.YY "
SecurityCompatiblity53YY 3
.YY3 4

DataAccessYY4 >
.YY> ?
ModelsYY? E
.YYE F!
AuthorizationStrategyYYF [
>YY[ \-
!authorizationStrategiesDictionaryYY] ~
,YY~ 
ListZZ 
<ZZ !
ClaimSetResourceClaimZZ "
>ZZ" # 
parentResourceClaimsZZ$ 8
)ZZ8 9
{[[ 
var\\ "
claimSetResourceClaims\\ "
=\\# $ 
resourceClaimsToEdit\\% 9
.\\9 :
ToList\\: @
(\\@ A
)\\A B
;\\B C
foreach]] 
(]] 
var]] !
claimSetResourceClaim]] *
in]]+ -"
claimSetResourceClaims]]. D
)]]D E
{^^ 	
if`` 
(`` !
claimSetResourceClaim`` %
.``% &
Action``& ,
.``, -

ActionName``- 7
==``8 :
Action``; A
.``A B
Create``B H
.``H I
Value``I N
&&``O Q
model``R W
.``W X*
AuthorizationStrategyForCreate``X v
!=``w y
$num``z {
)``{ |
{aa 
ifbb 
(bb  
parentResourceClaimsbb (
.bb( )
Anybb) ,
(bb, -
)bb- .
&&bb/ 1 
parentResourceClaimsbb2 F
.bbF G
SingleOrDefaultbbG V
(bbV W
xbbW X
=>bbY [
xcc 
.cc 
Actioncc  
.cc  !

ActionNamecc! +
==cc, .
Actioncc/ 5
.cc5 6
Createcc6 <
.cc< =
Valuecc= B
&&ccC E
xccF G
.ccG H)
AuthorizationStrategyOverrideccH e
!=ccf h
nullcci m
&&ccn p
xdd 
.dd )
AuthorizationStrategyOverridedd 7
.dd7 8#
AuthorizationStrategyIddd8 O
==ddP R
modelddS X
.ddX Y*
AuthorizationStrategyForCreateddY w
)ddw x
==ddy {
null	dd| Ä
)
ddÄ Å
{ee !
claimSetResourceClaimff )
.ff) *)
AuthorizationStrategyOverrideff* G
=ffH I-
!authorizationStrategiesDictionaryffJ k
[ffk l
modelffl q
.ffq r+
AuthorizationStrategyForCreate	ffr ê
]
ffê ë
;
ffë í
}gg 
elsehh 
ifhh 
(hh 
!hh  
parentResourceClaimshh .
.hh. /
Anyhh/ 2
(hh2 3
)hh3 4
)hh4 5
{ii !
claimSetResourceClaimjj )
.jj) *)
AuthorizationStrategyOverridejj* G
=jjH I-
!authorizationStrategiesDictionaryjjJ k
[jjk l
modeljjl q
.jjq r+
AuthorizationStrategyForCreate	jjr ê
]
jjê ë
;
jjë í
}kk 
}ll 
elsemm 
ifmm 
(mm !
claimSetResourceClaimmm *
.mm* +
Actionmm+ 1
.mm1 2

ActionNamemm2 <
==mm= ?
Actionmm@ F
.mmF G
ReadmmG K
.mmK L
ValuemmL Q
&&mmR T
modelmmU Z
.mmZ [(
AuthorizationStrategyForReadmm[ w
!=mmx z
$nummm{ |
)mm| }
{nn 
ifoo 
(oo  
parentResourceClaimsoo (
.oo( )
Anyoo) ,
(oo, -
)oo- .
&&oo/ 1 
parentResourceClaimsoo2 F
.ooF G
SingleOrDefaultooG V
(ooV W
xooW X
=>ooY [
xpp 
.pp 
Actionpp  
.pp  !

ActionNamepp! +
==pp, .
Actionpp/ 5
.pp5 6
Readpp6 :
.pp: ;
Valuepp; @
&&ppA C
xppD E
.ppE F)
AuthorizationStrategyOverrideppF c
!=ppd f
nullppg k
&&ppl n
xqq 
.qq )
AuthorizationStrategyOverrideqq 7
.qq7 8#
AuthorizationStrategyIdqq8 O
==qqP R
modelqqS X
.qqX Y(
AuthorizationStrategyForReadqqY u
)qqu v
==qqw y
nullqqz ~
)qq~ 
{rr !
claimSetResourceClaimss )
.ss) *)
AuthorizationStrategyOverridess* G
=ssH I-
!authorizationStrategiesDictionaryssJ k
[ssk l
modelssl q
.ssq r)
AuthorizationStrategyForRead	ssr é
]
ssé è
;
ssè ê
}tt 
elseuu 
ifuu 
(uu 
!uu  
parentResourceClaimsuu .
.uu. /
Anyuu/ 2
(uu2 3
)uu3 4
)uu4 5
{vv !
claimSetResourceClaimww )
.ww) *)
AuthorizationStrategyOverrideww* G
=wwH I-
!authorizationStrategiesDictionarywwJ k
[wwk l
modelwwl q
.wwq r)
AuthorizationStrategyForRead	wwr é
]
wwé è
;
wwè ê
}xx 
}yy 
elsezz 
ifzz 
(zz !
claimSetResourceClaimzz *
.zz* +
Actionzz+ 1
.zz1 2

ActionNamezz2 <
==zz= ?
Actionzz@ F
.zzF G
UpdatezzG M
.zzM N
ValuezzN S
&&zzT V
modelzzW \
.zz\ ]*
AuthorizationStrategyForUpdatezz] {
!=zz| ~
$num	zz Ä
)
zzÄ Å
{{{ 
if|| 
(||  
parentResourceClaims|| (
.||( )
Any||) ,
(||, -
)||- .
&&||/ 1 
parentResourceClaims||2 F
.||F G
SingleOrDefault||G V
(||V W
x||W X
=>||Y [
x}} 
.}} 
Action}}  
.}}  !

ActionName}}! +
==}}, .
Action}}/ 5
.}}5 6
Update}}6 <
.}}< =
Value}}= B
&&}}C E
x}}F G
.}}G H)
AuthorizationStrategyOverride}}H e
!=}}f h
null}}i m
&&}}n p
x~~ 
.~~ )
AuthorizationStrategyOverride~~ 7
.~~7 8#
AuthorizationStrategyId~~8 O
==~~P R
model~~S X
.~~X Y*
AuthorizationStrategyForUpdate~~Y w
)~~w x
==~~y {
null	~~| Ä
)
~~Ä Å
{ #
claimSetResourceClaim
ÄÄ )
.
ÄÄ) *+
AuthorizationStrategyOverride
ÄÄ* G
=
ÄÄH I/
!authorizationStrategiesDictionary
ÄÄJ k
[
ÄÄk l
model
ÄÄl q
.
ÄÄq r-
AuthorizationStrategyForUpdateÄÄr ê
]ÄÄê ë
;ÄÄë í
}
ÅÅ 
else
ÇÇ 
if
ÇÇ 
(
ÇÇ 
!
ÇÇ "
parentResourceClaims
ÇÇ .
.
ÇÇ. /
Any
ÇÇ/ 2
(
ÇÇ2 3
)
ÇÇ3 4
)
ÇÇ4 5
{
ÉÉ #
claimSetResourceClaim
ÑÑ )
.
ÑÑ) *+
AuthorizationStrategyOverride
ÑÑ* G
=
ÑÑH I/
!authorizationStrategiesDictionary
ÑÑJ k
[
ÑÑk l
model
ÑÑl q
.
ÑÑq r-
AuthorizationStrategyForUpdateÑÑr ê
]ÑÑê ë
;ÑÑë í
}
ÖÖ 
}
ÜÜ 
else
áá 
if
áá 
(
áá #
claimSetResourceClaim
áá *
.
áá* +
Action
áá+ 1
.
áá1 2

ActionName
áá2 <
==
áá= ?
Action
áá@ F
.
ááF G
Delete
ááG M
.
ááM N
Value
ááN S
&&
ááT V
model
ááW \
.
áá\ ],
AuthorizationStrategyForDelete
áá] {
!=
áá| ~
$numáá Ä
)ááÄ Å
{
àà 
if
ââ 
(
ââ "
parentResourceClaims
ââ (
.
ââ( )
Any
ââ) ,
(
ââ, -
)
ââ- .
&&
ââ/ 1"
parentResourceClaims
ââ2 F
.
ââF G
SingleOrDefault
ââG V
(
ââV W
x
ââW X
=>
ââY [
x
ää 
.
ää 
Action
ää  
.
ää  !

ActionName
ää! +
==
ää, .
Action
ää/ 5
.
ää5 6
Delete
ää6 <
.
ää< =
Value
ää= B
&&
ääC E
x
ääF G
.
ääG H+
AuthorizationStrategyOverride
ääH e
!=
ääf h
null
ääi m
&&
ään p
x
ãã 
.
ãã +
AuthorizationStrategyOverride
ãã 7
.
ãã7 8%
AuthorizationStrategyId
ãã8 O
==
ããP R
model
ããS X
.
ããX Y,
AuthorizationStrategyForDelete
ããY w
)
ããw x
==
ããy {
nullãã| Ä
)ããÄ Å
{
åå #
claimSetResourceClaim
çç )
.
çç) *+
AuthorizationStrategyOverride
çç* G
=
ççH I/
!authorizationStrategiesDictionary
ççJ k
[
ççk l
model
ççl q
.
ççq r-
AuthorizationStrategyForDeleteççr ê
]ççê ë
;ççë í
}
éé 
else
èè 
if
èè 
(
èè 
!
èè "
parentResourceClaims
èè .
.
èè. /
Any
èè/ 2
(
èè2 3
)
èè3 4
)
èè4 5
{
êê #
claimSetResourceClaim
ëë )
.
ëë) *+
AuthorizationStrategyOverride
ëë* G
=
ëëH I/
!authorizationStrategiesDictionary
ëëJ k
[
ëëk l
model
ëël q
.
ëëq r-
AuthorizationStrategyForDeleteëër ê
]ëëê ë
;ëëë í
}
íí 
}
ìì 
}
îî 	
}
ïï 
}ññ Øí
ÇC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\OverrideDefaultAuthorizationStrategyV6Service.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
;5 6
public 
class 9
-OverrideDefaultAuthorizationStrategyV6Service :
{ 
private 
readonly 
ISecurityContext %
_context& .
;. /
public 
9
-OverrideDefaultAuthorizationStrategyV6Service 8
(8 9
ISecurityContext9 I
contextJ Q
)Q R
{ 
_context 
= 
context 
; 
} 
public 

void 
Execute 
( 6
*IOverrideDefaultAuthorizationStrategyModel B
modelC H
)H I
{ 
var (
claimSetResourceClaimsToEdit (
=) *
_context+ 3
.3 4(
ClaimSetResourceClaimActions4 P
. 
Include 
( 
x 
=> 
x 
. 
ResourceClaim )
)) *
. 
Include 
( 
x 
=> 
x 
. 
Action "
)" #
. 
Include 
( 
x 
=> 
x 
. 
ClaimSet $
)$ %
. 
Include 
( 
x 
=> 
x 
. *
AuthorizationStrategyOverrides :
.: ;
Select; A
(A B
xB C
=>D F
xG H
.H I!
AuthorizationStrategyI ^
)^ _
)_ `
. 
Where 
( 
x 
=> 
x 
. 
ResourceClaim $
.$ %
ResourceClaimId% 4
==5 7
model8 =
.= >
ResourceClaimId> M
&&N P
x   
.   
ClaimSet   
.    

ClaimSetId    *
==  + -
model  . 3
.  3 4

ClaimSetId  4 >
)  > ?
.!! 
ToList!! 
(!! 
)!! 
;!! 
var## !
parentResourceClaimId## !
=##" #
_context##$ ,
.##, -
ResourceClaims##- ;
.$$ 
Single$$ 
($$ 
x$$ 
=>$$ 
x$$ 
.$$ 
ResourceClaimId$$ *
==$$+ -
model$$. 3
.$$3 4
ResourceClaimId$$4 C
)$$C D
.$$D E!
ParentResourceClaimId$$E Z
;$$Z [
var&&  
parentResourceClaims&&  
=&&! "
new&&# &
List&&' +
<&&+ ,'
ClaimSetResourceClaimAction&&, G
>&&G H
(&&H I
)&&I J
;&&J K
if(( 

((( !
parentResourceClaimId(( !
!=((" $
null((% )
)(() *
{)) 	 
parentResourceClaims**  
=**! "
_context**# +
.**+ ,(
ClaimSetResourceClaimActions**, H
.++ 
Include++ 
(++ 
x++ 
=>++ 
x++ 
.++  
ResourceClaim++  -
)++- .
.,, 
Include,, 
(,, 
x,, 
=>,, 
x,, 
.,,  
Action,,  &
),,& '
.-- 
Include-- 
(-- 
x-- 
=>-- 
x-- 
.--  
ClaimSet--  (
)--( )
... 
Include.. 
(.. 
x.. 
=>.. 
x.. 
...  *
AuthorizationStrategyOverrides..  >
...> ?
Select..? E
(..E F
x..F G
=>..H J
x..K L
...L M!
AuthorizationStrategy..M b
)..b c
)..c d
.// 
Where// 
(// 
x00 
=>00 
x00 
.00 
ResourceClaim00 (
.00( )
ResourceClaimId00) 8
==009 ;!
parentResourceClaimId00< Q
&&00R T
x11 
.11 
ClaimSet11 #
.11# $

ClaimSetId11$ .
==11/ 1
model112 7
.117 8

ClaimSetId118 B
)11B C
.22 
ToList22 
(22 
)22 
;22 
}33 	
var55 -
!authorizationStrategiesDictionary55 -
=55. /
new66 

Dictionary66 
<66 
int66 
,66 
EdFi66  $
.66$ %
Security66% -
.66- .

DataAccess66. 8
.668 9
Models669 ?
.66? @!
AuthorizationStrategy66@ U
>66U V
(66V W
)66W X
;66X Y
foreach88 
(88 
var88 
authStrategy88 !
in88" $
_context88% -
.88- .#
AuthorizationStrategies88. E
.88E F
ToList88F L
(88L M
)88M N
)88N O
{99 	-
!authorizationStrategiesDictionary:: -
[::- .
authStrategy::. :
.::: ;#
AuthorizationStrategyId::; R
]::R S
=::T U
authStrategy::V b
;::b c
};; 	(
claimSetResourceClaimsToEdit== $
===% &
RemoveOverrides==' 6
(==6 7
model==7 <
,==< =(
claimSetResourceClaimsToEdit==> Z
)==Z [
;==[ \
AddOverrides?? 
(?? 
model?? 
,?? (
claimSetResourceClaimsToEdit?? 8
,??8 9-
!authorizationStrategiesDictionary??: [
,??[ \ 
parentResourceClaims??] q
)??q r
;??r s
_contextAA 
.AA 
SaveChangesAA 
(AA 
)AA 
;AA 
}BB 
privateDD 
ListDD 
<DD '
ClaimSetResourceClaimActionDD ,
>DD, -
RemoveOverridesDD. =
(DD= >6
*IOverrideDefaultAuthorizationStrategyModelEE 2
modelEE3 8
,EE8 9
IEnumerableFF 
<FF '
ClaimSetResourceClaimActionFF /
>FF/ 0 
resourceClaimsToEditFF1 E
)FFE F
{GG 
varHH "
claimSetResourceClaimsHH "
=HH# $ 
resourceClaimsToEditHH% 9
.HH9 :
ToListHH: @
(HH@ A
)HHA B
;HHB C
foreachJJ 
(JJ 
varJJ !
claimSetResourceClaimJJ *
inJJ+ -"
claimSetResourceClaimsJJ. D
)JJD E
{KK 	
ifLL 
(LL !
claimSetResourceClaimLL %
.LL% &
ActionLL& ,
.LL, -

ActionNameLL- 7
==LL8 :
ActionLL; A
.LLA B
CreateLLB H
.LLH I
ValueLLI N
&&LLO Q
modelMM 
.MM *
AuthorizationStrategyForCreateMM 4
==MM5 7
$numMM8 9
)MM9 :
{NN !
claimSetResourceClaimOO %
.OO% &*
AuthorizationStrategyOverridesOO& D
=OOE F
nullOOG K
;OOK L
}PP 
elseQQ 
ifQQ 
(QQ !
claimSetResourceClaimQQ *
.QQ* +
ActionQQ+ 1
.QQ1 2

ActionNameQQ2 <
==QQ= ?
ActionQQ@ F
.QQF G
ReadQQG K
.QQK L
ValueQQL Q
&&QQR T
modelRR 
.RR (
AuthorizationStrategyForReadRR 7
==RR8 :
$numRR; <
)RR< =
{SS !
claimSetResourceClaimTT %
.TT% &*
AuthorizationStrategyOverridesTT& D
=TTE F
nullTTG K
;TTK L
}UU 
elseVV 
ifVV 
(VV !
claimSetResourceClaimVV *
.VV* +
ActionVV+ 1
.VV1 2

ActionNameVV2 <
==VV= ?
ActionVV@ F
.VVF G
UpdateVVG M
.VVM N
ValueVVN S
&&VVT V
modelWW 
.WW *
AuthorizationStrategyForUpdateWW 9
==WW: <
$numWW= >
)WW> ?
{XX !
claimSetResourceClaimYY %
.YY% &*
AuthorizationStrategyOverridesYY& D
=YYE F
nullYYG K
;YYK L
}ZZ 
else[[ 
if[[ 
([[ !
claimSetResourceClaim[[ *
.[[* +
Action[[+ 1
.[[1 2

ActionName[[2 <
==[[= ?
Action[[@ F
.[[F G
Delete[[G M
.[[M N
Value[[N S
&&[[T V
model\\ 
.\\ *
AuthorizationStrategyForDelete\\ 9
==\\: <
$num\\= >
)\\> ?
{]] !
claimSetResourceClaim^^ %
.^^% &*
AuthorizationStrategyOverrides^^& D
=^^E F
null^^G K
;^^K L
}__ K
?RemoveClaimSetResourceClaimActionAuthorizationStrategyOverridesaa K
(aaK L!
claimSetResourceClaimaaL a
)aaa b
;aab c
}bb 	
voiddd K
?RemoveClaimSetResourceClaimActionAuthorizationStrategyOverridesdd L
(ddL M'
ClaimSetResourceClaimActionddM h(
claimSetResourceClaimAction	ddi Ñ
)
ddÑ Ö
{ee 	
varff  
existingAuthOverrideff $
=ff% &
_contextgg 
.gg E
9ClaimSetResourceClaimActionAuthorizationStrategyOverridesgg R
.ggR S
FirstOrDefaultggS a
(gga b
xhh 
=>hh 
xhh 
.hh )
ClaimSetResourceClaimActionIdhh 8
==hh9 ;'
claimSetResourceClaimActionii 4
.ii4 5)
ClaimSetResourceClaimActionIdii5 R
)iiR S
;iiS T
ifkk 
(kk  
existingAuthOverridekk $
!=kk% '
nullkk( ,
)kk, -
{ll 
_contextmm 
.mm E
9ClaimSetResourceClaimActionAuthorizationStrategyOverridesmm R
.mmR S
RemovemmS Y
(mmY Z 
existingAuthOverridenn (
)nn( )
;nn) *
}oo 
}pp 	
returnrr "
claimSetResourceClaimsrr %
;rr% &
}ss 
privateuu 
staticuu 
voiduu 
AddOverridesuu $
(uu$ %6
*IOverrideDefaultAuthorizationStrategyModeluu% O
modeluuP U
,uuU V
IEnumerablevv 
<vv '
ClaimSetResourceClaimActionvv /
>vv/ 0 
resourceClaimsToEditvv1 E
,vvE F

Dictionaryww 
<ww 
intww 
,ww 
EdFiww 
.ww 
Securityww %
.ww% &

DataAccessww& 0
.ww0 1
Modelsww1 7
.ww7 8!
AuthorizationStrategyww8 M
>wwM N-
!authorizationStrategiesDictionarywwO p
,wwp q
Listxx 
<xx '
ClaimSetResourceClaimActionxx (
>xx( ) 
parentResourceClaimsxx* >
)xx> ?
{yy 
varzz "
claimSetResourceClaimszz "
=zz# $ 
resourceClaimsToEditzz% 9
.zz9 :
ToListzz: @
(zz@ A
)zzA B
;zzB C
foreach|| 
(|| 
var|| !
claimSetResourceClaim|| *
in||+ -"
claimSetResourceClaims||. D
)||D E
{}} 	
if 
( !
claimSetResourceClaim %
.% &
Action& ,
., -

ActionName- 7
==8 :
Action; A
.A B
CreateB H
.H I
ValueI N
&&O Q
model
ÄÄ 
.
ÄÄ ,
AuthorizationStrategyForCreate
ÄÄ 4
!=
ÄÄ5 7
$num
ÄÄ8 9
)
ÄÄ9 :
{
ÅÅ /
!SetAuthorizationStrategyOverrides
ÇÇ 1
(
ÇÇ1 2#
claimSetResourceClaim
ÉÉ )
,
ÉÉ) *"
parentResourceClaims
ÉÉ+ ?
,
ÉÉ? @
model
ÉÉA F
.
ÉÉF G,
AuthorizationStrategyForCreate
ÉÉG e
,
ÉÉe f/
!authorizationStrategiesDictionary
ÑÑ 5
,
ÑÑ5 6
Action
ÑÑ7 =
.
ÑÑ= >
Create
ÑÑ> D
.
ÑÑD E
Value
ÑÑE J
)
ÑÑJ K
;
ÑÑK L
}
ÖÖ 
else
ÜÜ 
if
ÜÜ 
(
ÜÜ #
claimSetResourceClaim
ÜÜ *
.
ÜÜ* +
Action
ÜÜ+ 1
.
ÜÜ1 2

ActionName
ÜÜ2 <
==
ÜÜ= ?
Action
ÜÜ@ F
.
ÜÜF G
Read
ÜÜG K
.
ÜÜK L
Value
ÜÜL Q
&&
ÜÜR T
model
áá 
.
áá *
AuthorizationStrategyForRead
áá 7
!=
áá8 :
$num
áá; <
)
áá< =
{
àà /
!SetAuthorizationStrategyOverrides
ââ 1
(
ââ1 2#
claimSetResourceClaim
ää )
,
ää) *"
parentResourceClaims
ää+ ?
,
ää? @
model
ääA F
.
ääF G*
AuthorizationStrategyForRead
ääG c
,
ääc d/
!authorizationStrategiesDictionary
ãã 5
,
ãã5 6
Action
ãã7 =
.
ãã= >
Read
ãã> B
.
ããB C
Value
ããC H
)
ããH I
;
ããI J
}
åå 
else
çç 
if
çç 
(
çç #
claimSetResourceClaim
çç *
.
çç* +
Action
çç+ 1
.
çç1 2

ActionName
çç2 <
==
çç= ?
Action
çç@ F
.
ççF G
Update
ççG M
.
ççM N
Value
ççN S
&&
ççT V
model
éé 
.
éé ,
AuthorizationStrategyForUpdate
éé 9
!=
éé: <
$num
éé= >
)
éé> ?
{
èè /
!SetAuthorizationStrategyOverrides
êê 1
(
êê1 2#
claimSetResourceClaim
ëë )
,
ëë) *"
parentResourceClaims
ëë+ ?
,
ëë? @
model
ëëA F
.
ëëF G,
AuthorizationStrategyForUpdate
ëëG e
,
ëëe f/
!authorizationStrategiesDictionary
íí 5
,
íí5 6
Action
íí7 =
.
íí= >
Update
íí> D
.
ííD E
Value
ííE J
)
ííJ K
;
ííK L
}
ìì 
else
îî 
if
îî 
(
îî #
claimSetResourceClaim
îî *
.
îî* +
Action
îî+ 1
.
îî1 2

ActionName
îî2 <
==
îî= ?
Action
îî@ F
.
îîF G
Delete
îîG M
.
îîM N
Value
îîN S
&&
îîT V
model
ïï 
.
ïï ,
AuthorizationStrategyForDelete
ïï 9
!=
ïï: <
$num
ïï= >
)
ïï> ?
{
ññ /
!SetAuthorizationStrategyOverrides
óó 1
(
óó1 2#
claimSetResourceClaim
òò )
,
òò) *"
parentResourceClaims
òò+ ?
,
òò? @
model
òòA F
.
òòF G,
AuthorizationStrategyForDelete
òòG e
,
òòe f/
!authorizationStrategiesDictionary
ôô 5
,
ôô5 6
Action
ôô7 =
.
ôô= >
Delete
ôô> D
.
ôôD E
Value
ôôE J
)
ôôJ K
;
ôôK L
}
öö 
}
õõ 	
}
úú 
private
ûû 
static
ûû 
void
ûû /
!SetAuthorizationStrategyOverrides
ûû 9
(
ûû9 :)
ClaimSetResourceClaimAction
üü #)
claimSetResourceClaimAction
üü$ ?
,
üü? @
List
†† 
<
†† )
ClaimSetResourceClaimAction
†† (
>
††( )"
parentResourceClaims
††* >
,
††> ?
int
††@ C(
authorizationStrategyValue
††D ^
,
††^ _

Dictionary
°° 
<
°° 
int
°° 
,
°° 
EdFi
°° 
.
°° 
Security
°° %
.
°°% &

DataAccess
°°& 0
.
°°0 1
Models
°°1 7
.
°°7 8#
AuthorizationStrategy
°°8 M
>
°°M N/
!authorizationStrategiesDictionary
¢¢ -
,
¢¢- .
string
¢¢/ 5

actionName
¢¢6 @
)
¢¢@ A
{
££ 
var
§§ #
authStrategyOverrides
§§ !
=
§§" #
new
§§$ '
List
§§( ,
<
§§, -G
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides
§§- f
>
§§f g
{
•• 	
new
¶¶ 
(
¶¶ 
)
¶¶ 
{
¶¶ #
AuthorizationStrategy
¶¶ )
=
¶¶* +/
!authorizationStrategiesDictionary
¶¶, M
[
¶¶M N(
authorizationStrategyValue
¶¶N h
]
¶¶h i
}
¶¶j k
}
ßß 	
;
ßß	 

if
©© 

(
©© "
parentResourceClaims
©©  
.
©©  !
Any
©©! $
(
©©$ %
)
©©% &
&&
©©' )"
parentResourceClaims
©©* >
.
©©> ?
SingleOrDefault
©©? N
(
©©N O
x
™™ 
=>
™™ 
x
´´ 
.
´´ 
Action
´´ 
.
´´ 

ActionName
´´ '
==
´´( *

actionName
´´+ 5
&&
´´6 8
x
´´9 :
.
´´: ;,
AuthorizationStrategyOverrides
´´; Y
!=
´´Z \
null
´´] a
&&
´´b d
x
¨¨ 
.
¨¨ ,
AuthorizationStrategyOverrides
¨¨ 4
.
¨¨4 5
Any
¨¨5 8
(
¨¨8 9
)
¨¨9 :
&&
¨¨; =
x
≠≠ 
.
≠≠ ,
AuthorizationStrategyOverrides
≠≠ 4
.
≠≠4 5
SingleOrDefault
≠≠5 D
(
≠≠D E
)
≠≠E F
?
≠≠F G
.
≠≠G H%
AuthorizationStrategyId
≠≠H _
==
≠≠` b(
authorizationStrategyValue
ÆÆ .
)
ÆÆ. /
==
ÆÆ0 2
null
ÆÆ3 7
)
ÆÆ7 8
{
ØØ 	)
claimSetResourceClaimAction
∞∞ '
.
∞∞' (,
AuthorizationStrategyOverrides
∞∞( F
=
∞∞G H#
authStrategyOverrides
∞∞I ^
;
∞∞^ _
}
±± 	
else
≤≤ 
if
≤≤ 
(
≤≤ 
!
≤≤ "
parentResourceClaims
≤≤ &
.
≤≤& '
Any
≤≤' *
(
≤≤* +
)
≤≤+ ,
)
≤≤, -
{
≥≥ 	)
claimSetResourceClaimAction
¥¥ '
.
¥¥' (,
AuthorizationStrategyOverrides
¥¥( F
=
¥¥G H#
authStrategyOverrides
¥¥I ^
;
¥¥^ _
}
µµ 	
}
∂∂ 
}∑∑ ì
vC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\ResetToDefaultAuthStrategyCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class -
!ResetToDefaultAuthStrategyCommand 2
{		 
private

 
readonly

 ,
 IOdsSecurityModelVersionResolver

 9
	_resolver

: C
;

C D
private 
readonly 7
+ResetToDefaultAuthStrategyCommandV53Service D
_v53ServiceE P
;P Q
private 
readonly 6
*ResetToDefaultAuthStrategyCommandV6Service C

_v6ServiceD N
;N O
public -
!ResetToDefaultAuthStrategyCommand 0
(0 1,
 IOdsSecurityModelVersionResolver1 Q
resolverR Z
,Z [7
+ResetToDefaultAuthStrategyCommandV53Service 7

v53Service8 B
,B C6
*ResetToDefaultAuthStrategyCommandV6Service 6
	v6Service7 @
)@ A
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
void 
Execute 
( ,
 IResetToDefaultAuthStrategyModel <
model= B
)B C
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
_v53Service 
. 
Execute #
(# $
model$ )
)) *
;* +
else 
if 
( 
securityModel "
==# %-
!EdFiOdsSecurityModelCompatibility& G
.G H
SixH K
)K L

_v6Service 
. 
Execute "
(" #
model# (
)( )
;) *
else 
throw 
new 6
*EdFiOdsSecurityModelCompatibilityException D
(D E
securityModelE R
)R S
;S T
}   	
}!! 
public## 

	interface## ,
 IResetToDefaultAuthStrategyModel## 5
{$$ 
int%% 

ClaimSetId%% 
{%% 
get%% 
;%% 
}%% 
int&& 
ResourceClaimId&& 
{&& 
get&& !
;&&! "
}&&# $
}'' 
}(( ’
ÄC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\ResetToDefaultAuthStrategyCommandV53Service.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
ClaimSetEditor

' 5
{ 
public 

class 7
+ResetToDefaultAuthStrategyCommandV53Service <
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public 7
+ResetToDefaultAuthStrategyCommandV53Service :
(: ;
ISecurityContext; K
contextL S
)S T
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
( ,
 IResetToDefaultAuthStrategyModel <
model= B
)B C
{ 	
var (
claimSetResourceClaimsToEdit ,
=- .
_context/ 7
.7 8"
ClaimSetResourceClaims8 N
. 
Include 
( 
x 
=> 
x 
.  
ResourceClaim  -
)- .
. 
Include 
( 
x 
=> 
x 
.  
Action  &
)& '
. 
Include 
( 
x 
=> 
x 
.  
ClaimSet  (
)( )
. 
Include 
( 
x 
=> 
x 
.  )
AuthorizationStrategyOverride  =
)= >
. 
Where 
( 
x 
=> 
x 
. 
ResourceClaim +
.+ ,
ResourceClaimId, ;
==< >
model? D
.D E
ResourceClaimIdE T
&&U W
xX Y
.Y Z
ClaimSetZ b
.b c

ClaimSetIdc m
==n p
modelq v
.v w

ClaimSetId	w Å
)
Å Ç
. 
ToList 
( 
) 
; 
foreach 
( 
var !
claimSetResourceClaim .
in/ 1(
claimSetResourceClaimsToEdit2 N
)N O
{   !
claimSetResourceClaim!! %
.!!% &)
AuthorizationStrategyOverride!!& C
=!!D E
null!!F J
;!!J K
}"" 
_context$$ 
.$$ 
SaveChanges$$  
($$  !
)$$! "
;$$" #
}%% 	
}&& 
}'' œ
C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\ResetToDefaultAuthStrategyCommandV6Service.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
ClaimSetEditor

' 5
{ 
public 

class 6
*ResetToDefaultAuthStrategyCommandV6Service ;
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
public 6
*ResetToDefaultAuthStrategyCommandV6Service 9
(9 :
ISecurityContext: J
contextK R
)R S
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
( ,
 IResetToDefaultAuthStrategyModel <
model= B
)B C
{ 	
var (
claimSetResourceClaimsToEdit ,
=- .
_context/ 7
.7 8(
ClaimSetResourceClaimActions8 T
. 
Include 
( 
x 
=> 
x 
.  
ResourceClaim  -
)- .
. 
Include 
( 
x 
=> 
x 
.  
Action  &
)& '
. 
Include 
( 
x 
=> 
x 
.  
ClaimSet  (
)( )
. 
Include 
( 
x 
=> 
x 
.  *
AuthorizationStrategyOverrides  >
)> ?
. 
Where 
( 
x 
=> 
x 
. 
ResourceClaim +
.+ ,
ResourceClaimId, ;
==< >
model? D
.D E
ResourceClaimIdE T
&&U W
xX Y
.Y Z
ClaimSetZ b
.b c

ClaimSetIdc m
==n p
modelq v
.v w

ClaimSetId	w Å
)
Å Ç
. 
ToList 
( 
) 
; 
foreach 
( 
var !
claimSetResourceClaim .
in/ 1(
claimSetResourceClaimsToEdit2 N
)N O
{   
var!! +
existingAuthorizationStrategies!! 3
=!!4 5
_context!!6 >
.!!> ?E
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides!!? x
.!!x y
First!!y ~
(!!~ 
x	!! Ä
=>
!!Å É
x
!!Ñ Ö
.
!!Ö Ü+
ClaimSetResourceClaimActionId
!!Ü £
==
!!§ ¶#
claimSetResourceClaim
!!ß º
.
!!º Ω+
ClaimSetResourceClaimActionId
!!Ω ⁄
)
!!⁄ €
;
!!€ ‹
if"" 
("" +
existingAuthorizationStrategies"" 3
!=""4 6
null""7 ;
)""; <
{## 
_context$$ 
.$$ E
9ClaimSetResourceClaimActionAuthorizationStrategyOverrides$$ V
.$$V W
Remove$$W ]
($$] ^+
existingAuthorizationStrategies$$^ }
)$$} ~
;$$~ 
}%% !
claimSetResourceClaim&& %
.&&% &*
AuthorizationStrategyOverrides&&& D
=&&E F
null&&G K
;&&K L
}'' 
_context)) 
.)) 
SaveChanges))  
())  !
)))! "
;))" #
}** 	
}++ 
},, “
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\ResourceClaim.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ClaimSetEditor		' 5
{

 
public 

class 
ResourceClaim 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
ParentId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 

ParentName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
Read 
{ 
get 
; 
set  #
;# $
}% &
public 
bool 
Create 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
Update 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
Delete 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

JsonIgnore	 
] 
public 
bool 
IsParent 
{ 
get "
;" #
set$ '
;' (
}) *
public !
AuthorizationStrategy $
[$ %
]% &(
DefaultAuthStrategiesForCRUD' C
{D E
getF I
;I J
setK N
;N O
}P Q
public !
AuthorizationStrategy $
[$ %
]% &(
AuthStrategyOverridesForCRUD' C
{D E
getF I
;I J
setK N
;N O
}P Q
public 
List 
< 
ResourceClaim !
>! "
Children# +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
ResourceClaim 
( 
) 
{ 	
Children 
= 
new 
List 
< 
ResourceClaim ,
>, -
(- .
). /
;/ 0
} 	
} 
}   è
aC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\SharingModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{ 
public 

class 
SharingModel 
{ 
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
SharingTemplate 
Template '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
static 
string %
SerializeFromSharingModel 6
(6 7
SharingModel7 C
modelD I
)I J
{ 	
return 
JsonConvert 
. 
SerializeObject .
(. /
model/ 4
,4 5"
UsingIndentedCamelCase6 L
(L M
)M N
)N O
;O P
} 	
public 
static 
SharingModel "%
DeserializeToSharingModel# <
(< =
Stream= C

jsonStreamD N
)N O
{ 	
using 
( 
var 
streamReader #
=$ %
new& )
StreamReader* 6
(6 7

jsonStream7 A
)A B
)B C
using 
( 

JsonReader !

jsonReader" ,
=- .
new/ 2
JsonTextReader3 A
(A B
streamReaderB N
)N O
)O P
{ 
return 
JsonSerializer )
. 
Create 
(  "
UsingIndentedCamelCase  6
(6 7
)7 8
)8 9
. 
Deserialize $
<$ %
SharingModel% 1
>1 2
(2 3

jsonReader3 =
)= >
;> ?
}   
}!! 	
private## 
static## "
JsonSerializerSettings## -"
UsingIndentedCamelCase##. D
(##D E
)##E F
{$$ 	
return%% 
new%% "
JsonSerializerSettings%% -
{&& 
ContractResolver''  
=''! "
new''# &2
&CamelCasePropertyNamesContractResolver''' M
(''M N
)''N O
,''O P

Formatting(( 
=(( 

Formatting(( '
.((' (
Indented((( 0
})) 
;)) 
}** 	
}++ 
public-- 

class-- 
SharingTemplate--  
{.. 
public// 
SharingClaimSet// 
[// 
]//  
	ClaimSets//! *
{//+ ,
get//- 0
;//0 1
set//2 5
;//5 6
}//7 8
}00 
public22 

class22 
SharingClaimSet22  
{33 
public44 
string44 
Name44 
{44 
get44  
;44  !
set44" %
;44% &
}44' (
public55 
List55 
<55 
JObject55 
>55 
ResourceClaims55 +
{55, -
get55. 1
;551 2
set553 6
;556 7
}558 9
}66 
}77 √
uC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\UpdateResourcesOnClaimSetCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ClaimSetEditor' 5
{		 
public

 

class

 ,
 UpdateResourcesOnClaimSetCommand

 1
{ 
private 
readonly ,
 IOdsSecurityModelVersionResolver 9
	_resolver: C
;C D
private 
readonly 6
*UpdateResourcesOnClaimSetCommandV53Service C
_v53ServiceD O
;O P
private 
readonly 5
)UpdateResourcesOnClaimSetCommandV6Service B

_v6ServiceC M
;M N
public ,
 UpdateResourcesOnClaimSetCommand /
(/ 0,
 IOdsSecurityModelVersionResolver0 P
resolverQ Y
,Y Z6
*UpdateResourcesOnClaimSetCommandV53Service 6

v53Service7 A
,A B5
)UpdateResourcesOnClaimSetCommandV6Service 5
	v6Service6 ?
)? @
{ 	
	_resolver 
= 
resolver  
;  !
_v53Service 
= 

v53Service $
;$ %

_v6Service 
= 
	v6Service "
;" #
} 	
public 
void 
Execute 
( +
IUpdateResourcesOnClaimSetModel ;
model< A
)A B
{ 	
var 
securityModel 
= 
	_resolver  )
.) *"
DetermineSecurityModel* @
(@ A
)A B
;B C
if 
( 
securityModel 
==  -
!EdFiOdsSecurityModelCompatibility! B
.B C
ThreeThroughFiveC S
)S T
_v53Service 
. 
Execute #
(# $
model$ )
)) *
;* +
else 
if 
( 
securityModel "
==# %-
!EdFiOdsSecurityModelCompatibility& G
.G H
SixH K
)K L

_v6Service 
. 
Execute "
(" #
model# (
)( )
;) *
else   
throw!! 
new!! 6
*EdFiOdsSecurityModelCompatibilityException!! D
(!!D E
securityModel!!E R
)!!R S
;!!S T
}"" 	
}## 
public%% 

	interface%% +
IUpdateResourcesOnClaimSetModel%% 4
{&& 
int'' 

ClaimSetId'' 
{'' 
get'' 
;'' 
}'' 
List(( 
<(( 
ResourceClaim(( 
>(( 
ResourceClaims(( *
{((+ ,
get((- 0
;((0 1
}((2 3
})) 
}** ¨
C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\UpdateResourcesOnClaimSetCommandV53Service.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ClaimSetEditor		' 5
{

 
public 

class 6
*UpdateResourcesOnClaimSetCommandV53Service ;
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
private 
readonly /
#AddOrEditResourcesOnClaimSetCommand <0
$_addOrEditResourcesOnClaimSetCommand= a
;a b
public 6
*UpdateResourcesOnClaimSetCommandV53Service 9
(9 :
ISecurityContext: J
contextK R
,R S/
#AddOrEditResourcesOnClaimSetCommand //
#addOrEditResourcesOnClaimSetCommand0 S
)S T
{ 	
_context 
= 
context 
; 0
$_addOrEditResourcesOnClaimSetCommand 0
=1 2/
#addOrEditResourcesOnClaimSetCommand3 V
;V W
} 	
public 
void 
Execute 
( +
IUpdateResourcesOnClaimSetModel ;
model< A
)A B
{ 	
var %
resourceClaimsForClaimSet )
=* +
_context 
. "
ClaimSetResourceClaims /
./ 0
Where0 5
(5 6
x6 7
=>8 :
x; <
.< =
ClaimSet= E
.E F

ClaimSetIdF P
==Q S
modelT Y
.Y Z

ClaimSetIdZ d
)d e
.e f
ToListf l
(l m
)m n
;n o
_context 
. "
ClaimSetResourceClaims +
.+ ,
RemoveRange, 7
(7 8%
resourceClaimsForClaimSet8 Q
)Q R
;R S
_context 
. 
SaveChanges  
(  !
)! "
;" #0
$_addOrEditResourcesOnClaimSetCommand 0
.0 1
Execute1 8
(8 9
model9 >
.> ?

ClaimSetId? I
,I J
modelK P
.P Q
ResourceClaimsQ _
)_ `
;` a
} 	
}   
}!! µ
~C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ClaimSetEditor\UpdateResourcesOnClaimSetCommandV6Service.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ClaimSetEditor		' 5
{

 
public 

class 5
)UpdateResourcesOnClaimSetCommandV6Service :
{ 
private 
readonly 
ISecurityContext )
_context* 2
;2 3
private 
readonly /
#AddOrEditResourcesOnClaimSetCommand <0
$_addOrEditResourcesOnClaimSetCommand= a
;a b
public 5
)UpdateResourcesOnClaimSetCommandV6Service 8
(8 9
ISecurityContext9 I
contextJ Q
,Q R/
#AddOrEditResourcesOnClaimSetCommand //
#addOrEditResourcesOnClaimSetCommand0 S
)S T
{ 	
_context 
= 
context 
; 0
$_addOrEditResourcesOnClaimSetCommand 0
=1 2/
#addOrEditResourcesOnClaimSetCommand3 V
;V W
} 	
public 
void 
Execute 
( +
IUpdateResourcesOnClaimSetModel ;
model< A
)A B
{ 	
var %
resourceClaimsForClaimSet )
=* +
_context 
. (
ClaimSetResourceClaimActions 5
.5 6
Where6 ;
(; <
x< =
=>> @
xA B
.B C
ClaimSetC K
.K L

ClaimSetIdL V
==W Y
modelZ _
._ `

ClaimSetId` j
)j k
.k l
ToListl r
(r s
)s t
;t u
_context 
. (
ClaimSetResourceClaimActions 1
.1 2
RemoveRange2 =
(= >%
resourceClaimsForClaimSet> W
)W X
;X Y
_context 
. 
SaveChanges  
(  !
)! "
;" #0
$_addOrEditResourcesOnClaimSetCommand 0
.0 1
Execute1 8
(8 9
model9 >
.> ?

ClaimSetId? I
,I J
modelK P
.P Q
ResourceClaimsQ _
)_ `
;` a
} 	
}   
}!! π
VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\CloudOdsAdminApp.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

static 
class 
CloudOdsAdminApp (
{		 
public

 
const

 
string

 
ApplicationName

 +
=

, -
$str

. C
;

C D
public 
const 
string *
SecurityContextApplicationName :
=; <
$str= L
;L M
public 
const 
string 

VendorName &
=' (
$str) /
;/ 0
public 
const 
string !
VendorNamespacePrefix 1
=2 3
$str4 F
;F G
public 
const 
string $
InternalAdminAppClaimSet 4
=5 6
$str7 L
;L M
public 
static 
readonly 
string %
[% &
]& '#
SystemReservedClaimSets( ?
=@ A
{ 	$
InternalAdminAppClaimSet $
,$ %
$str .
} 	
;	 

public 
static 
readonly 
string %
[% &
]& '
DefaultClaimSets( 8
=9 :
{ 	
$str 
, 
$str 
, 
$str 
, 
$str 
,  
$str 
, 
$str (
,( )
$str 
, 
$str .
,. /
$str   +
}!! 	
;!!	 

}"" 
}## π
YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\CloudOdsEnvironment.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
CloudOdsEnvironment $
:% &
Enumeration' 2
<2 3
CloudOdsEnvironment3 F
>F G
{		 
public

 
static

 
readonly

 
CloudOdsEnvironment

 2

Production

3 =
=

> ?
new

@ C
CloudOdsEnvironment

D W
(

W X
$num

X Y
,

Y Z
$str

[ g
)

g h
;

h i
private 
CloudOdsEnvironment #
(# $
int$ '
value( -
,- .
string/ 5
displayName6 A
)A B
:C D
baseE I
(I J
valueJ O
,O P
displayNameQ \
)\ ]
{ 	
} 	
} 
} ë

VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\CloudOdsInstance.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
CloudOdsInstance !
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
InstanceType "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 

IsExtended 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
FriendlyName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Version 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} —
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\CloudOdsOperationContext.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

	interface %
ICloudOdsOperationContext .
{		 
CloudOdsInstance

 
Instance

 !
{

" #
get

$ '
;

' (
}

) *
CloudOdsEnvironment 
TargetEnvironment -
{. /
get0 3
;3 4
}5 6
CloudOdsRole 

TargetRole 
{  !
get" %
;% &
}' (
} 
public 

class $
CloudOdsOperationContext )
:* +%
ICloudOdsOperationContext, E
{ 
public 
CloudOdsInstance 
Instance  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
CloudOdsEnvironment "
TargetEnvironment# 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
CloudOdsRole 

TargetRole &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
public 

class '
CloudOdsApiOperationContext ,
:- .%
ICloudOdsOperationContext/ H
{ 
public '
CloudOdsApiOperationContext *
(* +
CloudOdsInstance+ ;
instance< D
)D E
{ 	
Instance 
= 
instance 
;  
TargetEnvironment 
= 
CloudOdsEnvironment  3
.3 4

Production4 >
;> ?
} 	
public 
CloudOdsInstance 
Instance  (
{) *
get+ .
;. /
}0 1
public 
CloudOdsEnvironment "
TargetEnvironment# 4
{5 6
get7 :
;: ;
}< =
public 
CloudOdsRole 

TargetRole &
=>' )
CloudOdsRole* 6
.6 7
Api7 :
;: ;
}   
}!! ô
RC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\CloudOdsRole.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
CloudOdsRole 
: 
Enumeration  +
<+ ,
CloudOdsRole, 8
>8 9
{		 
public

 
static

 
readonly

 
CloudOdsRole

 +
AdminApp

, 4
=

5 6
new

7 :
CloudOdsRole

; G
(

G H
$num

H I
,

I J
$str

K U
)

U V
;

V W
public 
static 
readonly 
CloudOdsRole +
Api, /
=0 1
new2 5
CloudOdsRole6 B
(B C
$numC D
,D E
$strF K
)K L
;L M
public 
static 
readonly 
CloudOdsRole +
Swagger, 3
=4 5
new6 9
CloudOdsRole: F
(F G
$numG H
,H I
$strJ S
)S T
;T U
	protected 
CloudOdsRole 
( 
int "
value# (
,( )
string* 0
displayName1 <
)< =
:> ?
base@ D
(D E
valueE J
,J K
displayNameL W
)W X
{ 	
} 	
} 
} ï
TC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\CloudOdsStatus.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
CloudOdsStatus 
:  !
Enumeration" -
<- .
CloudOdsStatus. <
>< =
{		 
public 
static 
readonly 
CloudOdsStatus -
Ok. 0
=1 2
new3 6
CloudOdsStatus7 E
(E F
$numF I
,I J
$strK O
)O P
;P Q
	protected 
CloudOdsStatus  
(  !
int! $
value% *
,* +
string, 2
displayName3 >
)> ?
:@ A
baseB F
(F G
valueG L
,L M
displayNameN Y
)Y Z
{ 	
} 	
} 
} ´
UC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\CloudOdsWebsite.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{		 
public

 

class

 
CloudOdsWebsite

  
{ 
public 
CloudOdsWebsite 
( 
)  
{ 	
Tags 
= 
new 

Dictionary !
<! "
string" (
,( )
string* 0
>0 1
(1 2
)2 3
;3 4
} 	
public 
string 
SystemId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

SystemName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
public 
CloudOdsEnvironment "
Environment# .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
CloudOdsRole 
Role  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

Dictionary 
< 
string  
,  !
string" (
>( )
Tags* .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} ¡"
_C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\CloudOdsWebsiteExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{		 
public

 

static

 
class

 %
CloudOdsWebsiteExtensions

 1
{ 
public 
static 
bool 
HasTag !
(! "
this" &
CloudOdsWebsite' 6
site7 ;
,; <
string= C
tagNameD K
)K L
{ 	
return 
site 
. 
Tags 
!= 
null  $
&&% '
site( ,
., -
Tags- 1
.1 2
ContainsKey2 =
(= >
tagName> E
)E F
;F G
} 	
public 
static 
bool 
HasTagWithValue *
(* +
this+ /
CloudOdsWebsite0 ?
site@ D
,D E
stringF L
tagNameM T
,T U
stringV \
tagValue] e
)e f
{ 	
return 
site 
. 
HasTag 
( 
tagName &
)& '
&&( *
site 
. 
Tags 
[ 
tagName $
]$ %
.% &
Equals& ,
(, -
tagValue- 5
,5 6
StringComparison7 G
.G H&
InvariantCultureIgnoreCaseH b
)b c
;c d
} 	
public 
static 
string 
GetTagValue (
(( )
this) -
CloudOdsWebsite. =
site> B
,B C
stringD J
tagNameK R
)R S
{ 	
return 
site 
. 
HasTag 
( 
tagName &
)& '
?( )
site* .
.. /
Tags/ 3
[3 4
tagName4 ;
]; <
:= >
null? C
;C D
} 	
public 
static 
bool 
IsInRole #
(# $
this$ (
CloudOdsWebsite) 8
site9 =
,= >
CloudOdsRole? K
roleL P
)P Q
{ 	
return 
site 
. 
Role 
== 
role  $
;$ %
} 	
public!! 
static!! 
bool!! 
IsInEnvironment!! *
(!!* +
this!!+ /
CloudOdsWebsite!!0 ?
site!!@ D
,!!D E
CloudOdsEnvironment!!F Y
environment!!Z e
)!!e f
{"" 	
return## 
site## 
.## 
Environment## #
==##$ &
environment##' 2
;##2 3
}$$ 	
public&& 
static&& 
bool&& 
IsProductionApi&& *
(&&* +
this&&+ /
CloudOdsWebsite&&0 ?
site&&@ D
)&&D E
{'' 	
return(( 
site(( 
.(( 
IsInRole((  
(((  !
CloudOdsRole((! -
.((- .
Api((. 1
)((1 2
&&((3 5
site((6 :
.((: ;
IsInEnvironment((; J
(((J K
CloudOdsEnvironment((K ^
.((^ _

Production((_ i
)((i j
;((j k
})) 	
public++ 
static++ 
bool++ 

IsAdminApp++ %
(++% &
this++& *
CloudOdsWebsite+++ :
site++; ?
)++? @
{,, 	
return-- 
site-- 
.-- 
IsInRole--  
(--  !
CloudOdsRole--! -
.--- .
AdminApp--. 6
)--6 7
;--7 8
}.. 	
public00 
static00 
bool00 
IsSwaggerWebsite00 +
(00+ ,
this00, 0
CloudOdsWebsite001 @
site00A E
)00E F
{11 	
return22 
site22 
.22 
IsInRole22  
(22  !
CloudOdsRole22! -
.22- .
Swagger22. 5
)225 6
;226 7
}33 	
}44 
}55 ﬂ
C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Configuration\Application\ApplicationConfigurationService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Configuration' 4
.4 5
Application5 @
{ 
public 

class +
ApplicationConfigurationService 0
{ 
private 
readonly 
AdminAppDbContext *
	_database+ 4
;4 5
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public +
ApplicationConfigurationService .
(. /
AdminAppDbContext/ @
databaseA I
,I J%
AdminAppIdentityDbContextK d
identitye m
)m n
{ 	
	_database 
= 
database  
;  !
	_identity 
= 
identity  
;  !
} 	
public 
bool !
AllowUserRegistration )
() *
)* +
{ 	
if 
( 
! 
AnyUsersExist 
( 
)  
)  !
return 
true 
; 
return 
	_database 
. %
ApplicationConfigurations 1
.   
SingleOrDefault   '
(  ' (
)  ( )
?  ) *
.!! !
AllowUserRegistration!! -
??!!. 0
false!!1 6
;!!6 7
}"" 	
public$$ 
void$$ &
UpdateFirstTimeSetUpStatus$$ .
($$. /
bool$$/ 3
setUpCompleted$$4 B
)$$B C
{%% 	
var&& 
config&& 
=&& 
	_database&& "
.&&" #
EnsureSingle&&# /
<&&/ 0$
ApplicationConfiguration&&0 H
>&&H I
(&&I J
)&&J K
;&&K L
config'' 
.'' #
FirstTimeSetUpCompleted'' *
=''+ ,
setUpCompleted''- ;
;''; <
	_database(( 
.(( 
SaveChanges((  
(((  !
)((! "
;((" #
})) 	
private++ 
bool++ 
AnyUsersExist++ "
(++" #
)++# $
{,, 	
return-- 
	_identity-- 
.-- 
Users-- "
.--" #
Any--# &
(--& '
)--' (
;--( )
}.. 	
}// 
}00 Ö
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Configuration\Claims\CloudOdsClaimAction.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Configuration' 4
.4 5
Claims5 ;
{ 
public 

sealed 
class 
CloudOdsClaimAction +
:, -
Enumeration. 9
<9 :
CloudOdsClaimAction: M
>M N
{		 
public

 
string

 

ActionName

  
=>

! #
DisplayName

$ /
;

/ 0
public 
static 
CloudOdsClaimAction )
Create* 0
=1 2
new3 6
CloudOdsClaimAction7 J
(J K
$numK L
,L M
$strN V
)V W
;W X
public 
static 
CloudOdsClaimAction )
Read* .
=/ 0
new1 4
CloudOdsClaimAction5 H
(H I
$numI J
,J K
$strL R
)R S
;S T
public 
static 
CloudOdsClaimAction )
Update* 0
=1 2
new3 6
CloudOdsClaimAction7 J
(J K
$numK L
,L M
$strN V
)V W
;W X
public 
static 
CloudOdsClaimAction )
Delete* 0
=1 2
new3 6
CloudOdsClaimAction7 J
(J K
$numK L
,L M
$strN V
)V W
;W X
private 
CloudOdsClaimAction #
(# $
int$ '
value( -
,- .
string/ 5
displayName6 A
)A B
:C D
baseE I
(I J
valueJ O
,O P
displayNameQ \
)\ ]
{ 	
} 	
} 
} é
}C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Configuration\Claims\CloudOdsClaimAuthorizationStrategy.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Configuration' 4
.4 5
Claims5 ;
{ 
public 

sealed 
class .
"CloudOdsClaimAuthorizationStrategy :
:; <
Enumeration= H
<H I.
"CloudOdsClaimAuthorizationStrategyI k
>k l
{		 
public

 
string

 
StrategyName

 "
=>

# %
DisplayName

& 1
;

1 2
public 
static .
"CloudOdsClaimAuthorizationStrategy 8*
NoFurtherAuthorizationRequired9 W
=X Y
newZ ]/
"CloudOdsClaimAuthorizationStrategy	^ Ä
(
Ä Å
$num
Å Ç
,
Ç É
$str
Ñ §
)
§ •
;
• ¶
private .
"CloudOdsClaimAuthorizationStrategy 2
(2 3
int3 6
value7 <
,< =
string> D
displayNameE P
)P Q
:R S
baseT X
(X Y
valueY ^
,^ _
displayName` k
)k l
{ 	
} 	
} 
} Î
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Configuration\Claims\CloudOdsClaimSet.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Configuration' 4
.4 5
Claims5 ;
{		 
public

 

class

 
CloudOdsClaimSet

 !
{ 
public 
string 
ApplicationName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ClaimSetName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
IEnumerable 
< 
CloudOdsEntityClaim .
>. /
Claims0 6
{7 8
get9 <
;< =
set> A
;A B
}C D
} 
} ≥9
wC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Configuration\Claims\CloudOdsClaimSetConfigurator.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Configuration

' 4
.

4 5
Claims

5 ;
{ 
public 

	interface )
ICloudOdsClaimSetConfigurator 2
{ 
void 
ApplyConfiguration 
(  
CloudOdsClaimSet  0
configuration1 >
)> ?
;? @
} 
public 

class (
CloudOdsClaimSetConfigurator -
:. /)
ICloudOdsClaimSetConfigurator0 M
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public (
CloudOdsClaimSetConfigurator +
(+ ,
ISecurityContext, <
securityContext= L
)L M
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
void 
ApplyConfiguration &
(& '
CloudOdsClaimSet' 7
configuration8 E
)E F
{ 	
var 
claimSetExists 
=  
	Queryable! *
.* +
Any+ .
(. /
_securityContext/ ?
.? @
	ClaimSets@ I
,I J
csK M
=>N P
csQ S
.S T
ClaimSetNameT `
==a c
configurationd q
.q r
ClaimSetNamer ~
)~ 
;	 Ä
if 
( 
claimSetExists 
) 
return 
; 
var   
resourceTypes   
=   
configuration    -
.  - .
Claims  . 4
.  4 5
Select  5 ;
(  ; <
c  < =
=>  > @
c  A B
.  B C

EntityName  C M
)  M N
;  N O
var!! 
actionNames!! 
=!! 

Enumerable!! (
.!!( )
Distinct!!) 1
<!!1 2
string!!2 8
>!!8 9
(!!9 :
configuration!!: G
.!!G H
Claims!!H N
.!!N O

SelectMany!!O Y
(!!Y Z
c!!Z [
=>!!\ ^
c!!_ `
.!!` a
Actions!!a h
)!!h i
.!!i j
Select!!j p
(!!p q
x!!q r
=>!!s u
x!!v w
.!!w x

ActionName	!!x Ç
)
!!Ç É
)
!!É Ñ
;
!!Ñ Ö
var## 
apiApplication## 
=##  
	Queryable##! *
.##* +
Single##+ 1
(##1 2
_securityContext##2 B
.##B C
Applications##C O
,##O P
a##Q R
=>##S U
a##V W
.##W X
ApplicationName##X g
==##h j
configuration##k x
.##x y
ApplicationName	##y à
)
##à â
;
##â ä
var$$ 
resourceClaims$$ 
=$$  
_securityContext$$! 1
.$$1 2
ResourceClaims$$2 @
.$$@ A
Where$$A F
($$F G
rc$$G I
=>$$J L

Enumerable$$M W
.$$W X
Contains$$X `
($$` a
resourceTypes$$a n
,$$n o
rc$$p r
.$$r s
ResourceName$$s 
)	$$ Ä
)
$$Ä Å
.
$$Å Ç
ToList
$$Ç à
(
$$à â
)
$$â ä
;
$$ä ã
var%% 
actions%% 
=%% 
_securityContext%% *
.%%* +
Actions%%+ 2
.%%2 3
Where%%3 8
(%%8 9
a%%9 :
=>%%; =
actionNames%%> I
.%%I J
Contains%%J R
(%%R S
a%%S T
.%%T U

ActionName%%U _
)%%_ `
)%%` a
.%%a b
ToList%%b h
(%%h i
)%%i j
;%%j k
var'' 
claimSet'' 
='' 
new'' 
ClaimSet'' '
{(( 
Application)) 
=)) 
apiApplication)) ,
,)), -
ClaimSetName** 
=** 
configuration** ,
.**, -
ClaimSetName**- 9
}++ 
;++ 
_securityContext-- 
.-- 
	ClaimSets-- &
.--& '
Add--' *
(--* +
claimSet--+ 3
)--3 4
;--4 5
foreach// 
(// 
var// 
requiredClaim// &
in//' )
configuration//* 7
.//7 8
Claims//8 >
)//> ?
{00 
var11 
resourceClaim11 !
=11" #
resourceClaims11$ 2
.112 3
Single113 9
(119 :
rc11: <
=>11= ?
rc11@ B
.11B C
ResourceName11C O
.11O P
Equals11P V
(11V W
requiredClaim11W d
.11d e

EntityName11e o
)11o p
)11p q
;11q r
var22 
authOverride22  
=22! "
requiredClaim22# 0
.220 1!
AuthorizationStrategy221 F
!=22G I
null22J N
?33 
	Queryable33 
.33  
FirstOrDefault33  .
(33. /
_securityContext33/ ?
.33? @#
AuthorizationStrategies33@ W
,33W X
a33Y Z
=>33[ ]
a44 
.44 
Application44 %
.44% &
ApplicationId44& 3
==444 6
apiApplication447 E
.44E F
ApplicationId44F S
&&44T V
a55 
.55 %
AuthorizationStrategyName55 3
==554 6
requiredClaim557 D
.55D E!
AuthorizationStrategy55E Z
.55Z [
StrategyName55[ g
)55g h
:66 
null66 
;66 
foreach88 
(88 
var88 !
claimSetResourceClaim88 2
in883 5
requiredClaim886 C
.88C D
Actions88D K
.88K L
Select88L R
(88R S
action88S Y
=>88Z \
new99 !
ClaimSetResourceClaim99 -
{:: 
Action;; 
=;;  
actions;;! (
.;;( )
Single;;) /
(;;/ 0
a;;0 1
=>;;2 4
a;;5 6
.;;6 7

ActionName;;7 A
==;;B D
action;;E K
.;;K L

ActionName;;L V
);;V W
,;;W X)
AuthorizationStrategyOverride<< 5
=<<6 7
authOverride<<8 D
,<<D E
ClaimSet==  
===! "
claimSet==# +
,==+ ,
ResourceClaim>> %
=>>& '
resourceClaim>>( 5
}?? 
)?? 
)?? 
{@@ 
_securityContextAA $
.AA$ %"
ClaimSetResourceClaimsAA% ;
.AA; <
AddAA< ?
(AA? @!
claimSetResourceClaimAA@ U
)AAU V
;AAV W
}BB 
}CC 
_securityContextEE 
.EE 
SaveChangesEE (
(EE( )
)EE) *
;EE* +
}FF 	
}GG 
}HH í
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Configuration\Claims\CloudOdsEntityClaim.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Configuration' 4
.4 5
Claims5 ;
{		 
public

 

class

 
CloudOdsEntityClaim

 $
{ 
public 
string 

EntityName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
IEnumerable 
< 
CloudOdsClaimAction .
>. /
Actions0 7
{8 9
get: =
;= >
set? B
;B C
}D E
public .
"CloudOdsClaimAuthorizationStrategy 1!
AuthorizationStrategy2 G
{H I
getJ M
;M N
setO R
;R S
}T U
} 
} á
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\AdminAppDataProtectionKeysDbContext.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
{ 
public 

class /
#AdminAppDataProtectionKeysDbContext 4
:5 6
	DbContext7 @
,@ A%
IDataProtectionKeyContextB [
{ 
private 
readonly 
IOptions !
<! "
AppSettings" -
>- .
_appSettings/ ;
;; <
public /
#AdminAppDataProtectionKeysDbContext 2
(2 3
DbContextOptions3 C
<C D/
#AdminAppDataProtectionKeysDbContextD g
>g h
optionsi p
,p q
IOptionsr z
<z {
AppSettings	{ Ü
>
Ü á
appSettings
à ì
)
ì î
: 
base 
( 
options 
) 
{ 	
_appSettings 
= 
appSettings &
;& '
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
HasDefaultSchema )
() *
$str* 4
)4 5
;5 6
modelBuilder 
. 2
&ApplyDatabaseServerSpecificConventions ?
(? @
_appSettings@ L
.L M
ValueM R
.R S
DatabaseEngineS a
)a b
;b c
} 	
public 
DbSet 
< 
DataProtectionKey &
>& '
DataProtectionKeys( :
{; <
get= @
;@ A
setB E
;E F
}G H
} 
}   €
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\AdminAppDbContext.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
{ 
public 

class 
AdminAppDbContext "
:# $
	DbContext% .
{ 
private 
readonly 
IOptions !
<! "
AppSettings" -
>- .
_appSettings/ ;
;; <
public 
AdminAppDbContext  
(  !
DbContextOptions! 1
<1 2
AdminAppDbContext2 C
>C D
optionsE L
,L M
IOptionsN V
<V W
AppSettingsW b
>b c
appSettingsd o
)o p
: 
base 
( 
options 
) 
{ 	
_appSettings 
= 
appSettings &
;& '
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
HasDefaultSchema )
() *
$str* 4
)4 5
;5 6
modelBuilder 
. 2
&ApplyDatabaseServerSpecificConventions ?
(? @
_appSettings@ L
.L M
ValueM R
.R S
DatabaseEngineS a
)a b
;b c
modelBuilder 
. 
Entity 
<  
DatabaseVersion  /
>/ 0
(0 1
)1 2
.2 3
HasNoKey3 ;
(; <
)< =
;= >
} 	
public   
DbSet   
<   $
ApplicationConfiguration   -
>  - .%
ApplicationConfigurations  / H
{  I J
get  K N
;  N O
set  P S
;  S T
}  U V
public!! 
DbSet!! 
<!! 
SecretConfiguration!! (
>!!( ) 
SecretConfigurations!!* >
{!!? @
get!!A D
;!!D E
set!!F I
;!!I J
}!!K L
public"" 
DbSet"" 
<"" 
DatabaseVersion"" $
>""$ %
DatabaseVersionView""& 9
{"": ;
get""< ?
;""? @
set""A D
;""D E
}""F G
public$$ 
TEntity$$ 
EnsureSingle$$ #
<$$# $
TEntity$$$ +
>$$+ ,
($$, -
)$$- .
where$$/ 4
TEntity$$5 <
:$$= >
Entity$$? E
,$$E F
new$$G J
($$J K
)$$K L
{%% 	
var&& 
single&& 
=&& 
Set&& 
<&& 
TEntity&& $
>&&$ %
(&&% &
)&&& '
.&&' (
SingleOrDefault&&( 7
(&&7 8
)&&8 9
;&&9 :
if(( 
((( 
single(( 
==(( 
null(( 
)(( 
{)) 
single** 
=** 
new** 
TEntity** $
(**$ %
)**% &
;**& '
Set++ 
<++ 
TEntity++ 
>++ 
(++ 
)++ 
.++ 
Add++ "
(++" #
single++# )
)++) *
;++* +
},, 
return.. 
single.. 
;.. 
}// 	
}00 
}11 ¢F
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\AdminAppIdentityDbContext.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
{ 
public 

class %
AdminAppIdentityDbContext *
:+ ,
IdentityDbContext- >
<> ?
AdminAppUser? K
>K L
{ 
private 
readonly 
IOptions !
<! "
AppSettings" -
>- .
_appSettings/ ;
;; <
public %
AdminAppIdentityDbContext (
(( )
DbContextOptions) 9
<9 :%
AdminAppIdentityDbContext: S
>S T
optionsU \
,\ ]
IOptions^ f
<f g
AppSettingsg r
>r s
appSettingst 
)	 Ä
: 
base 
( 
options 
) 
{ 	
_appSettings 
= 
appSettings &
;& '
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
HasDefaultSchema )
() *
$str* 4
)4 5
;5 6
modelBuilder 
. 
Entity 
<  
AdminAppUser  ,
>, -
(- .
). /
./ 0
ToTable0 7
(7 8
$str8 ?
)? @
;@ A
modelBuilder 
. 
Entity 
<  
IdentityRole  ,
>, -
(- .
). /
./ 0
ToTable0 7
(7 8
$str8 ?
)? @
;@ A
modelBuilder 
. 
Entity 
<  
IdentityUserClaim  1
<1 2
string2 8
>8 9
>9 :
(: ;
); <
.< =
ToTable= D
(D E
$strE Q
)Q R
;R S
modelBuilder   
.   
Entity   
<    
IdentityRoleClaim    1
<  1 2
string  2 8
>  8 9
>  9 :
(  : ;
)  ; <
.  < =
ToTable  = D
(  D E
$str  E Q
)  Q R
;  R S
modelBuilder!! 
.!! 
Entity!! 
<!!  
IdentityUserLogin!!  1
<!!1 2
string!!2 8
>!!8 9
>!!9 :
(!!: ;
)!!; <
.!!< =
ToTable!!= D
(!!D E
$str!!E Q
)!!Q R
;!!R S
modelBuilder"" 
."" 
Entity"" 
<""  
IdentityUserRole""  0
<""0 1
string""1 7
>""7 8
>""8 9
(""9 :
)"": ;
.""; <
ToTable""< C
(""C D
$str""D O
)""O P
;""P Q
modelBuilder## 
.## 
Entity## 
<##  
IdentityUserToken##  1
<##1 2
string##2 8
>##8 9
>##9 :
(##: ;
)##; <
.##< =
ToTable##= D
(##D E
$str##E Q
)##Q R
;##R S
modelBuilder%% 
.%% 
Entity%% 
<%%  
AdminAppUser%%  ,
>%%, -
(%%- .
)%%. /
.%%/ 0
Property%%0 8
(%%8 9
x%%9 :
=>%%; =
x%%> ?
.%%? @
Id%%@ B
)%%B C
.%%C D
HasMaxLength%%D P
(%%P Q
$num%%Q T
)%%T U
;%%U V
modelBuilder'' 
.'' 
Entity'' 
<''  
IdentityRole''  ,
>'', -
(''- .
)''. /
.''/ 0
Property''0 8
(''8 9
x''9 :
=>''; =
x''> ?
.''? @
Id''@ B
)''B C
.''C D
HasMaxLength''D P
(''P Q
$num''Q T
)''T U
;''U V
modelBuilder)) 
.)) 
Entity)) 
<))  
IdentityUserClaim))  1
<))1 2
string))2 8
>))8 9
>))9 :
()): ;
))); <
.))< =
Property))= E
())E F
x))F G
=>))H J
x))K L
.))L M
UserId))M S
)))S T
.))T U
HasMaxLength))U a
())a b
$num))b e
)))e f
;))f g
modelBuilder++ 
.++ 
Entity++ 
<++  
IdentityRoleClaim++  1
<++1 2
string++2 8
>++8 9
>++9 :
(++: ;
)++; <
.++< =
Property++= E
(++E F
x++F G
=>++H J
x++K L
.++L M
RoleId++M S
)++S T
.++T U
HasMaxLength++U a
(++a b
$num++b e
)++e f
;++f g
modelBuilder-- 
.-- 
Entity-- 
<--  
IdentityUserLogin--  1
<--1 2
string--2 8
>--8 9
>--9 :
(--: ;
)--; <
.--< =
Property--= E
(--E F
x--F G
=>--H J
x--K L
.--L M
UserId--M S
)--S T
.--T U
HasMaxLength--U a
(--a b
$num--b e
)--e f
;--f g
modelBuilder// 
.// 
Entity// 
<//  
IdentityUserRole//  0
<//0 1
string//1 7
>//7 8
>//8 9
(//9 :
)//: ;
.//; <
Property//< D
(//D E
x//E F
=>//G I
x//J K
.//K L
UserId//L R
)//R S
.//S T
HasMaxLength//T `
(//` a
$num//a d
)//d e
;//e f
modelBuilder00 
.00 
Entity00 
<00  
IdentityUserRole00  0
<000 1
string001 7
>007 8
>008 9
(009 :
)00: ;
.00; <
Property00< D
(00D E
x00E F
=>00G I
x00J K
.00K L
RoleId00L R
)00R S
.00S T
HasMaxLength00T `
(00` a
$num00a d
)00d e
;00e f
modelBuilder22 
.22 
Entity22 
<22  
IdentityUserToken22  1
<221 2
string222 8
>228 9
>229 :
(22: ;
)22; <
.22< =
Property22= E
(22E F
x22F G
=>22H J
x22K L
.22L M
UserId22M S
)22S T
.22T U
HasMaxLength22U a
(22a b
$num22b e
)22e f
;22f g
modelBuilder33 
.33 
Entity33 
<33  
IdentityUserToken33  1
<331 2
string332 8
>338 9
>339 :
(33: ;
)33; <
.33< =
Property33= E
(33E F
x33F G
=>33H J
x33K L
.33L M
LoginProvider33M Z
)33Z [
.33[ \
HasMaxLength33\ h
(33h i
$num33i l
)33l m
;33m n
modelBuilder44 
.44 
Entity44 
<44  
IdentityUserToken44  1
<441 2
string442 8
>448 9
>449 :
(44: ;
)44; <
.44< =
Property44= E
(44E F
x44F G
=>44H J
x44K L
.44L M
Name44M Q
)44Q R
.44R S
HasMaxLength44S _
(44_ `
$num44` c
)44c d
;44d e
modelBuilder66 
.66 
Entity66 
<66  
UserOdsInstance66  /
>66/ 0
(660 1
)661 2
.77 
HasKey77 
(77 
k77 
=>77 
new77  
{77! "
k77# $
.77$ %
UserId77% +
,77+ ,
k77- .
.77. /
OdsInstanceId77/ <
}77= >
)77> ?
;77? @
modelBuilder99 
.99 2
&ApplyDatabaseServerSpecificConventions99 ?
(99? @
_appSettings99@ L
.99L M
Value99M R
.99R S
DatabaseEngine99S a
)99a b
;99b c
}:: 	
public<< 
DbSet<< 
<<< 
UserOdsInstance<< $
><<$ %
UserOdsInstances<<& 6
{<<7 8
get<<9 <
;<<< =
set<<> A
;<<A B
}<<C D
}== 
}>> í
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\ApiClientExtensions.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Database		' /
{

 
public 

static 
class 
ApiClientExtensions +
{ 
public 
static 
string &
GenerateSecureClientSecret 7
(7 8
this8 <
	ApiClient= F
	apiClientG P
,P Q%
ISecurePackedHashProviderR k%
securePackedHashProvider	l Ñ
,
Ñ Ö(
IHashConfigurationProvider
Ü †'
hashConfigurationProvider
° ∫
)
∫ ª
{ 	
var 
hashConfiguration !
=" #%
hashConfigurationProvider$ =
.= > 
GetHashConfiguration> R
(R S
)S T
;T U
var 
plainTextSecret 
=  !
	apiClient" +
.+ ,
GenerateSecret, :
(: ;
); <
;< =
var 
hashedSecret 
= $
securePackedHashProvider 7
.7 8#
ComputePackedHashString8 O
(O P
plainTextSecret 
,  
hashConfiguration !
.! " 
GetAlgorithmHashCode" 6
(6 7
)7 8
,8 9
hashConfiguration !
.! "

Iterations" ,
,, -
hashConfiguration !
.! "
GetSaltSizeInBytes" 4
(4 5
)5 6
)6 7
;7 8
	apiClient 
. 
Secret 
= 
hashedSecret +
;+ ,
	apiClient   
.   
SecretIsHashed   $
=  % &
true  ' +
;  + ,
return"" 
plainTextSecret"" "
;""" #
}## 	
}$$ 
}%% „B
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Commands\AddApplicationCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Commands0 8
{ 
public 

	interface "
IAddApplicationCommand +
{  
AddApplicationResult 
Execute $
($ % 
IAddApplicationModel% 9
applicationModel: J
)J K
;K L
} 
public 

class !
AddApplicationCommand &
:' ("
IAddApplicationCommand) ?
{ 
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
private 
readonly 
InstanceContext (
_instanceContext) 9
;9 :
public !
AddApplicationCommand $
($ %
IUsersContext% 2
usersContext3 ?
,? @
InstanceContextA P
instanceContextQ `
)` a
{ 	
_usersContext 
= 
usersContext (
;( )
_instanceContext 
= 
instanceContext .
;. /
} 	
public  
AddApplicationResult #
Execute$ +
(+ , 
IAddApplicationModel, @
applicationModelA Q
)Q R
{   	
var!! 
profile!! 
=!! 
applicationModel!! *
.!!* +
	ProfileId!!+ 4
.!!4 5
HasValue!!5 =
?"" 
_usersContext"" 
.""  
Profiles""  (
.""( )
SingleOrDefault"") 8
(""8 9
p""9 :
=>""; =
p""> ?
.""? @
	ProfileId""@ I
==""J L
applicationModel""M ]
.""] ^
	ProfileId""^ g
.""g h
Value""h m
)""m n
:## 
null## 
;## 
var%% 
vendor%% 
=%% 
_usersContext%% &
.%%& '
Vendors%%' .
.%%. /
Single%%/ 5
(%%5 6
v%%6 7
=>%%8 :
v%%; <
.%%< =
VendorId%%= E
==%%F H
applicationModel%%I Y
.%%Y Z
VendorId%%Z b
)%%b c
;%%c d
var'' 
odsInstance'' 
='' 
_usersContext'' +
.''+ ,
OdsInstances'', 8
.''8 9
FirstOrDefault''9 G
(''G H
x''H I
=>''J L
x(( 
.(( 
Name(( 
.(( 
Equals(( 
((( 
_instanceContext(( .
.((. /
Name((/ 3
,((3 4
StringComparison((5 E
.((E F&
InvariantCultureIgnoreCase((F `
)((` a
)((a b
;((b c
var** 
user** 
=** 
new** 

VendorUser** %
{++ 
Email,, 
=,, 
$str,, 
,,, 
FullName-- 
=-- 
applicationModel-- +
.--+ ,
ApplicationName--, ;
,--; <
Vendor.. 
=.. 
vendor.. 
}// 
;// 
var11 
	apiClient11 
=11 
new11 
	ApiClient11  )
(11) *
true11* .
)11. /
{22 
Name33 
=33 
applicationModel33 '
.33' (
ApplicationName33( 7
,337 8

IsApproved44 
=44 
true44 !
,44! "

UseSandbox55 
=55 
false55 "
,55" #
	KeyStatus66 
=66 
$str66 $
,66$ %
User77 
=77 
user77 
}88 
;88 
var:: 
applicationEdOrgs:: !
=::" #
applicationModel::$ 4
.::4 5$
EducationOrganizationIds::5 M
==::N P
null::Q U
?;; 

Enumerable;; 
.;; 
Empty;; "
<;;" #,
 ApplicationEducationOrganization;;# C
>;;C D
(;;D E
);;E F
:<< 
applicationModel<< "
.<<" #$
EducationOrganizationIds<<# ;
.<<; <
Select<<< B
(<<B C
id<<C E
=><<F H
new<<I L,
 ApplicationEducationOrganization<<M m
{== 
Clients>> 
=>>  !
new>>" %
List>>& *
<>>* +
	ApiClient>>+ 4
>>>4 5
{>>6 7
	apiClient>>8 A
}>>B C
,>>C D#
EducationOrganizationId?? /
=??0 1
id??2 4
}@@ 
)@@ 
;@@ 
varBB 
applicationBB 
=BB 
newBB !
ApplicationBB" -
{CC 
ApplicationNameDD 
=DD  !
applicationModelDD" 2
.DD2 3
ApplicationNameDD3 B
,DDB C

ApiClientsEE 
=EE 
newEE  
ListEE! %
<EE% &
	ApiClientEE& /
>EE/ 0
{EE1 2
	apiClientEE3 <
}EE= >
,EE> ?-
!ApplicationEducationOrganizationsFF 1
=FF2 3
newFF4 7
ListFF8 <
<FF< =,
 ApplicationEducationOrganizationFF= ]
>FF] ^
(FF^ _
applicationEdOrgsFF_ p
)FFp q
,FFq r
ClaimSetNameGG 
=GG 
applicationModelGG /
.GG/ 0
ClaimSetNameGG0 <
,GG< =
ProfilesHH 
=HH 
newHH 
ListHH #
<HH# $
ProfileHH$ +
>HH+ ,
(HH, -
)HH- .
,HH. /
VendorII 
=II 
vendorII 
,II  !
OperationalContextUriJJ %
=JJ& '
OperationalContextJJ( :
.JJ: ;(
DefaultOperationalContextUriJJ; W
,JJW X
OdsInstanceKK 
=KK 
odsInstanceKK )
}LL 
;LL 
ifNN 
(NN 
profileNN 
!=NN 
nullNN 
)NN  
{OO 
applicationPP 
.PP 
ProfilesPP $
.PP$ %
AddPP% (
(PP( )
profilePP) 0
)PP0 1
;PP1 2
}QQ 
_usersContextSS 
.SS 
ApplicationsSS &
.SS& '
AddSS' *
(SS* +
applicationSS+ 6
)SS6 7
;SS7 8
_usersContextTT 
.TT 
SaveChangesTT %
(TT% &
)TT& '
;TT' (
returnVV 
newVV  
AddApplicationResultVV +
{WW 
ApplicationIdXX 
=XX 
applicationXX  +
.XX+ ,
ApplicationIdXX, 9
,XX9 :
KeyYY 
=YY 
	apiClientYY 
.YY  
KeyYY  #
,YY# $
SecretZZ 
=ZZ 
	apiClientZZ "
.ZZ" #
SecretZZ# )
}[[ 
;[[ 
}\\ 	
}]] 
public__ 

	interface__  
IAddApplicationModel__ )
{`` 
stringaa 
ApplicationNameaa 
{aa  
getaa! $
;aa$ %
}aa& '
intbb 
VendorIdbb 
{bb 
getbb 
;bb 
}bb 
stringcc 
ClaimSetNamecc 
{cc 
getcc !
;cc! "
}cc# $
intdd 
?dd 
	ProfileIddd 
{dd 
getdd 
;dd 
}dd 
IEnumerableee 
<ee 
intee 
>ee $
EducationOrganizationIdsee 1
{ee2 3
getee4 7
;ee7 8
}ee9 :
}ff 
publichh 

classhh  
AddApplicationResulthh %
{ii 
publicjj 
intjj 
ApplicationIdjj  
{jj! "
getjj# &
;jj& '
setjj( +
;jj+ ,
}jj- .
publickk 
stringkk 
Keykk 
{kk 
getkk 
;kk  
setkk! $
;kk$ %
}kk& '
publicll 
stringll 
Secretll 
{ll 
getll "
;ll" #
setll$ '
;ll' (
}ll) *
}mm 
}nn ì
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Commands\AddVendorCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Commands0 8
{ 
public 

class 
AddVendorCommand !
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public 
AddVendorCommand 
(  
IUsersContext  -
context. 5
)5 6
{ 	
_context 
= 
context 
; 
} 	
public 
Vendor 
Execute 
( 
IAddVendorModel -
	newVendor. 7
)7 8
{ 	
var 
namespacePrefixes !
=" #
	newVendor$ -
.- .
NamespacePrefixes. ?
?? @
.@ A
SplitA F
(F G
$strG J
)J K
. 
Where 
( 
namespacePrefix &
=>' )
!* +
string+ 1
.1 2
IsNullOrWhiteSpace2 D
(D E
namespacePrefixE T
)T U
)U V
. 
Select 
( 
namespacePrefix '
=>( *
new+ .!
VendorNamespacePrefix/ D
{ 
NamespacePrefix #
=$ %
namespacePrefix& 5
.5 6
Trim6 :
(: ;
); <
} 
) 
. 
ToList 
( 
) 
; 
var!! 
vendor!! 
=!! 
new!! 
Vendor!! #
{"" 

VendorName## 
=## 
	newVendor## &
.##& '
Company##' .
.##. /
Trim##/ 3
(##3 4
)##4 5
,##5 6#
VendorNamespacePrefixes$$ '
=$$( )
namespacePrefixes$$* ;
}%% 
;%% 
var'' 
user'' 
='' 
new'' 

VendorUser'' %
{(( 
FullName)) 
=)) 
	newVendor)) $
.))$ %
ContactName))% 0
.))0 1
Trim))1 5
())5 6
)))6 7
,))7 8
Email** 
=** 
	newVendor** !
.**! "
ContactEmailAddress**" 5
.**5 6
Trim**6 :
(**: ;
)**; <
}++ 
;++ 
vendor-- 
.-- 
Users-- 
.-- 
Add-- 
(-- 
user-- !
)--! "
;--" #
_context// 
.// 
Vendors// 
.// 
Add//  
(//  !
vendor//! '
)//' (
;//( )
_context00 
.00 
SaveChanges00  
(00  !
)00! "
;00" #
return11 
vendor11 
;11 
}22 	
}33 
public55 

	interface55 
IAddVendorModel55 $
{66 
string77 
Company77 
{77 
get77 
;77 
}77 
string88 
NamespacePrefixes88  
{88! "
get88# &
;88& '
}88( )
string99 
ContactName99 
{99 
get99  
;99  !
}99" #
string:: 
ContactEmailAddress:: "
{::# $
get::% (
;::( )
}::* +
};; 
}<< π$
pC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Commands\DeleteApplicationCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Commands0 8
{ 
public 

	interface %
IDeleteApplicationCommand .
{ 
void 
Execute 
( 
int 
id 
) 
; 
} 
public 

class $
DeleteApplicationCommand )
:* +%
IDeleteApplicationCommand, E
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public $
DeleteApplicationCommand '
(' (
IUsersContext( 5
context6 =
)= >
{ 	
_context 
= 
context 
; 
} 	
public 
void 
Execute 
( 
int 
id  "
)" #
{ 	
var 
application 
= 
_context &
.& '
Applications' 3
.   
Include   
(   
a   
=>   
a   
.    

ApiClients    *
)  * +
.!! 
Include!! 
(!! 
a!! 
=>!! 
a!! 
.!!  

ApiClients!!  *
.!!* +
Select!!+ 1
(!!1 2
c!!2 3
=>!!4 6
c!!7 8
.!!8 9
ClientAccessTokens!!9 K
)!!K L
)!!L M
."" 
Include"" 
("" 
a"" 
=>"" 
a"" 
.""  -
!ApplicationEducationOrganizations""  A
)""A B
.## 
SingleOrDefault##  
(##  !
a##! "
=>### %
a##& '
.##' (
ApplicationId##( 5
==##6 8
id##9 ;
)##; <
;##< =
if%% 
(%% 
application%% 
==%% 
null%% #
)%%# $
{&& 
throw'' 
new'' 
NotFoundException'' +
<''+ ,
int'', /
>''/ 0
(''0 1
$str''1 >
,''> ?
id''@ B
)''B C
;''C D
}(( 
if)) 
()) 
application)) 
!=)) 
null)) #
&&))$ &
application))' 2
.))2 3
Vendor))3 9
.))9 :"
IsSystemReservedVendor)): P
())P Q
)))Q R
)))R S
{** 
throw++ 
new++ 
	Exception++ #
(++# $
$str++$ u
)++u v
;++v w
},, 
if.. 
(.. 
application.. 
==.. 
null.. #
)..# $
{// 
return00 
;00 
}11 
application33 
.33 

ApiClients33 "
.33" #
ToList33# )
(33) *
)33* +
.33+ ,
ForEach33, 3
(333 4
a334 5
=>336 8
{44 
a55 
.55 
ClientAccessTokens55 $
.55$ %
ToList55% +
(55+ ,
)55, -
.55- .
ForEach55. 5
(555 6
t556 7
=>558 :
_context55; C
.55C D
ClientAccessTokens55D V
.55V W
Remove55W ]
(55] ^
t55^ _
)55_ `
)55` a
;55a b
_context66 
.66 
Clients66  
.66  !
Remove66! '
(66' (
a66( )
)66) *
;66* +
}77 
)77 
;77 
application99 
.99 -
!ApplicationEducationOrganizations99 9
.999 :
ToList99: @
(99@ A
)99A B
.99B C
ForEach99C J
(99J K
o99K L
=>99M O
_context99P X
.99X Y-
!ApplicationEducationOrganizations99Y z
.99z {
Remove	99{ Å
(
99Å Ç
o
99Ç É
)
99É Ñ
)
99Ñ Ö
;
99Ö Ü
_context;; 
.;; 
Applications;; !
.;;! "
Remove;;" (
(;;( )
application;;) 4
);;4 5
;;;5 6
_context<< 
.<< 
SaveChanges<<  
(<<  !
)<<! "
;<<" #
}== 	
}>> 
}?? ü
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Commands\DeleteVendorCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Commands0 8
{ 
public 

class 
DeleteVendorCommand $
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
private 
readonly %
IDeleteApplicationCommand 2%
_deleteApplicationCommand3 L
;L M
public 
DeleteVendorCommand "
(" #
IUsersContext# 0
context1 8
,8 9%
IDeleteApplicationCommand: S$
deleteApplicationCommandT l
)l m
{ 	
_context 
= 
context 
; %
_deleteApplicationCommand %
=& '$
deleteApplicationCommand( @
;@ A
} 	
public 
void 
Execute 
( 
int 
id  "
)" #
{ 	
var 
vendor 
= 
_context !
.! "
Vendors" )
.) *
SingleOrDefault* 9
(9 :
v: ;
=>< >
v? @
.@ A
VendorIdA I
==J L
idM O
)O P
;P Q
if 
( 
vendor 
== 
null 
) 
{ 
throw 
new 
NotFoundException +
<+ ,
int, /
>/ 0
(0 1
$str1 9
,9 :
id; =
)= >
;> ?
}   
if!! 
(!! 
vendor!! 
.!! "
IsSystemReservedVendor!! -
(!!- .
)!!. /
)!!/ 0
{"" 
throw## 
new## 
	Exception## #
(### $
$str##$ o
)##o p
;##p q
}$$ 
foreach&& 
(&& 
var&& 
application&& $
in&&% '
vendor&&( .
.&&. /
Applications&&/ ;
.&&; <
ToList&&< B
(&&B C
)&&C D
)&&D E
{'' %
_deleteApplicationCommand(( )
.(() *
Execute((* 1
(((1 2
application((2 =
.((= >
ApplicationId((> K
)((K L
;((L M
})) 
foreach++ 
(++ 
var++ 
user++ 
in++  
vendor++! '
.++' (
Users++( -
.++- .
ToList++. 4
(++4 5
)++5 6
)++6 7
{,, 
_context-- 
.-- 
Users-- 
.-- 
Remove-- %
(--% &
user--& *
)--* +
;--+ ,
}.. 
_context00 
.00 
Vendors00 
.00 
Remove00 #
(00# $
vendor00$ *
)00* +
;00+ ,
_context11 
.11 
SaveChanges11  
(11  !
)11! "
;11" #
}22 	
}33 
}44 Ò;
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Commands\EditApplicationCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Commands0 8
{ 
public 

	interface #
IEditApplicationCommand ,
{ 
Application 
Execute 
( !
IEditApplicationModel 1
model2 7
)7 8
;8 9
} 
public 

class "
EditApplicationCommand '
:( )#
IEditApplicationCommand* A
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public "
EditApplicationCommand %
(% &
IUsersContext& 3
context4 ;
); <
{ 	
_context 
= 
context 
; 
} 	
public   
Application   
Execute   "
(  " #!
IEditApplicationModel  # 8
model  9 >
)  > ?
{!! 	
var"" 
application"" 
="" 
_context"" &
.""& '
Applications""' 3
.## 
Include## 
(## 
a## 
=>## 
a## 
.##  
Vendor##  &
)##& '
.$$ 
Include$$ 
($$ 
a$$ 
=>$$ 
a$$ 
.$$  -
!ApplicationEducationOrganizations$$  A
)$$A B
.%% 
Include%% 
(%% 
a%% 
=>%% 
a%% 
.%%  

ApiClients%%  *
)%%* +
.&& 
Include&& 
(&& 
a&& 
=>&& 
a&& 
.&&  
Profiles&&  (
)&&( )
.'' 
SingleOrDefault''  
(''  !
a''! "
=>''# %
a''& '
.''' (
ApplicationId''( 5
==''6 8
model''9 >
.''> ?
ApplicationId''? L
)''L M
;''M N
if)) 
()) 
application)) 
==)) 
null)) #
)))# $
{** 
throw++ 
new++ 
NotFoundException++ +
<+++ ,
int++, /
>++/ 0
(++0 1
$str++1 >
,++> ?
model++@ E
.++E F
ApplicationId++F S
)++S T
;++T U
},, 
if.. 
(.. 
application.. 
... 
Vendor.. !
...! ""
IsSystemReservedVendor.." 8
(..8 9
)..9 :
)..: ;
{// 
throw00 
new00 
	Exception00 #
(00# $
$str00$ u
)00u v
;00v w
}11 
var33 
	newVendor33 
=33 
_context33 $
.33$ %
Vendors33% ,
.33, -
Single33- 3
(333 4
v334 5
=>336 8
v339 :
.33: ;
VendorId33; C
==33D F
model33G L
.33L M
VendorId33M U
)33U V
;33V W
var44 

newProfile44 
=44 
model44 "
.44" #
	ProfileId44# ,
.44, -
HasValue44- 5
?55 
_context55 
.55 
Profiles55 #
.55# $
Single55$ *
(55* +
p55+ ,
=>55- /
p550 1
.551 2
	ProfileId552 ;
==55< >
model55? D
.55D E
	ProfileId55E N
.55N O
Value55O T
)55T U
:66 
null66 
;66 
var88 
	apiClient88 
=88 
application88 '
.88' (

ApiClients88( 2
.882 3
Single883 9
(889 :
)88: ;
;88; <
	apiClient99 
.99 
Name99 
=99 
model99 "
.99" #
ApplicationName99# 2
;992 3
application;; 
.;; 
ApplicationName;; '
=;;( )
model;;* /
.;;/ 0
ApplicationName;;0 ?
;;;? @
application<< 
.<< 
ClaimSetName<< $
=<<% &
model<<' ,
.<<, -
ClaimSetName<<- 9
;<<9 :
application== 
.== 
Vendor== 
===  
	newVendor==! *
;==* +
if?? 
(?? 
application?? 
.?? -
!ApplicationEducationOrganizations?? =
==??> @
null??A E
)??E F
{@@ 
applicationAA 
.AA -
!ApplicationEducationOrganizationsAA =
=AA> ?
newAA@ C

CollectionAAD N
<AAN O,
 ApplicationEducationOrganizationAAO o
>AAo p
(AAp q
)AAq r
;AAr s
}BB 
applicationDD 
.DD -
!ApplicationEducationOrganizationsDD 9
.DD9 :
ClearDD: ?
(DD? @
)DD@ A
;DDA B
modelEE 
.EE $
EducationOrganizationIdsEE *
.EE* +
ToListEE+ 1
(EE1 2
)EE2 3
.EE3 4
ForEachEE4 ;
(EE; <
idEE< >
=>EE? A
applicationEEB M
.EEM N-
!ApplicationEducationOrganizationsEEN o
.EEo p
AddEEp s
(EEs t
applicationEEt 
.	EE Ä4
&CreateApplicationEducationOrganization
EEÄ ¶
(
EE¶ ß
id
EEß ©
)
EE© ™
)
EE™ ´
)
EE´ ¨
;
EE¨ ≠
ifGG 
(GG 
applicationGG 
.GG 
ProfilesGG $
==GG% '
nullGG( ,
)GG, -
{HH 
applicationII 
.II 
ProfilesII $
=II% &
newII' *

CollectionII+ 5
<II5 6
ProfileII6 =
>II= >
(II> ?
)II? @
;II@ A
}JJ 
applicationLL 
.LL 
ProfilesLL  
.LL  !
ClearLL! &
(LL& '
)LL' (
;LL( )
ifNN 
(NN 

newProfileNN 
!=NN 
nullNN "
)NN" #
{OO 
applicationPP 
.PP 
ProfilesPP $
.PP$ %
AddPP% (
(PP( )

newProfilePP) 3
)PP3 4
;PP4 5
}QQ 
_contextSS 
.SS 
SaveChangesSS  
(SS  !
)SS! "
;SS" #
returnTT 
applicationTT 
;TT 
}UU 	
}VV 
publicXX 

	interfaceXX !
IEditApplicationModelXX *
{YY 
intZZ 
ApplicationIdZZ 
{ZZ 
getZZ 
;ZZ  
}ZZ! "
string[[ 
ApplicationName[[ 
{[[  
get[[! $
;[[$ %
}[[& '
int\\ 
VendorId\\ 
{\\ 
get\\ 
;\\ 
}\\ 
string]] 
ClaimSetName]] 
{]] 
get]] !
;]]! "
}]]# $
int^^ 
?^^ 
	ProfileId^^ 
{^^ 
get^^ 
;^^ 
}^^ 
IEnumerable__ 
<__ 
int__ 
>__ $
EducationOrganizationIds__ 1
{__2 3
get__4 7
;__7 8
}__9 :
}`` 
}aa ⁄4
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Commands\EditVendorCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Commands0 8
{ 
public 

class 
EditVendorCommand "
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public 
EditVendorCommand  
(  !
IUsersContext! .
context/ 6
)6 7
{ 	
_context 
= 
context 
; 
} 	
public 
Vendor 
Execute 
( 
IEditVendor )
changedVendorData* ;
); <
{ 	
var 
vendor 
= 
_context !
.! "
Vendors" )
.) *
SingleOrDefault* 9
(9 :
v: ;
=>< >
v? @
.@ A
VendorIdA I
==J L
changedVendorDataM ^
.^ _
VendorId_ g
)g h
;h i
if 
( 
vendor 
== 
null 
) 
{ 
throw 
new 
NotFoundException +
<+ ,
int, /
>/ 0
(0 1
$str1 9
,9 :
changedVendorData; L
.L M
VendorIdM U
)U V
;V W
}   
if!! 
(!! 
vendor!! 
.!! "
IsSystemReservedVendor!! -
(!!- .
)!!. /
)!!/ 0
{"" 
throw## 
new## 
	Exception## #
(### $
$str##$ q
)##q r
;##r s
}$$ 
vendor&& 
.&& 

VendorName&& 
=&& 
changedVendorData&&  1
.&&1 2
Company&&2 9
;&&9 :
if(( 
((( 
vendor(( 
.(( #
VendorNamespacePrefixes(( .
.((. /
Any((/ 2
(((2 3
)((3 4
)((4 5
{)) 
foreach** 
(** 
var** !
vendorNamespacePrefix** 2
in**3 5
vendor**6 <
.**< =#
VendorNamespacePrefixes**= T
.**T U
ToList**U [
(**[ \
)**\ ]
)**] ^
{++ 
_context,, 
.,, #
VendorNamespacePrefixes,, 5
.,,5 6
Remove,,6 <
(,,< =!
vendorNamespacePrefix,,= R
),,R S
;,,S T
}-- 
}.. 
var00 
namespacePrefixes00 !
=00" #
changedVendorData00$ 5
.005 6
NamespacePrefixes006 G
?00G H
.00H I
Split00I N
(00N O
$str00O R
)00R S
.11 
Where11 
(11 
namespacePrefix11 &
=>11' )
!11* +
string11+ 1
.111 2
IsNullOrWhiteSpace112 D
(11D E
namespacePrefix11E T
)11T U
)11U V
.22 
Select22 
(22 
namespacePrefix22 '
=>22( *
new22+ .!
VendorNamespacePrefix22/ D
{33 
NamespacePrefix44 #
=44$ %
namespacePrefix44& 5
.445 6
Trim446 :
(44: ;
)44; <
,44< =
Vendor55 
=55 
vendor55 #
}66 
)66 
;66 
foreach88 
(88 
var88 
namespacePrefix88 (
in88) +
namespacePrefixes88, =
??88> @

Enumerable88A K
.88K L
Empty88L Q
<88Q R!
VendorNamespacePrefix88R g
>88g h
(88h i
)88i j
)88j k
{99 
_context:: 
.:: #
VendorNamespacePrefixes:: 0
.::0 1
Add::1 4
(::4 5
namespacePrefix::5 D
)::D E
;::E F
};; 
if== 
(== 
vendor== 
.== 
Users== 
?== 
.== 
FirstOrDefault== ,
(==, -
)==- .
!===/ 1
null==2 6
)==6 7
{>> 
vendor?? 
.?? 
Users?? 
.?? 
First?? "
(??" #
)??# $
.??$ %
FullName??% -
=??. /
changedVendorData??0 A
.??A B
ContactName??B M
;??M N
vendor@@ 
.@@ 
Users@@ 
.@@ 
First@@ "
(@@" #
)@@# $
.@@$ %
Email@@% *
=@@+ ,
changedVendorData@@- >
.@@> ?
ContactEmailAddress@@? R
;@@R S
}AA 
elseCC 
{DD 
varEE 
vendorContactEE !
=EE" #
newEE$ '

VendorUserEE( 2
{FF 
VendorGG 
=GG 
vendorGG #
,GG# $
FullNameHH 
=HH 
changedVendorDataHH 0
.HH0 1
ContactNameHH1 <
,HH< =
EmailII 
=II 
changedVendorDataII -
.II- .
ContactEmailAddressII. A
}JJ 
;JJ 
vendorKK 
.KK 
UsersKK 
=KK 
newKK "
ListKK# '
<KK' (

VendorUserKK( 2
>KK2 3
{KK4 5
vendorContactKK6 C
}KKD E
;KKE F
}LL 
_contextNN 
.NN 
SaveChangesNN  
(NN  !
)NN! "
;NN" #
returnOO 
vendorOO 
;OO 
}PP 	
}QQ 
publicSS 

	interfaceSS 
IEditVendorSS  
{TT 
intUU 
VendorIdUU 
{UU 
getUU 
;UU 
setUU 
;UU  
}UU! "
stringVV 
CompanyVV 
{VV 
getVV 
;VV 
setVV !
;VV! "
}VV# $
stringWW 
NamespacePrefixesWW  
{WW! "
getWW# &
;WW& '
setWW( +
;WW+ ,
}WW- .
stringXX 
ContactNameXX 
{XX 
getXX  
;XX  !
setXX" %
;XX% &
}XX' (
stringYY 
ContactEmailAddressYY "
{YY# $
getYY% (
;YY( )
setYY* -
;YY- .
}YY/ 0
}ZZ 
}[[ ¶
xC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Commands\RegenerateApiClientSecretCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Commands0 8
{ 
public 

class ,
 RegenerateApiClientSecretCommand 1
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public ,
 RegenerateApiClientSecretCommand /
(/ 0
IUsersContext0 =
context> E
)E F
{ 	
_context 
= 
context 
; 
} 	
public +
RegenerateApiClientSecretResult .
Execute/ 6
(6 7
int7 :
applicationId; H
)H I
{ 	
var 
application 
= 
_context &
.& '
Applications' 3
.3 4
SingleOrDefault4 C
(C D
aD E
=>F H
aI J
.J K
ApplicationIdK X
==Y [
applicationId\ i
)i j
;j k
if 
( 
application 
== 
null "
)" #
{ 
throw 
new 
NotFoundException +
<+ ,
int, /
>/ 0
(0 1
$str1 >
,> ?
applicationId@ M
)M N
;N O
} 
var 
	apiClient 
= 
application '
.' (

ApiClients( 2
.2 3
First3 8
(8 9
)9 :
;: ;
	apiClient   
.   
GenerateSecret   $
(  $ %
)  % &
;  & '
	apiClient!! 
.!! 
SecretIsHashed!! $
=!!% &
false!!' ,
;!!, -
_context"" 
."" 
SaveChanges""  
(""  !
)""! "
;""" #
return$$ 
new$$ +
RegenerateApiClientSecretResult$$ 6
{%% 
Key&& 
=&& 
	apiClient&& 
.&&  
Key&&  #
,&&# $
Secret'' 
='' 
	apiClient'' "
.''" #
Secret''# )
,'') *
Application(( 
=(( 
application(( )
})) 
;)) 
}** 	
}++ 
public-- 

class-- +
RegenerateApiClientSecretResult-- 0
{.. 
public// 
string// 
Key// 
{// 
get// 
;//  
set//! $
;//$ %
}//& '
public00 
string00 
Secret00 
{00 
get00 "
;00" #
set00$ '
;00' (
}00) *
public11 
Application11 
Application11 &
{11' (
get11) ,
;11, -
set11. 1
;111 2
}113 4
}22 
}33 Ò
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Commands\ValidationConstants.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Commands0 8
{ 
public 

static 
class 
ValidationConstants +
{		 
public

 
static

 
int

 (
MaximumApplicationNameLength

 6
=

7 8
$num

9 ;
;

; <
} 
} ÿ
ÄC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\EntityFrameworkCoreDatabaseModelBuilderExtensions.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Database

' /
{ 
public 

static 
class =
1EntityFrameworkCoreDatabaseModelBuilderExtensions I
{ 
public 
static 
void 2
&ApplyDatabaseServerSpecificConventions A
(A B
thisB F
ModelBuilderG S
modelBuilderT `
,` a
stringb h
databaseEnginei w
)w x
{ 	
if 
( 
$str 
. 
Equals "
(" #
databaseEngine# 1
,1 2
StringComparison3 C
.C D&
InvariantCultureIgnoreCaseD ^
)^ _
)_ `
{ 
return 
; 
} 
foreach 
( 
var 
entity 
in  "
modelBuilder# /
./ 0
Model0 5
.5 6
GetEntityTypes6 D
(D E
)E F
)F G
{ 
entity 
. 
SetTableName #
(# $
entity$ *
.* +
GetTableName+ 7
(7 8
)8 9
.9 :
ToLowerInvariant: J
(J K
)K L
)L M
;M N
foreach 
( 
var 
property %
in& (
entity) /
./ 0
GetProperties0 =
(= >
)> ?
)? @
{ 
var 
tableId 
=  !!
StoreObjectIdentifier" 7
.7 8
Table8 =
(= >
entity> D
.D E
GetTableNameE Q
(Q R
)R S
)S T
;T U
var 

columnName "
=# $
property% -
.- .
GetColumnName. ;
(; <
tableId< C
)C D
??E G
propertyH P
.P Q 
GetDefaultColumnNameQ e
(e f
tableIdf m
)m n
;n o
property 
. 
SetColumnName *
(* +

columnName+ 5
.5 6
ToLowerInvariant6 F
(F G
)G H
)H I
;I J
} 
foreach   
(   
var   
key    
in  ! #
entity  $ *
.  * +
GetKeys  + 2
(  2 3
)  3 4
)  4 5
key!! 
.!! 
SetName!! 
(!!  
key!!  #
.!!# $
GetName!!$ +
(!!+ ,
)!!, -
.!!- .
ToLowerInvariant!!. >
(!!> ?
)!!? @
)!!@ A
;!!A B
foreach## 
(## 
var## 
key##  
in##! #
entity##$ *
.##* +
GetForeignKeys##+ 9
(##9 :
)##: ;
)##; <
key$$ 
.$$ 
SetConstraintName$$ )
($$) *
key$$* -
.$$- .
GetConstraintName$$. ?
($$? @
)$$@ A
.$$A B
ToLowerInvariant$$B R
($$R S
)$$S T
)$$T U
;$$U V
foreach&& 
(&& 
var&& 
index&& "
in&&# %
entity&&& ,
.&&, -

GetIndexes&&- 7
(&&7 8
)&&8 9
)&&9 :
index'' 
.'' 
SetDatabaseName'' )
('') *
index''* /
.''/ 0
GetDatabaseName''0 ?
(''? @
)''@ A
.''A B
ToLowerInvariant''B R
(''R S
)''S T
)''T U
;''U V
}(( 
})) 	
}** 
}++ ö
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\AdminAppUser.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Models0 6
{		 
public

 

class

 
AdminAppUser

 
:

 
IdentityUser

  ,
{ 
public 
AdminAppUser 
( 
) 
: 
base  $
($ %
)% &
{ 	
} 	
public 
AdminAppUser 
( 
string "
userName# +
)+ ,
:- .
base/ 3
(3 4
userName4 <
)< =
{ 	
} 	
public 
bool !
RequirePasswordChange )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} √
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\ApplicationConfiguration.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Models0 6
{ 
public 

class $
ApplicationConfiguration )
:* +
Entity, 2
{		 
public

 
bool

 !
AllowUserRegistration

 )
{

* +
get

, /
;

/ 0
set

1 4
;

4 5
}

6 7
public 
bool #
FirstTimeSetUpCompleted +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} Æ
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\AspNetIdentityShimTypes.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Models0 6
{ 
public 

class 
IdentityUserClaim "
:# $
IdentityUserClaim% 6
<6 7
string7 =
>= >
{ 
} 
public		 

class		 
IdentityUserLogin		 "
:		# $
IdentityUserLogin		% 6
<		6 7
string		7 =
>		= >
{

 
} 
public 

class 
IdentityUserRole !
:" #
IdentityUserRole$ 4
<4 5
string5 ;
>; <
{ 
} 
} ﬂ
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\DatabaseVersion.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Models0 6
{ 
public 

class 
DatabaseVersion  
{ 
public 
string 
VersionString #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ö
\C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\Entity.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Database		' /
.		/ 0
Models		0 6
{

 
public 

abstract 
class 
Entity  
{ 
[ 	
Key	 
, 
DatabaseGenerated 
(  #
DatabaseGeneratedOption  7
.7 8
Identity8 @
)@ A
]A B
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
} 
} ˆ
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\Permission.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Models0 6
{ 
public 

enum 

Permission 
{		  
AccessGlobalSettings

 
=

 
$num

  
} 
} ‚
ZC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\Role.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Database		' /
.		/ 0
Models		0 6
{

 
public 

class 
Role 
: 
Enumeration #
<# $
Role$ (
,( )
int* -
>- .
{ 
public 
string 
OidcClaimValue $
{% &
get' *
;* +
}, -
public 
static 
readonly 
Role #

SuperAdmin$ .
=/ 0
new1 4
Role5 9
(9 :
$num: ;
,; <
$str= R
,R S
$strT p
)p q
;q r
public 
static 
readonly 
Role #
Admin$ )
=* +
new, /
Role0 4
(4 5
$num5 6
,6 7
$str8 G
,G H
$strI _
)_ `
;` a
private 
Role 
( 
int 
value 
, 
string  &
displayName' 2
,2 3
string4 :
oidcClaimValue; I
)I J
: 
base 
( 
value 
, 
displayName %
)% &
{ 	
OidcClaimValue 
= 
oidcClaimValue +
;+ ,
} 	
public 
static 
Role 
FromOidcClaims )
() *
IEnumerable* 5
<5 6
string6 <
>< =
roleClaimValues> M
)M N
{ 	
if 
( 
roleClaimValues 
.  
Contains  (
(( )

SuperAdmin) 3
.3 4
OidcClaimValue4 B
)B C
)C D
return 

SuperAdmin !
;! "
if 
( 
roleClaimValues 
.  
Contains  (
(( )
Admin) .
.. /
OidcClaimValue/ =
)= >
)> ?
return 
Admin 
; 
return 
null 
; 
} 	
}   
}!! ∂
dC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\RolePermission.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Models0 6
{		 
public

 

class

 
RolePermission

 
{ 
private 
static 
readonly 

Permission  *
[* +
]+ ,!
SuperAdminPermissions- B
=C D
{ 	

Permission 
.  
AccessGlobalSettings +
} 	
;	 

private 
static 
readonly 

Permission  *
[* +
]+ ,
AdminPermissions- =
=> ?
{ 	
} 	
;	 

public 
static 

Permission  
[  !
]! "
GetPermissions# 1
(1 2
string2 8
roleId9 ?
)? @
{ 	
if 
( 
int 
. 
TryParse 
( 
roleId #
,# $
out% (
int) ,
value- 2
)2 3
)3 4
{ 
if 
( 
Role 
. 
TryParse !
(! "
value" '
,' (
out) ,
Role- 1
role2 6
)6 7
)7 8
{ 
if 
( 
role 
== 
Role  $
.$ %

SuperAdmin% /
)/ 0
return !
SuperAdminPermissions 4
;4 5
if 
( 
role 
== 
Role  $
.$ %
Admin% *
)* +
return 
AdminPermissions /
;/ 0
}   
}!! 
return## 
Array## 
.## 
Empty## 
<## 

Permission## )
>##) *
(##* +
)##+ ,
;##, -
}$$ 	
}%% 
}&& ‘
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\SecretConfiguration.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Models0 6
{ 
public 

class 
SecretConfiguration $
:% &
Entity' -
{		 
public

 
string

 
EncryptedData

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
int 
? 
OdsInstanceId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsEncrypted 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} Ç
qC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Models\UserOdsInstanceRegistration.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Models0 6
{ 
public 

class 
UserOdsInstance  
{		 
public

 
string

 
UserId

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
int 
OdsInstanceId  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ≤
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Ods\DatabaseConnectionProvider.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Ods0 3
{ 
public 

	interface '
IDatabaseConnectionProvider 0
{ 
IDbConnection 
CreateNewConnection )
() *
)* +
;+ ,
} 
public 

class &
DatabaseConnectionProvider +
:, -'
IDatabaseConnectionProvider. I
{ 
private 
readonly $
IConnectionStringService 1$
_connectionStringService2 J
;J K
private 
readonly 
IOptions !
<! "
AppSettings" -
>- .
_appSettings/ ;
;; <
public &
DatabaseConnectionProvider )
() *$
IConnectionStringService* B#
connectionStringServiceC Z
, 
IOptions 
< 
AppSettings "
>" #
appSettings$ /
) 
{   	$
_connectionStringService!! $
=!!% &#
connectionStringService!!' >
;!!> ?
_appSettings"" 
="" 
appSettings"" &
;""& '
}## 	
public&& 
IDbConnection&& 
CreateNewConnection&& 0
(&&0 1
)&&1 2
{'' 	
var(( 
connectionString((  
=((! "$
_connectionStringService((# ;
.((; <
GetConnectionString((< O
(((O P
)((P Q
;((Q R
var** 
isPostgreSql** 
=** 
$str** +
.**+ ,
Equals**, 2
(**2 3
_appSettings**3 ?
.**? @
Value**@ E
.**E F
DatabaseEngine**F T
,**T U
StringComparison**V f
.**f g'
InvariantCultureIgnoreCase	**g Å
)
**Å Ç
;
**Ç É
if,, 
(,, 
isPostgreSql,, 
),, 
{-- 
return.. 
new.. 
NpgsqlConnection.. +
(..+ ,
connectionString.., <
)..< =
;..= >
}// 
return11 
new11 
SqlConnection11 $
(11$ %
connectionString11% 5
)115 6
;116 7
}22 	
}33 
}44 û
xC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Ods\SchoolYears\GetCurrentSchoolYearQuery.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Database		' /
.		/ 0
Ods		0 3
.		3 4
SchoolYears		4 ?
{

 
public 

class %
GetCurrentSchoolYearQuery *
{ 
private 
readonly '
IDatabaseConnectionProvider 4'
_databaseConnectionProvider5 P
;P Q
public %
GetCurrentSchoolYearQuery (
(( )'
IDatabaseConnectionProvider) D&
databaseConnectionProviderE _
)_ `
{ 	'
_databaseConnectionProvider '
=( )&
databaseConnectionProvider* D
;D E
} 	
public 
SchoolYearType 
Execute %
(% &
)& '
{ 	
using 
( 
var 

connection !
=" #'
_databaseConnectionProvider$ ?
.? @
CreateNewConnection@ S
(S T
)T U
)U V
{ 
var 
current 
= 

connection (
.( )
Query) .
<. /
SchoolYearType/ =
>= >
(> ?
$str C
,C D
newE H
{I J
CurrentSchoolYearK \
=] ^
true_ c
}d e
)e f
.f g
ToListg m
(m n
)n o
;o p
if 
( 
current 
. 
Count !
!=" $
$num% &
)& '
return 
null 
;  
return   
current   
.   
Single   %
(  % &
)  & '
;  ' (
}!! 
}"" 	
}## 
}$$ Ò
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Ods\SchoolYears\GetSchoolYearsQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Database

' /
.

/ 0
Ods

0 3
.

3 4
SchoolYears

4 ?
{ 
public 

class 
GetSchoolYearsQuery $
{ 
private 
readonly '
IDatabaseConnectionProvider 4'
_databaseConnectionProvider5 P
;P Q
public 
GetSchoolYearsQuery "
(" #'
IDatabaseConnectionProvider# >&
databaseConnectionProvider? Y
)Y Z
{ 	'
_databaseConnectionProvider '
=( )&
databaseConnectionProvider* D
;D E
} 	
public 
IReadOnlyList 
< 
SchoolYearType +
>+ ,
Execute- 4
(4 5
)5 6
{ 	
using 
( 
var 

connection !
=" #'
_databaseConnectionProvider$ ?
.? @
CreateNewConnection@ S
(S T
)T U
)U V
{ 
return 

connection !
.! "
Query" '
<' (
SchoolYearType( 6
>6 7
(7 8
$str *
)* +
.+ ,
ToList, 2
(2 3
)3 4
;4 5
} 
} 	
} 
}   ”
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Ods\SchoolYears\SchoolYearType.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Ods0 3
.3 4
SchoolYears4 ?
{ 
public 

class 
SchoolYearType 
{		 
public

 
short

 

SchoolYear

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string !
SchoolYearDescription +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
bool 
CurrentSchoolYear %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ª
zC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Ods\SchoolYears\SetCurrentSchoolYearCommand.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Database		' /
.		/ 0
Ods		0 3
.		3 4
SchoolYears		4 ?
{

 
public 

	interface (
ISetCurrentSchoolYearCommand 1
{ 
void 
Execute 
( 
short 

schoolYear %
)% &
;& '
} 
public 

class '
SetCurrentSchoolYearCommand ,
:- .(
ISetCurrentSchoolYearCommand/ K
{ 
private 
readonly '
IDatabaseConnectionProvider 4'
_databaseConnectionProvider5 P
;P Q
public '
SetCurrentSchoolYearCommand *
(* +'
IDatabaseConnectionProvider+ F&
databaseConnectionProviderG a
)a b
{ 	'
_databaseConnectionProvider '
=( )&
databaseConnectionProvider* D
;D E
} 	
public 
void 
Execute 
( 
short !

schoolYear" ,
), -
{ 	
using 
( 
var 

connection !
=" #'
_databaseConnectionProvider$ ?
.? @
CreateNewConnection@ S
(S T
)T U
)U V
{ 
var   
rowsAffected    
=  ! "

connection  # -
.  - .
Execute  . 5
(  5 6
$str!# 5
,##5 6
new##7 :
{##; <

schoolYear##= G
}##H I
)##I J
;##J K
if%% 
(%% 
rowsAffected%%  
==%%! #
$num%%$ %
)%%% &
throw&& 
new&& 
	Exception&& '
(&&' (
$"&&( *
$str&&* 6
{&&6 7

schoolYear&&7 A
}&&A B
$str&&B R
"&&R S
)&&S T
;&&T U

connection(( 
.(( 
Execute(( "
(((" #
$str)+ 6
,++6 7
new++8 ;
{++< =

schoolYear++> H
}++I J
)++J K
;++K L
},, 
}-- 	
}.. 
}// É
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetAllClaimSetsQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Queries0 7
{ 
public 

	interface !
IGetAllClaimSetsQuery *
{ 
IEnumerable 
< 
ClaimSet 
> 
Execute %
(% &
)& '
;' (
} 
public 

class  
GetAllClaimSetsQuery %
:& '!
IGetAllClaimSetsQuery( =
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public  
GetAllClaimSetsQuery #
(# $
ISecurityContext$ 4
securityContext5 D
)D E
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
IEnumerable 
< 
ClaimSet #
># $
Execute% ,
(, -
)- .
{ 	
return 
_securityContext #
.# $
	ClaimSets$ -
. 
Select 
( 
x 
=> 
new  
ClaimSet! )
{ 
Id   
=   
x   
.   

ClaimSetId   %
,  % &
Name!! 
=!! 
x!! 
.!! 
ClaimSetName!! )
}"" 
)"" 
.## 
Distinct## 
(## 
)## 
.$$ 
OrderBy$$ 
($$ 
x$$ 
=>$$ 
x$$ 
.$$  
Name$$  $
)$$$ %
.%% 
ToList%% 
(%% 
)%% 
;%% 
}&& 	
}'' 
}(( …
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetApplicationByIdQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Queries0 7
{ 
public 

class #
GetApplicationByIdQuery (
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public #
GetApplicationByIdQuery &
(& '
IUsersContext' 4
context5 <
)< =
{ 	
_context 
= 
context 
; 
} 	
public 
Application 
Execute "
(" #
int# &
applicationId' 4
)4 5
{ 	
var 
application 
= 
_context &
.& '
Applications' 3
.3 4
SingleOrDefault4 C
(C D
appD G
=>H J
appK N
.N O
ApplicationIdO \
==] _
applicationId` m
)m n
;n o
if 
( 
application 
== 
null #
)# $
{ 
throw 
new 
NotFoundException +
<+ ,
int, /
>/ 0
(0 1
$str1 >
,> ?
applicationId@ M
)M N
;N O
} 
return 
application 
; 
} 	
}   
}!! £
uC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetApplicationsByVendorIdQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Queries0 7
{ 
public 

class *
GetApplicationsByVendorIdQuery /
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public *
GetApplicationsByVendorIdQuery -
(- .
IUsersContext. ;
context< C
)C D
{ 	
_context 
= 
context 
; 
} 	
public 
List 
< 
Application 
>  
Execute! (
(( )
int) ,
vendorid- 5
)5 6
{ 	
var 
applications 
= 
_context '
.' (
Applications( 4
. 
Where 
( 
a 
=> 
a 
. 
Vendor $
!=% '
null( ,
&&- /
a0 1
.1 2
Vendor2 8
.8 9
VendorId9 A
==B D
vendoridE M
)M N
. 
ToList 
( 
) 
; 
if 
( 
! 
applications 
. 
Any !
(! "
)" #
&&$ &
_context' /
./ 0
Vendors0 7
.7 8
Find8 <
(< =
vendorid= E
)E F
==G I
nullJ N
)N O
{ 
throw 
new 
NotFoundException +
<+ ,
int, /
>/ 0
(0 1
$str1 9
,9 :
vendorid; C
)C D
;D E
}   
return"" 
applications"" 
;""  
}## 	
}$$ 
}%% –
{C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetChildResourceClaimsForParentQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Queries0 7
{ 
public 

class 0
$GetChildResourceClaimsForParentQuery 5
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public 0
$GetChildResourceClaimsForParentQuery 3
(3 4
ISecurityContext4 D
securityContextE T
)T U
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
IEnumerable 
< 
ResourceClaim (
>( )
Execute* 1
(1 2
int2 5!
parentResourceClaimId6 K
)K L
{ 	
var #
childResourcesForParent '
=( )
_securityContext* :
.: ;
ResourceClaims; I
. 
Where 
( 
x 
=> 
x 
. !
ParentResourceClaimId 3
==4 6!
parentResourceClaimId7 L
)L M
.M N
ToListN T
(T U
)U V
;V W
return #
childResourcesForParent *
. 
Select 
( 
x 
=> 
new  
ResourceClaim! .
(. /
)/ 0
{ 
Name 
= 
x 
. 
ResourceName )
,) *
Id 
= 
x 
. 
ResourceClaimId *
,* +
ParentId 
= !
parentResourceClaimId 4
}   
)   
.!! 
Distinct!! 
(!! 
)!! 
."" 
OrderBy"" 
("" 
x"" 
=>"" 
x"" 
.""  
Name""  $
)""$ %
.## 
ToList## 
(## 
)## 
;## 
}$$ 	
}%% 
}&& °
lC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetClaimSetNamesQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Database

' /
.

/ 0
Queries

0 7
{ 
public 

class !
GetClaimSetNamesQuery &
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public !
GetClaimSetNamesQuery $
($ %
ISecurityContext% 5
securityContext6 E
)E F
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
IEnumerable 
< 
string !
>! "
Execute# *
(* +
bool+ /*
excludeSystemReservedClaimSets0 N
=O P
falseQ V
,V W
boolX \&
excludeEdFiPresetClaimSets] w
=x y
falsez 
)	 Ä
{ 	
var 
	claimSets 
= 
_securityContext ,
., -
	ClaimSets- 6
.6 7
AsEnumerable7 C
(C D
)D E
;E F
if 
( *
excludeSystemReservedClaimSets .
). /
{ 
	claimSets 
= 
	claimSets %
.% &
Where& +
(+ ,
x, -
=>. 0
!1 2
x2 3
.3 4!
ForApplicationUseOnly4 I
&&J L
! 
CloudOdsAdminApp !
.! "#
SystemReservedClaimSets" 9
.9 :
Contains: B
(B C
xC D
.D E
ClaimSetNameE Q
)Q R
)R S
;S T
} 
if 
( &
excludeEdFiPresetClaimSets *
)* +
{   
	claimSets!! 
=!! 
	claimSets!! %
.!!% &
Where!!& +
(!!+ ,
x!!, -
=>!!. 0
!!!1 2
x!!2 3
.!!3 4
IsEdfiPreset!!4 @
)!!@ A
;!!A B
}"" 
return$$ 
	claimSets$$ 
.%% 
Select%% 
(%% 
x%% 
=>%% 
x%% 
.%% 
ClaimSetName%% +
)%%+ ,
.&& 
Distinct&& 
(&& 
)&& 
.'' 
OrderBy'' 
('' 
x'' 
=>'' 
x'' 
)''  
.(( 
ToList(( 
((( 
)(( 
;(( 
})) 	
}** 
}++ Ö

jC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetOdsInstanceQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Database

' /
.

/ 0
Queries

0 7
{ 
public 

class 
GetOdsInstanceQuery $
{ 
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
public 
GetOdsInstanceQuery "
(" #
IUsersContext# 0
userContext1 <
)< =
{ 	
_usersContext 
= 
userContext '
;' (
} 	
public 
OdsInstance 
Execute "
(" #
string# )
instanceName* 6
)6 7
{ 	
return 
_usersContext  
.  !
OdsInstances! -
.- .
SingleOrDefault. =
(= >
i> ?
=>@ B
iC D
.D E
NameE I
==J L
instanceNameM Y
)Y Z
;Z [
} 	
} 
} é

gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetProfilesQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Queries0 7
{ 
public 

class 
GetProfilesQuery !
{ 
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
public 
GetProfilesQuery 
(  
IUsersContext  -
usersContext. :
): ;
{ 	
_usersContext 
= 
usersContext (
;( )
} 	
public 
List 
< 
Profile 
> 
Execute $
($ %
)% &
{ 	
return 
_usersContext  
.  !
Profiles! )
.) *
OrderBy* 1
(1 2
p2 3
=>4 6
p7 8
.8 9
ProfileName9 D
)D E
.E F
ToListF L
(L M
)M N
;N O
} 	
} 
} √
wC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetResourceClaimsAsFlatListQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Queries0 7
{ 
public 

class ,
 GetResourceClaimsAsFlatListQuery 1
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public ,
 GetResourceClaimsAsFlatListQuery /
(/ 0
ISecurityContext0 @
securityContextA P
)P Q
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
IEnumerable 
< 
ResourceClaim (
>( )
Execute* 1
(1 2
)2 3
{ 	
return 
_securityContext #
.# $
ResourceClaims$ 2
. 
Select 
( 
x 
=> 
new  
ResourceClaim! .
{ 
Id 
= 
x 
. 
ResourceClaimId *
,* +
Name 
= 
x 
. 
ResourceName )
,) *
ParentId 
= 
x  
.  !!
ParentResourceClaimId! 6
??7 9
$num: ;
,; <

ParentName 
=  
x! "
." #
ParentResourceClaim# 6
.6 7
ResourceName7 C
} 
) 
.   
Distinct   
(   
)   
.!! 
OrderBy!! 
(!! 
x!! 
=>!! 
x!! 
.!!  
Name!!  $
)!!$ %
."" 
ToList"" 
("" 
)"" 
;"" 
}## 	
}$$ 
}%% û!
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetResourceClaimsQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Queries0 7
{ 
public 

	interface #
IGetResourceClaimsQuery ,
{ 
IEnumerable 
< 
ResourceClaim !
>! "
Execute# *
(* +
)+ ,
;, -
} 
public 

class "
GetResourceClaimsQuery '
:( )#
IGetResourceClaimsQuery* A
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public "
GetResourceClaimsQuery %
(% &
ISecurityContext& 6
securityContext7 F
)F G
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
IEnumerable 
< 
ResourceClaim (
>( )
Execute* 1
(1 2
)2 3
{ 	
var 
	resources 
= 
new 
List  $
<$ %
ResourceClaim% 2
>2 3
(3 4
)4 5
;5 6
var 
parentResources 
=  !
_securityContext" 2
.2 3
ResourceClaims3 A
.A B
WhereB G
(G H
xH I
=>J L
xM N
.N O
ParentResourceClaimO b
==c e
nullf j
)j k
.k l
ToListl r
(r s
)s t
;t u
var 
childResources 
=  
_securityContext! 1
.1 2
ResourceClaims2 @
.@ A
WhereA F
(F G
xG H
=>I K
xL M
.M N
ParentResourceClaimN a
!=b d
nulle i
)i j
.j k
ToListk q
(q r
)r s
;s t
foreach   
(   
var   
parentResource   '
in  ( *
parentResources  + :
)  : ;
{!! 
var"" 
children"" 
="" 
childResources"" -
.""- .
Where"". 3
(""3 4
x""4 5
=>""6 8
x""9 :
."": ;!
ParentResourceClaimId""; P
==""Q S
parentResource""T b
.""b c
ResourceClaimId""c r
)""r s
;""s t
	resources## 
.## 
Add## 
(## 
new## !
ResourceClaim##" /
{$$ 
Children%% 
=%% 
children%% '
.%%' (
Select%%( .
(%%. /
child%%/ 4
=>%%5 7
new%%8 ;
ResourceClaim%%< I
(%%I J
)%%J K
{&& 
Id'' 
='' 
child'' "
.''" #
ResourceClaimId''# 2
,''2 3
Name(( 
=(( 
child(( $
.(($ %
ResourceName((% 1
,((1 2
ParentId))  
=))! "
parentResource))# 1
.))1 2
ResourceClaimId))2 A
}** 
)** 
.** 
ToList** 
(** 
)** 
,**  
Name++ 
=++ 
parentResource++ )
.++) *
ResourceName++* 6
,++6 7
Id,, 
=,, 
parentResource,, '
.,,' (
ResourceClaimId,,( 7
}-- 
)-- 
;-- 
}.. 
return// 
	resources// 
.00 
Distinct00 
(00 
)00 
.11 
OrderBy11 
(11 
x11 
=>11 
x11 
.11  
Name11  $
)11$ %
.22 
ToList22 
(22 
)22 
;22 
}33 	
}44 
}55 »
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetVendorByIdQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Database

' /
.

/ 0
Queries

0 7
{ 
public 

	interface 
IGetVendorByIdQuery (
{ 
Vendor 
Execute 
( 
int 
vendorId #
)# $
;$ %
} 
public 

class 
GetVendorByIdQuery #
:$ %
IGetVendorByIdQuery& 9
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public 
GetVendorByIdQuery !
(! "
IUsersContext" /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
public 
Vendor 
Execute 
( 
int !
vendorId" *
)* +
{ 	
var 
vendor 
= 
_context !
.! "
Vendors" )
.) *
SingleOrDefault* 9
(9 :
v: ;
=>< >
v? @
.@ A
VendorIdA I
==J L
vendorIdM U
)U V
;V W
return 
vendor 
; 
} 	
} 
}   ‹
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\GetVendorsQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Database' /
./ 0
Queries0 7
{ 
public 

	interface 
IGetVendorsQuery %
{ 
List 
< 
Vendor 
> 
Execute 
( 
) 
; 
List 
< 
Vendor 
> 
Execute 
( 
int  
offset! '
,' (
int( +
limit, 1
)1 2
;2 3
} 
public 

class 
GetVendorsQuery  
:! "
IGetVendorsQuery# 3
{ 
private 
readonly 
IUsersContext &
_context' /
;/ 0
public 
GetVendorsQuery 
( 
IUsersContext ,
context- 4
)4 5
{ 	
_context 
= 
context 
; 
} 	
public 
List 
< 
Vendor 
> 
Execute #
(# $
)$ %
{ 	
return 
_context 
. 
Vendors #
.# $
OrderBy$ +
(+ ,
v, -
=>. 0
v1 2
.2 3

VendorName3 =
)= >
.> ?
Where? D
(D E
vE F
=>G I
!J K
VendorExtensionsK [
.[ \
ReservedNames\ i
.i j
Containsj r
(r s
vs t
.t u

VendorNameu 
.	 Ä
Trim
Ä Ñ
(
Ñ Ö
)
Ö Ü
)
Ü á
)
á à
.
à â
ToList
â è
(
è ê
)
ê ë
;
ë í
} 	
public!! 
List!! 
<!! 
Vendor!! 
>!! 
Execute!! #
(!!# $
int!!$ '
offset!!( .
,!!. /
int!!0 3
limit!!4 9
)!!9 :
{"" 	
return## 
_context## 
.## 
Vendors## #
.### $
OrderBy##$ +
(##+ ,
v##, -
=>##. 0
v##1 2
.##2 3

VendorName##3 =
)##= >
.##> ?
Where##? D
(##D E
v##E F
=>##G I
!##J K
VendorExtensions##K [
.##[ \
ReservedNames##\ i
.##i j
Contains##j r
(##r s
v##s t
.##t u

VendorName##u 
.	## Ä
Trim
##Ä Ñ
(
##Ñ Ö
)
##Ö Ü
)
##Ü á
)
##á à
.
##à â
Skip
##â ç
(
##ç é
offset
##é î
)
##î ï
.
##ï ñ
Take
##ñ ö
(
##ö õ
limit
##õ †
)
##† °
.
##° ¢
ToList
##¢ ®
(
##® ©
)
##© ™
;
##™ ´
}$$ 	
}%% 
}&& ©
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\Queries\VendorExtensions.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Database		' /
.		/ 0
Queries		0 7
{

 
public 

static 
class 
VendorExtensions (
{ 
public 
static 
readonly 
string %
[% &
]& '
ReservedNames( 5
=6 7
{ 	
CloudOdsAdminApp 
. 

VendorName '
,' (
} 	
;	 

public 
static 
bool &
IsSystemReservedVendorName 5
(5 6
string6 <

vendorName= G
)G H
{ 	
return 
ReservedNames  
.  !
Contains! )
() *

vendorName* 4
?4 5
.5 6
Trim6 :
(: ;
); <
)< =
;= >
} 	
public 
static 
bool "
IsSystemReservedVendor 1
(1 2
this2 6
Vendor7 =
vendor> D
)D E
{ 	
return &
IsSystemReservedVendorName -
(- .
vendor. 4
?4 5
.5 6

VendorName6 @
)@ A
;A B
} 	
} 
} »$
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Database\RawSqlConnectionService.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Database		' /
{

 
public 

	interface $
IRawSqlConnectionService -
{ 
string 3
'GetConnectionStringWithAdminCredentials 6
(6 7
OdsSqlConfiguration7 J
configurationK X
,X Y
stringZ `
databaseNamea m
)m n
;n o
Task 
ExecuteDdlAsync 
( 
SqlConnection *

connection+ 5
,5 6
string7 =
sql> A
,A B
intC F
commandTimeoutG U
=V W
$numX [
)[ \
;\ ]
void 

ExecuteDdl 
( 
SqlConnection %

connection& 0
,0 1
string2 8
sql9 <
,< =
int> A
commandTimeoutB P
=Q R
$numS V
)V W
;W X
} 
public 

class #
RawSqlConnectionService (
:) *$
IRawSqlConnectionService+ C
{ 
public 
string 3
'GetConnectionStringWithAdminCredentials =
(= >
OdsSqlConfiguration> Q
configurationR _
,_ `
stringa g
databaseNameh t
)t u
{ 	
return 
GetConnectionString &
(& '
configuration' 4
.4 5
HostName5 =
,= >
databaseName? K
,K L
configurationM Z
.Z [
AdminCredentials[ k
)k l
;l m
} 	
private 
string 
GetConnectionString *
(* +
string+ 1
hostName2 :
,: ;
string< B
databaseNameC O
,O P!
OdsSqlAdminCredentialQ f
sqlCredentialsg u
)u v
{ 	
var #
connectionStringBuilder '
=( )
new* -&
SqlConnectionStringBuilder. H
{ 

DataSource 
= 
hostName %
,% &
UserID 
= 
sqlCredentials '
.' (
UserName( 0
,0 1
Password 
= 
sqlCredentials )
.) *
Password* 2
,2 3
InitialCatalog   
=    
databaseName  ! -
,  - .
ConnectTimeout!! 
=!!  
$num!!! $
}"" 
;"" 
return$$ #
connectionStringBuilder$$ *
.$$* +
ConnectionString$$+ ;
;$$; <
}%% 	
public'' 
async'' 
Task'' 
ExecuteDdlAsync'' )
('') *
SqlConnection''* 7

connection''8 B
,''B C
string''D J
sql''K N
,''N O
int''P S
commandTimeout''T b
=''c d
$num''e h
)''h i
{(( 	
using)) 
()) 
var)) 
command)) 
=))  
new))! $

SqlCommand))% /
())/ 0
sql))0 3
,))3 4

connection))5 ?
)))? @
)))@ A
{** 
command++ 
.++ 
CommandTimeout++ &
=++' (
commandTimeout++) 7
;++7 8
await,, 
command,, 
.,,  
ExecuteNonQueryAsync,, 2
(,,2 3
),,3 4
;,,4 5
}-- 
}.. 	
public00 
void00 

ExecuteDdl00 
(00 
SqlConnection00 ,

connection00- 7
,007 8
string009 ?
sql00@ C
,00C D
int00E H
commandTimeout00I W
=00X Y
$num00Z ]
)00] ^
{11 	
using22 
(22 
var22 
command22 
=22  
new22! $

SqlCommand22% /
(22/ 0
sql220 3
,223 4

connection225 ?
)22? @
)22@ A
{33 
command44 
.44 
CommandTimeout44 &
=44' (
commandTimeout44) 7
;447 8
command55 
.55 
ExecuteNonQuery55 '
(55' (
)55( )
;55) *
}66 
}77 	
}88 
}99 ãb
RC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Enumerations.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
[ 
Serializable 
] 
[ 
DebuggerDisplay 
( 
$str .
). /
]/ 0
public 

abstract 
class 
Enumeration %
<% &
TEnumeration& 2
>2 3
:4 5
Enumeration6 A
<A B
TEnumerationB N
,N O
intP S
>S T
where 
TEnumeration 
:  
Enumeration! ,
<, -
TEnumeration- 9
>9 :
{ 
	protected 
Enumeration 
( 
int !
value" '
,' (
string) /
displayName0 ;
); <
: 
base 
( 
value 
, 
displayName %
)% &
{ 	
} 	
public 
static 
TEnumeration "
	FromInt32# ,
(, -
int- 0
value1 6
)6 7
{ 	
return 
	FromValue 
( 
value "
)" #
;# $
} 	
public 
static 
bool 
TryFromInt32 '
(' (
int( +
listItemValue, 9
,9 :
out; >
TEnumeration? K
resultL R
)R S
{ 	
return 
TryParse 
( 
listItemValue )
,) *
out+ .
result/ 5
)5 6
;6 7
} 	
}   
["" 
Serializable"" 
]"" 
[## 
DebuggerDisplay## 
(## 
$str## .
)##. /
]##/ 0
public$$ 

abstract$$ 
class$$ 
Enumeration$$ %
<$$% &
TEnumeration$$& 2
,$$2 3
TValue$$4 :
>$$: ;
:$$< =
IComparable$$> I
<$$I J
TEnumeration$$J V
>$$V W
,$$W X

IEquatable$$Y c
<$$c d
TEnumeration$$d p
>$$p q
where%% 
TEnumeration%% 
:%% 
Enumeration%% (
<%%( )
TEnumeration%%) 5
,%%5 6
TValue%%7 =
>%%= >
where&& 
TValue&& 
:&& 
IComparable&& "
{'' 
readonly(( 
string(( 
_displayName(( $
;(($ %
readonly)) 
TValue)) 
_value)) 
;)) 
private++ 
static++ 
Lazy++ 
<++ 
TEnumeration++ (
[++( )
]++) *
>++* +
_enumerations++, 9
=++: ;
new++< ?
Lazy++@ D
<++D E
TEnumeration++E Q
[++Q R
]++R S
>++S T
(++T U
GetEnumerations++U d
)++d e
;++e f
	protected-- 
Enumeration-- 
(-- 
TValue-- $
value--% *
,--* +
string--, 2
displayName--3 >
)--> ?
{.. 	
_value// 
=// 
value// 
;// 
_displayName00 
=00 
displayName00 &
;00& '
}11 	
public33 
TValue33 
Value33 
{44 	
get55 
{55 
return55 
_value55 
;55  
}55! "
}66 	
public88 
string88 
DisplayName88 !
{99 	
get:: 
{:: 
return:: 
_displayName:: %
;::% &
}::' (
};; 	
public== 
int== 
	CompareTo== 
(== 
TEnumeration== )
other==* /
)==/ 0
{>> 	
return?? 
Value?? 
.?? 
	CompareTo?? "
(??" #
other??# (
.??( )
Value??) .
)??. /
;??/ 0
}@@ 	
publicBB 
overrideBB 
sealedBB 
stringBB %
ToStringBB& .
(BB. /
)BB/ 0
{CC 	
returnDD 
DisplayNameDD 
;DD 
}EE 	
publicGG 
staticGG 
TEnumerationGG "
[GG" #
]GG# $
GetAllGG% +
(GG+ ,
)GG, -
{HH 	
returnII 
_enumerationsII  
.II  !
ValueII! &
;II& '
}JJ 	
privateLL 
staticLL 
TEnumerationLL #
[LL# $
]LL$ %
GetEnumerationsLL& 5
(LL5 6
)LL6 7
{MM 	
TypeNN 
enumerationTypeNN  
=NN! "
typeofNN# )
(NN) *
TEnumerationNN* 6
)NN6 7
;NN7 8
returnOO 
enumerationTypeOO "
.PP 
	GetFieldsPP 
(PP 
BindingFlagsPP '
.PP' (
PublicPP( .
|PP/ 0
BindingFlagsPP1 =
.PP= >
StaticPP> D
|PPE F
BindingFlagsPPG S
.PPS T
DeclaredOnlyPPT `
)PP` a
.QQ 
WhereQQ 
(QQ 
infoQQ 
=>QQ 
enumerationTypeQQ .
.QQ. /
IsAssignableFromQQ/ ?
(QQ? @
infoQQ@ D
.QQD E
	FieldTypeQQE N
)QQN O
)QQO P
.RR 
SelectRR 
(RR 
infoRR 
=>RR 
infoRR  $
.RR$ %
GetValueRR% -
(RR- .
nullRR. 2
)RR2 3
)RR3 4
.SS 
CastSS 
<SS 
TEnumerationSS "
>SS" #
(SS# $
)SS$ %
.TT 
ToArrayTT 
(TT 
)TT 
;TT 
}UU 	
publicWW 
overrideWW 
boolWW 
EqualsWW #
(WW# $
objectWW$ *
objWW+ .
)WW. /
{XX 	
returnYY 
EqualsYY 
(YY 
objYY 
asYY  
TEnumerationYY! -
)YY- .
;YY. /
}ZZ 	
public\\ 
bool\\ 
Equals\\ 
(\\ 
TEnumeration\\ '
other\\( -
)\\- .
{]] 	
return^^ 
other^^ 
!=^^ 
null^^  
&&^^! #
Value^^$ )
.^^) *
Equals^^* 0
(^^0 1
other^^1 6
.^^6 7
Value^^7 <
)^^< =
;^^= >
}__ 	
publicaa 
overrideaa 
intaa 
GetHashCodeaa '
(aa' (
)aa( )
{bb 	
returncc 
Valuecc 
.cc 
GetHashCodecc $
(cc$ %
)cc% &
;cc& '
}dd 	
publicff 
staticff 
boolff 
operatorff #
==ff$ &
(ff& '
Enumerationff' 2
<ff2 3
TEnumerationff3 ?
,ff? @
TValueffA G
>ffG H
leftffI M
,ffM N
EnumerationffO Z
<ffZ [
TEnumerationff[ g
,ffg h
TValueffi o
>ffo p
rightffq v
)ffv w
{gg 	
returnhh 
Equalshh 
(hh 
lefthh 
,hh 
righthh  %
)hh% &
;hh& '
}ii 	
publickk 
statickk 
boolkk 
operatorkk #
!=kk$ &
(kk& '
Enumerationkk' 2
<kk2 3
TEnumerationkk3 ?
,kk? @
TValuekkA G
>kkG H
leftkkI M
,kkM N
EnumerationkkO Z
<kkZ [
TEnumerationkk[ g
,kkg h
TValuekki o
>kko p
rightkkq v
)kkv w
{ll 	
returnmm 
!mm 
Equalsmm 
(mm 
leftmm 
,mm  
rightmm! &
)mm& '
;mm' (
}nn 	
publicpp 
staticpp 
TEnumerationpp "
	FromValuepp# ,
(pp, -
TValuepp- 3
valuepp4 9
)pp9 :
{qq 	
returnrr 
Parserr 
(rr 
valuerr 
,rr 
$strrr  '
,rr' (
itemrr) -
=>rr. 0
itemrr1 5
.rr5 6
Valuerr6 ;
.rr; <
Equalsrr< B
(rrB C
valuerrC H
)rrH I
)rrI J
;rrJ K
}ss 	
publicuu 
staticuu 
TEnumerationuu "
Parseuu# (
(uu( )
stringuu) /
displayNameuu0 ;
)uu; <
{vv 	
returnww 
Parseww 
(ww 
displayNameww $
,ww$ %
$strww& 4
,ww4 5
itemww6 :
=>ww; =
itemww> B
.wwB C
DisplayNamewwC N
==wwO Q
displayNamewwR ]
)ww] ^
;ww^ _
}xx 	
publiczz 
staticzz 
boolzz 
TryParsezz #
(zz# $
Funczz$ (
<zz( )
TEnumerationzz) 5
,zz5 6
boolzz7 ;
>zz; <
	predicatezz= F
,zzF G
outzzH K
TEnumerationzzL X
resultzzY _
)zz_ `
{{{ 	
result|| 
=|| 
GetAll|| 
(|| 
)|| 
.|| 
FirstOrDefault|| ,
(||, -
	predicate||- 6
)||6 7
;||7 8
return}} 
result}} 
!=}} 
null}} !
;}}! "
}~~ 	
private
ÄÄ 
static
ÄÄ 
TEnumeration
ÄÄ #
Parse
ÄÄ$ )
(
ÄÄ) *
object
ÄÄ* 0
value
ÄÄ1 6
,
ÄÄ6 7
string
ÄÄ8 >
description
ÄÄ? J
,
ÄÄJ K
Func
ÄÄL P
<
ÄÄP Q
TEnumeration
ÄÄQ ]
,
ÄÄ] ^
bool
ÄÄ_ c
>
ÄÄc d
	predicate
ÄÄe n
)
ÄÄn o
{
ÅÅ 	
TEnumeration
ÇÇ 
result
ÇÇ 
;
ÇÇ  
if
ÑÑ 
(
ÑÑ 
!
ÑÑ 
TryParse
ÑÑ 
(
ÑÑ 
	predicate
ÑÑ #
,
ÑÑ# $
out
ÑÑ% (
result
ÑÑ) /
)
ÑÑ/ 0
)
ÑÑ0 1
{
ÖÖ 
string
ÜÜ 
message
ÜÜ 
=
ÜÜ  
string
ÜÜ! '
.
ÜÜ' (
Format
ÜÜ( .
(
ÜÜ. /
$str
ÜÜ/ P
,
ÜÜP Q
value
ÜÜR W
,
ÜÜW X
description
ÜÜY d
,
ÜÜd e
typeof
ÜÜf l
(
ÜÜl m
TEnumeration
ÜÜm y
)
ÜÜy z
)
ÜÜz {
;
ÜÜ{ |
throw
áá 
new
áá 
ArgumentException
áá +
(
áá+ ,
message
áá, 3
,
áá3 4
$str
áá5 <
)
áá< =
;
áá= >
}
àà 
return
ää 
result
ää 
;
ää 
}
ãã 	
public
çç 
static
çç 
bool
çç 
TryParse
çç #
(
çç# $
TValue
çç$ *
value
çç+ 0
,
çç0 1
out
çç2 5
TEnumeration
çç6 B
result
ççC I
)
ççI J
{
éé 	
return
èè 
TryParse
èè 
(
èè 
e
èè 
=>
èè  
e
èè! "
.
èè" #
Value
èè# (
.
èè( )
Equals
èè) /
(
èè/ 0
value
èè0 5
)
èè5 6
,
èè6 7
out
èè8 ;
result
èè< B
)
èèB C
;
èèC D
}
êê 	
public
íí 
static
íí 
bool
íí 
TryParse
íí #
(
íí# $
string
íí$ *
displayName
íí+ 6
,
íí6 7
out
íí8 ;
TEnumeration
íí< H
result
ííI O
)
ííO P
{
ìì 	
return
îî 
TryParse
îî 
(
îî 
e
îî 
=>
îî  
e
îî! "
.
îî" #
DisplayName
îî# .
==
îî/ 1
displayName
îî2 =
,
îî= >
out
îî? B
result
îîC I
)
îîI J
;
îîJ K
}
ïï 	
}
ññ 
}óó Ø
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ErrorHandling\AdminAppException.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ErrorHandling' 4
{ 
public 

	interface 
IAdminAppException '
{ 
string 
Message 
{ 
get 
; 
} 
string		 

StackTrace		 
{		 
get		 
;		  
}		! "
HttpStatusCode

 
?

 

StatusCode

 "
{

# $
get

% (
;

( )
}

* +
bool 
AllowFeedback 
{ 
get  
;  !
}" #
bool  
IsStackTraceRelevant !
{" #
get$ '
;' (
}) *
} 
public 

class 
AdminAppException "
:# $
	Exception% .
,. /
IAdminAppException0 B
{ 
public 
AdminAppException  
(  !
string! '
message( /
)/ 0
:1 2
base3 7
(7 8
message8 ?
)? @
{A B
}C D
public 
AdminAppException  
(  !
string! '
message( /
,/ 0
	Exception1 :
innerException; I
)I J
:K L
baseM Q
(Q R
messageR Y
,Y Z
innerException[ i
)i j
{k l
}m n
public 
HttpStatusCode 
? 

StatusCode )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
AllowFeedback !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
true2 6
;6 7
public 
bool  
IsStackTraceRelevant (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
false9 >
;> ?
} 
} ª

eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ErrorHandling\NotFoundException.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
ErrorHandling' 4
{		 
public

 

class

 
NotFoundException

 "
<

" #
T

# $
>

$ %
:

& '
	Exception

( 1
{ 
public 
string 
ResourceName "
{# $
get% (
;( )
}* +
public 
T 
Id 
{ 
get 
; 
} 
public 
NotFoundException  
(  !
string! '
resourceName( 4
,4 5
T6 7
id8 :
): ;
: 
base 
( 
$" 
$str  
{  !
resourceName! -
}- .
$str. 7
{7 8
id8 :
}: ;
$str; _
"_ `
)` a
{ 	
ResourceName 
= 
resourceName '
;' (
Id 
= 
id 
; 
} 	
} 
} –
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ErrorHandling\OdsApiConnectionException.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
ErrorHandling		' 4
{

 
public 

class %
OdsApiConnectionException *
:+ ,
	Exception- 6
,6 7
IAdminAppException8 J
{ 
public %
OdsApiConnectionException (
(( )
HttpStatusCode) 7
responseCode8 D
,D E
stringF L
responseMessageM \
,\ ]
string^ d
exceptionMessagee u
)u v
:w x
basey }
(} ~
exceptionMessage	~ é
)
é è
{ 	

StatusCode 
= 
responseCode %
;% &
ResponseMessage 
= 
responseMessage -
;- .
} 	
public %
OdsApiConnectionException (
(( )
HttpStatusCode) 7
responseCode8 D
,D E
stringF L
responseMessageM \
,\ ]
string^ d
exceptionMessagee u
,u v
	Exception	w Ä
innerException
Å è
)
è ê
:
ë í
base
ì ó
(
ó ò
exceptionMessage
ò ®
,
® ©
innerException
™ ∏
)
∏ π
{ 	

StatusCode 
= 
responseCode %
;% &
ResponseMessage 
= 
responseMessage -
;- .
} 	
public 
HttpStatusCode 
? 

StatusCode )
{* +
get, /
;/ 0
}1 2
public 
string 
ResponseMessage %
{& '
get( +
;+ ,
}- .
public 
bool 
AllowFeedback !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool  
IsStackTraceRelevant (
{) *
get+ .
=>/ 1
false2 7
;7 8
}: ;
} 
} ”
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\GetOdsAdminAppApiCredentialsQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{		 
public

 

class

 -
!GetOdsAdminAppApiCredentialsQuery

 2
:

3 4.
"IGetOdsAdminAppApiCredentialsQuery

5 W
{ 
private 
readonly +
IOdsSecretConfigurationProvider 8+
_odsSecretConfigurationProvider9 X
;X Y
private 
readonly 
InstanceContext (
_instanceContext) 9
;9 :
public -
!GetOdsAdminAppApiCredentialsQuery 0
(0 1+
IOdsSecretConfigurationProvider1 P*
odsSecretConfigurationProviderQ o
,o p
InstanceContext	q Ä
instanceContext
Å ê
)
ê ë
{ 	+
_odsSecretConfigurationProvider +
=, -*
odsSecretConfigurationProvider. L
;L M
_instanceContext 
= 
instanceContext .
;. /
} 	
public 
async 
Task 
< %
OdsAdminAppApiCredentials 3
>3 4
Execute5 <
(< =
)= >
{ 	
var 
configuration 
= 
await  %+
_odsSecretConfigurationProvider& E
.E F"
GetSecretConfigurationF \
(\ ]
_instanceContext] m
.m n
Idn p
)p q
;q r
return 
configuration  
?  !
.! "(
GetOdsAdminAppApiCredentials" >
(> ?
)? @
;@ A
} 	
} 
} Ê
YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Helpers\AppSettings.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Helpers' .
{ 
public 

class 
AppSettings 
{		 
public

 
string

 

AppStartup

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
string 
DatabaseEngine $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 1
%ApplicationInsightsInstrumentationKey ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
string 
DefaultOdsInstance (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
ProductionApiUrl &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
ApiExternalUrl $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string /
#SecurityMetadataCacheTimeoutMinutes 9
{: ;
get< ?
;? @
setA D
;D E
}F G
public 
string 
ApiStartupType $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string )
LocalEducationAgencyTypeValue 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string -
!PostSecondaryInstitutionTypeValue 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
string 
SchoolTypeValue %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
AwsCurrentVersion '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
Log4NetConfigPath '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
EncryptionKey #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string "
ProductRegistrationUrl ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} Ï
_C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Helpers\ConnectionStrings.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Helpers' .
{ 
public 

class 
ConnectionStrings "
{		 
public

 
string

 
Admin

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Security 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
ProductionOds #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} â
jC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Helpers\HealthCheckServiceExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{		 
public

 

static

 
class

 (
HealthCheckServiceExtensions

 4
{ 
public 
static 
IServiceCollection (
AddHealthCheck) 7
(7 8
this8 <
IServiceCollection= O
servicesP X
,X Y
stringZ `
connectionStringa q
,q r
bools w
isSqlServer	x É
)
É Ñ
{ 	
var 
	hcBuilder 
= 
services $
.$ %
AddHealthChecks% 4
(4 5
)5 6
;6 7
if 
( 
isSqlServer 
) 
{ 
	hcBuilder 
. 
AddSqlServer &
(& '
connectionString' 7
)7 8
;8 9
} 
else 
{ 
	hcBuilder 
. 
	AddNpgSql #
(# $
connectionString$ 4
)4 5
;5 6
} 
return 
services 
; 
} 	
} 
} Ò
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Helpers\IdentitySettings.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Helpers' .
{		 
public

 

class

 
IdentitySettings

 !
{ 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
OpenIdSettings 
OpenIdSettings ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
string 
ControllerName $
{ 	
get 
=> 
Type 
== %
IdentitySettingsConstants 4
.4 5
OpenIdIdentityType5 G
?H I%
IdentitySettingsConstantsJ c
.c d)
OpenIdIdentityControllerName	d Ä
:
Å Ç'
IdentitySettingsConstants
É ú
.
ú ù3
%EntityFrameworkIdentityControllerName
ù ¬
;
¬ √
} 	
} 
public 

class 
OpenIdSettings 
{ 
public 
string 
	Authority 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
ClientId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
ClientSecret "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
UserProfileUri $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string  
AuthenticationScheme *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
LoginProvider #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
ResponseType "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool  
RequireHttpsMetadata (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
bool )
GetClaimsFromUserInfoEndpoint 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
bool 

SaveTokens 
{  
get! $
;$ %
set& )
;) *
}+ ,
public   
List   
<   
string   
>   
Scopes   "
{  # $
get  % (
;  ( )
set  * -
;  - .
}  / 0
public$$ 
ClaimTypeMappings$$  
ClaimTypeMappings$$! 2
{$$3 4
get$$5 8
;$$8 9
set$$: =
;$$= >
}$$? @
}%% 
public'' 

class'' 
ClaimTypeMappings'' "
{(( 
public)) 
string)) 
NameClaimType)) #
{))$ %
get))& )
;))) *
set))+ .
;)). /
}))0 1
public** 
string** 
IdentifierClaimType** )
{*** +
get**, /
;**/ 0
set**1 4
;**4 5
}**6 7
public++ 
string++ 
EmailClaimType++ $
{++% &
get++' *
;++* +
set++, /
;++/ 0
}++1 2
public,, 
string,, 
RoleClaimType,, #
{,,$ %
get,,& )
;,,) *
set,,+ .
;,,. /
},,0 1
}-- 
}.. ¯
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Helpers\IdentitySettingsConstants.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Helpers' .
{ 
public 

class %
IdentitySettingsConstants *
{		 
public

 
const

 
string

 '
EntityFrameworkIdentityType

 7
=

8 9
$str

: K
;

K L
public 
const 
string 
OpenIdIdentityType .
=/ 0
$str1 9
;9 :
public 
const 
string (
OpenIdIdentityControllerName 8
=9 :
$str; J
;J K
public 
const 
string 1
%EntityFrameworkIdentityControllerName A
=B C
$strD N
;N O
} 
} ˝	
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Helpers\OdsInstanceIdentityHelper.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Helpers' .
{		 
public

 

static

 
class

 %
OdsInstanceIdentityHelper

 1
{ 
public 
static 
int 
GetIdentityValue *
(* +
string+ 1
odsInstanceName2 A
)A B
{ 	
var 
index 
= 
odsInstanceName '
.' (
LastIndexOf( 3
(3 4
$str4 7
,7 8
StringComparison9 I
.I J
InvariantCultureJ Z
)Z [
;[ \
var 
identityValue 
= 
odsInstanceName  /
./ 0
	Substring0 9
(9 :
index: ?
+@ A
$numB C
)C D
;D E
return 
int 
. 
Parse 
( 
identityValue *
)* +
;+ ,
} 	
} 
} Á
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ICompleteOdsFirstTimeSetupCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

	interface -
!ICompleteOdsFirstTimeSetupCommand 6
{ 
Action -
!ExtraDatabaseInitializationAction 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
Task 
< 
bool 
> 
Execute 
( 
CloudOdsClaimSet +
claimSet, 4
)4 5
;5 6
} 
} »
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Identity\RegisterCommand.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
Identity

' /
{ 
public 

class 
RegisterCommand  
{ 
public 
async 
Task 
< 
( 
AdminAppUser '
user( ,
,, -
IdentityResult. <
result= C
)C D
>D E
ExecuteF M
(M N
IRegisterModelN \
	userModel] f
,f g
UserManagerh s
<s t
AdminAppUser	t Ä
>
Ä Å
userManager
Ç ç
)
ç é
{ 	
var 
user 
= 
new 
AdminAppUser '
{( )
UserName* 2
=3 4
	userModel5 >
.> ?
Email? D
,D E
EmailF K
=L M
	userModelN W
.W X
EmailX ]
}] ^
;^ _
var 
result 
= 
await 
userManager *
.* +
CreateAsync+ 6
(6 7
user7 ;
,; <
	userModel= F
.F G
PasswordG O
)O P
;P Q
return 
( 
user 
: 
user 
, 
result  &
:& '
result( .
). /
;/ 0
} 	
} 
public 

	interface 
IRegisterModel #
{ 
string 
Email 
{ 
get 
; 
} 
string 
Password 
{ 
get 
; 
}  
} 
} ÜO
\C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\IFirstTimeSetupService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

	interface "
IFirstTimeSetupService +
{ 
Task 
< #
ApplicationCreateResult $
>$ %)
CreateAdminAppInAdminDatabase& C
(C D
stringD J 
claimSetClaimSetNameK _
,_ `
stringa g
odsInstanceNameh w
,w x
stringy  
odsInstanceVersion
Ä í
)
í ì
;
ì î
void *
EnsureAdminDatabaseInitialized +
(+ ,
), -
;- .
} 
public 

class #
ApplicationCreateResult (
{ 
public 
Application 
Application &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
OdsApiCredential "
ProductionKeyAndSecret  6
{7 8
get9 <
;< =
set> A
;A B
}C D
} 
public 

abstract 
class %
FirstTimeSetupServiceBase 3
:4 5"
IFirstTimeSetupService6 L
{ 
	protected   
readonly   
IUsersContext   (
UsersContext  ) 5
;  5 6
private!! 
readonly!! %
ISecurePackedHashProvider!! 2%
_securePackedHashProvider!!3 L
;!!L M
private"" 
readonly"" &
IHashConfigurationProvider"" 3&
_hashConfigurationProvider""4 N
;""N O
	protected$$ %
FirstTimeSetupServiceBase$$ +
($$+ ,
IUsersContext$$, 9
usersContext$$: F
,$$F G%
ISecurePackedHashProvider$$H a$
securePackedHashProvider$$b z
,$$z {'
IHashConfigurationProvider	$$| ñ'
hashConfigurationProvider
$$ó ∞
)
$$∞ ±
{%% 	
UsersContext&& 
=&& 
usersContext&& '
;&&' (%
_securePackedHashProvider'' %
=''& '$
securePackedHashProvider''( @
;''@ A&
_hashConfigurationProvider(( &
=((' (%
hashConfigurationProvider(() B
;((B C
})) 	
public++ 
abstract++ 
void++ *
EnsureAdminDatabaseInitialized++ ;
(++; <
)++< =
;++= >
public-- 
async-- 
Task-- 
<-- #
ApplicationCreateResult-- 1
>--1 2)
CreateAdminAppInAdminDatabase--3 P
(--P Q
string--Q W 
claimSetClaimSetName--X l
,--l m
string.. 
odsInstanceName.. "
,.." #
string..$ *
odsInstanceVersion..+ =
)..= >
{// 	
var00 
applicationName00 
=00  !
odsInstanceName00" 1
.001 2#
GetAdminApplicationName002 I
(00I J
)00J K
;00K L
var22 
existingApplication22 #
=22$ %
await22& +
UsersContext22, 8
.228 9
Applications229 E
.22E F 
SingleOrDefaultAsync22F Z
(22Z [
x22[ \
=>22] _
x33 
.33 
ApplicationName33 !
.33! "
Equals33" (
(33( )
applicationName33) 8
,338 9
StringComparison44 $
.44$ %&
InvariantCultureIgnoreCase44% ?
)44? @
)44@ A
;44A B
if55 
(55 
existingApplication55 #
!=55$ &
null55' +
)55+ ,
{66 
return77 
new77 #
ApplicationCreateResult77 2
{88 
Application99 
=99  !
existingApplication99" 5
}:: 
;:: 
};; 
var== 
result== 
=== 
new== #
ApplicationCreateResult== 4
{>> 
Application?? 
=?? 
new?? !
Application??" -
{@@ 
ApplicationNameAA #
=AA$ %
applicationNameAA& 5
,AA5 6
VendorBB 
=BB 
CreateEdFiVendorBB -
(BB- .
)BB. /
,BB/ 0
ClaimSetNameCC  
=CC! " 
claimSetClaimSetNameCC# 7
,CC7 8
OdsInstanceDD 
=DD  !
GetOdsInstanceDD" 0
(DD0 1
odsInstanceNameDD1 @
)DD@ A
,DDA B!
OperationalContextUriEE )
=EE* +
OperationalContextEE, >
.EE> ?(
DefaultOperationalContextUriEE? [
}FF 
}GG 
;GG 
varII 
apiClientFactoryII  
=II! "
newII# &
ApiClientFactoryII' 7
(II7 8%
_securePackedHashProviderII8 Q
,IIQ R&
_hashConfigurationProviderIIS m
)IIm n
;IIn o
varKK 
apiWithCredentialsKK "
=KK# $
apiClientFactoryKK% 5
.KK5 6&
GetApiClientAndCredentialsKK6 P
(KKP Q
applicationNameKKQ `
)KK` a
;KKa b
resultMM 
.MM 
ApplicationMM 
.MM 

ApiClientsMM )
.MM) *
AddMM* -
(MM- .
apiWithCredentialsMM. @
.MM@ A
	ApiClientMMA J
)MMJ K
;MMK L
resultNN 
.NN "
ProductionKeyAndSecretNN )
=NN* +
apiWithCredentialsNN, >
.NN> ?
ApiCredentialsNN? M
;NNM N,
 AssociateOdsInstanceAndApiClientPP ,
(PP, -
odsInstanceNamePP- <
,PP< =
apiWithCredentialsPP> P
.PPP Q
	ApiClientPPQ Z
)PPZ [
;PP[ \
UsersContextRR 
.RR 
ApplicationsRR %
.RR% &
AddRR& )
(RR) *
resultRR* 0
.RR0 1
ApplicationRR1 <
)RR< =
;RR= >
returnTT 
resultTT 
;TT 
}UU 	
privateWW 
voidWW ,
 AssociateOdsInstanceAndApiClientWW 5
(WW5 6
stringWW6 <
odsInstanceNameWW= L
,WWL M
	ApiClientWWN W
	apiClientWWX a
)WWa b
{XX 	
varYY 
existingInstanceYY  
=YY! "
UsersContextYY# /
.YY/ 0
OdsInstancesYY0 <
.YY< =
SingleOrDefaultYY= L
(YYL M
xYYM N
=>YYO Q
xYYR S
.YYS T
NameYYT X
==YYY [
odsInstanceNameYY\ k
)YYk l
;YYl m
if[[ 
([[ 
existingInstance[[  
!=[[! #
null[[$ (
)[[( )
{\\ 
var]]  
apiClientOdsInstance]] (
=]]) *
new]]+ . 
ApiClientOdsInstance]]/ C
{^^ 
OdsInstance__  
=__! "
existingInstance__# 3
,__3 4
	ApiClient`` 
=``  
	apiClient``! *
}aa 
;aa 
UsersContextbb 
.bb !
ApiClientOdsInstancesbb 2
.bb2 3
Addbb3 6
(bb6 7 
apiClientOdsInstancebb7 K
)bbK L
;bbL M
}cc 
}dd 	
privateff 
OdsInstanceff 
GetOdsInstanceff *
(ff* +
stringff+ 1
odsInstanceNameff2 A
)ffA B
{gg 	
varhh 
existingInstancehh  
=hh! "
UsersContexthh# /
.hh/ 0
OdsInstanceshh0 <
.hh< =
SingleOrDefaulthh= L
(hhL M
xhhM N
=>hhO Q
xhhR S
.hhS T
NamehhT X
==hhY [
odsInstanceNamehh\ k
)hhk l
;hhl m
ifii 
(ii 
existingInstanceii  
!=ii! #
nullii$ (
)ii( )
{jj 
returnkk 
existingInstancekk '
;kk' (
}ll 
elsemm 
{nn 
returnoo 
nulloo 
;oo 
}pp 
}qq 	
privatess 
Vendorss 
CreateEdFiVendorss '
(ss' (
)ss( )
{tt 	
varuu 
existingVendoruu 
=uu  
UsersContextuu! -
.uu- .
Vendorsuu. 5
.uu5 6
SingleOrDefaultuu6 E
(uuE F
xuuF G
=>uuH J
xuuK L
.uuL M

VendorNameuuM W
.uuW X
EqualsuuX ^
(uu^ _
CloudOdsAdminAppuu_ o
.uuo p

VendorNameuup z
,uuz {
StringComparison	uu| å
.
uuå ç(
InvariantCultureIgnoreCase
uuç ß
)
uuß ®
)
uu® ©
;
uu© ™
ifvv 
(vv 
existingVendorvv 
!=vv !
nullvv" &
)vv& '
returnww 
existingVendorww %
;ww% &
varyy 
vendoryy 
=yy 
newyy 
Vendoryy #
{zz #
VendorNamespacePrefixes{{ '
={{( )
new{{* -
List{{. 2
<{{2 3!
VendorNamespacePrefix{{3 H
>{{H I
{{{J K
new{{L O!
VendorNamespacePrefix{{P e
{{{f g
NamespacePrefix{{h w
={{x y
CloudOdsAdminApp	{{z ä
.
{{ä ã#
VendorNamespacePrefix
{{ã †
}
{{° ¢
}
{{£ §
,
{{§ •

VendorName|| 
=|| 
CloudOdsAdminApp|| -
.||- .

VendorName||. 8
}}} 
;}} 
UsersContext 
. 
Vendors  
.  !
Add! $
($ %
vendor% +
)+ ,
;, -
return
ÅÅ 
vendor
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
}
ÉÉ 
}ÑÑ Í
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\IGetCloudOdsApiWebsiteSettingsQuery.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
{

 
public 

	interface /
#IGetCloudOdsApiWebsiteSettingsQuery 8
{ 
Task 
< &
CloudOdsApiWebsiteSettings '
>' (
Execute) 0
(0 1'
CloudOdsApiOperationContext1 L
contextM T
)T U
;U V
} 
} º
_C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\IGetCloudOdsInstanceQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{		 
public

 

	interface

 %
IGetCloudOdsInstanceQuery

 .
{ 
Task 
< 
CloudOdsInstance 
> 
Execute &
(& '
string' -
instanceName. :
): ;
;; <
} 
} ©
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\IGetOdsAdminAppApiCredentialsQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{		 
public

 

	interface

 .
"IGetOdsAdminAppApiCredentialsQuery

 7
{ 
Task 
< %
OdsAdminAppApiCredentials &
>& '
Execute( /
(/ 0
)0 1
;1 2
} 
} í
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\IMarkerForEdFiOdsAdminAppManagement.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

	interface /
#IMarkerForEdFiOdsAdminAppManagement 8
{		 
}

 
} ∞
UC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\InstanceContext.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
InstanceContext  
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Î
dC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Instances\GetOdsInstancesQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
	Instances' 0
{ 
public 

class  
GetOdsInstancesQuery %
:& '!
IGetOdsInstancesQuery( =
{ 
private 
readonly 
IUsersContext &
	_database' 0
;0 1
public  
GetOdsInstancesQuery #
(# $
IUsersContext$ 1
database2 :
): ;
{ 	
	_database 
= 
database  
;  !
} 	
public 
IEnumerable 
< 
OdsInstance &
>& '
Execute( /
(/ 0
)0 1
{ 	
var 
	instances 
= 
	_database %
.% &
OdsInstances& 2
.2 3
OrderBy3 :
(: ;
x; <
=>= ?
x@ A
.A B
NameB F
)F G
;G H
return 
	instances 
; 
} 	
public 
int 
ExecuteCount 
(  
)  !
{ 	
return 
	_database 
. 
OdsInstances )
.) *
Count* /
(/ 0
)0 1
;1 2
}   	
public"" 
OdsInstance"" 
Execute"" "
(""" #
string""# )
odsInstanceName""* 9
)""9 :
{## 	
return$$ 
	_database$$ 
.$$ 
OdsInstances$$ )
.$$) *
SingleOrDefault$$* 9
($$9 :
x$$: ;
=>$$< >
x$$? @
.$$@ A
Name$$A E
==$$F H
odsInstanceName$$I X
)$$X Y
;$$Y Z
}%% 	
public'' 
OdsInstance'' 
Execute'' "
(''" #
int''# &
odsInstanceId''' 4
)''4 5
{(( 	
return)) 
	_database)) 
.)) 
OdsInstances)) )
.))) *
SingleOrDefault))* 9
())9 :
x)): ;
=>))< >
x))? @
.))@ A
OdsInstanceId))A N
==))O Q
odsInstanceId))R _
)))_ `
;))` a
}** 	
}++ 
public-- 

	interface-- !
IGetOdsInstancesQuery-- *
{.. 
IEnumerable// 
<// 
OdsInstance// 
>//  
Execute//! (
(//( )
)//) *
;//* +
int00 
ExecuteCount00 
(00 
)00 
;00 
OdsInstance11 
Execute11 
(11 
string11 "
odsInstanceName11# 2
)112 3
;113 4
OdsInstance22 
Execute22 
(22 
int22 
odsInstanceId22  -
)22- .
;22. /
}33 
}44 û

eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Instances\OdsInstanceExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
	Instances' 0
{ 
public		 

static		 
class		 !
OdsInstanceExtensions		 -
{

 
public 
static 
int (
ExtractNumericInstanceSuffix 6
(6 7
this7 ;
string< B
instanceNameC O
)O P
{ 	
return 
int 
. 
Parse 
( 
instanceName )
.) *
Split* /
(/ 0
$char0 3
)3 4
.4 5
Last5 9
(9 :
): ;
); <
;< =
} 	
public 
static 
string #
GetAdminApplicationName 4
(4 5
this5 9
string: @
instanceNameA M
)M N
{ 	
return 
$" 
{ 
instanceName "
}" #
$str# 4
"4 5
;5 6
} 	
} 
} ò
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\IOdsSecretConfigurationProvider.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{		 
public

 

	interface

 +
IOdsSecretConfigurationProvider

 4
{ 
Task 
< "
OdsSecretConfiguration #
># $"
GetSecretConfiguration% ;
(; <
int< ?
?? @
odsInstanceIdA N
=O P
nullQ U
)U V
;V W
Task "
SetSecretConfiguration #
(# $"
OdsSecretConfiguration$ :
configuration; H
,H I
intJ M
?M N
odsInstanceIdO \
=] ^
null_ c
)c d
;d e
} 
} ˚
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\IUpdateCloudOdsApiWebsiteSettingsCommand.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
{

 
public 

	interface 4
(IUpdateCloudOdsApiWebsiteSettingsCommand =
{ 
Task 
Execute 
( '
CloudOdsApiOperationContext 0
context1 8
,8 9&
CloudOdsApiWebsiteSettings: T
settingsU ]
)] ^
;^ _
} 
} •
\C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\ModifyClaimSetsService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

	interface #
IModifyClaimSetsService ,
{ 
void C
7SetNoFurtherAuthorizationRequiredOverrideOnResouceClaim D
(D E
stringE K
resoureNameL W
,W X
stringY _

actionType` j
)j k
;k l
} 
public 

class "
ModifyClaimSetsService '
:( )#
IModifyClaimSetsService* A
{ 
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
public "
ModifyClaimSetsService %
(% &
ISecurityContext& 6
securityContext7 F
)F G
{ 	
_securityContext 
= 
securityContext .
;. /
} 	
public 
void C
7SetNoFurtherAuthorizationRequiredOverrideOnResouceClaim K
(K L
stringL R
resourceNameS _
,_ `
stringa g

actionTypeh r
)r s
{ 	
var 
claimAuthMetadata !
=" #
_securityContext$ 4
.4 5/
#ResourceClaimAuthorizationMetadatas5 X
. 
Include 
( 
x 
=> 
x 
.  
Action  &
)& '
. 
Include 
( 
x 
=> 
x 
.  
ResourceClaim  -
)- .
.   
Include   
(   
x   
=>   
x   
.    !
AuthorizationStrategy    5
)  5 6
.!! 
SingleOrDefault!!  
(!!  !
x!!! "
=>!!# %
x"" 
."" 
Action"" 
."" 

ActionName"" '
==""( *

actionType""+ 5
&&""6 8
x""9 :
."": ;
ResourceClaim""; H
.""H I
ResourceName""I U
==""V X
resourceName""Y e
)""e f
;""f g
if$$ 
($$ 
claimAuthMetadata$$ !
==$$" $
null$$% )
)$$) *
return$$+ 1
;$$1 2
var&& 
authStrategy&& 
=&& 
_securityContext&& /
.&&/ 0#
AuthorizationStrategies&&0 G
.&&G H
FirstOrDefault&&H V
(&&V W
x&&W X
=>&&Y [
x'' 
.'' %
AuthorizationStrategyName'' +
=='', ..
"CloudOdsClaimAuthorizationStrategy''/ Q
.''Q R*
NoFurtherAuthorizationRequired''R p
.''p q
StrategyName''q }
)''} ~
;''~ 
if)) 
()) 
authStrategy)) 
==)) 
null))  $
)))$ %
return))& ,
;)), -
claimAuthMetadata++ 
.++ !
AuthorizationStrategy++ 3
=++4 5
authStrategy++6 B
;++B C
},, 	
}-- 
}.. ˘

WC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsApiCredentials.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
OdsApiCredential !
{		 
public

 
OdsApiCredential

 
(

  
)

  !
{ 	
} 	
public 
OdsApiCredential 
(  
string  &
key' *
,* +
string, 2
secret3 9
)9 :
{ 	
Key 
= 
key 
; 
Secret 
= 
secret 
; 
} 	
public 
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Secret 
{ 
get "
;" #
set$ '
;' (
}) *
} 
public 

class %
OdsAdminAppApiCredentials *
{ 
public 
OdsApiCredential #
ProductionApiCredential  7
{8 9
get: =
;= >
set? B
;B C
}D E
} 
} …
RC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsComponent.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
OdsComponent 
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Environment !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Version 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} Ú
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsInstanceServices\InferInstanceService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
OdsInstanceServices' :
{		 
public

 

	interface

 !
IInferInstanceService

 *
{ 
string 
DatabaseName 
( 
) 
; 
} 
public 

class  
InferInstanceService %
:& '!
IInferInstanceService( =
{ 
private 
readonly '
IDatabaseConnectionProvider 4
_connectionProvider5 H
;H I
public  
InferInstanceService #
(# $'
IDatabaseConnectionProvider$ ?
connectionProvider@ R
)R S
{ 	
_connectionProvider 
=  !
connectionProvider" 4
;4 5
} 	
public 
string 
DatabaseName "
(" #
)# $
{ 	
using 
var 

connection  
=! "
_connectionProvider# 6
.6 7
CreateNewConnection7 J
(J K
)K L
;L M
return 

connection 
. 
Database &
;& '
} 	
}   
}!! °
{C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsInstanceServices\IOdsInstanceFirstTimeSetupService.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
OdsInstanceServices

' :
{ 
public 

	interface -
!IOdsInstanceFirstTimeSetupService 6
{ 
Task 
CompleteSetup 
( 
OdsInstance &
odsInstance' 2
,2 3
CloudOdsClaimSet4 D
claimSetE M
)M N
;N O
} 
} È!
zC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsInstanceServices\OdsInstanceFirstTimeSetupService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
OdsInstanceServices' :
{ 
public 

class ,
 OdsInstanceFirstTimeSetupService 1
:2 3-
!IOdsInstanceFirstTimeSetupService4 U
{ 
private 
readonly +
IOdsSecretConfigurationProvider 8+
_odsSecretConfigurationProvider9 X
;X Y
private 
readonly "
IFirstTimeSetupService /"
_firstTimeSetupService0 F
;F G
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public ,
 OdsInstanceFirstTimeSetupService /
(/ 0+
IOdsSecretConfigurationProvider0 O*
odsSecretConfigurationProviderP n
,n o"
IFirstTimeSetupService "!
firstTimeSetupService# 8
,8 9
IUsersContext 
usersContext &
,& '
IOptions 
< 
AppSettings  
>  !
appSettings" -
)- .
{ 	+
_odsSecretConfigurationProvider +
=, -*
odsSecretConfigurationProvider. L
;L M"
_firstTimeSetupService "
=# $!
firstTimeSetupService% :
;: ;
_usersContext 
= 
usersContext (
;( )
_appSettings 
= 
appSettings &
.& '
Value' ,
;, -
} 	
public!! 
async!! 
Task!! 
CompleteSetup!! '
(!!' (
OdsInstance!!( 3
odsInstance!!4 ?
,!!? @
CloudOdsClaimSet!!A Q
claimSet!!R Z
)!!Z [
{"" 	
await## (
CreateAndSaveApiKeyAndSecret## .
(##. /
odsInstance##/ :
,##: ;
claimSet##< D
)##D E
;##E F"
_firstTimeSetupService$$ "
.$$" #*
EnsureAdminDatabaseInitialized$$# A
($$A B
)$$B C
;$$C D
await%% 
_usersContext%% 
.%%  
SaveChangesAsync%%  0
(%%0 1
)%%1 2
;%%2 3
}&& 	
private(( 
async(( 
Task(( (
CreateAndSaveApiKeyAndSecret(( 7
(((7 8
OdsInstance((8 C
odsInstance((D O
,((O P
CloudOdsClaimSet((Q a
claimSet((b j
)((j k
{)) 	
var** 
secretConfiguration** #
=**$ %
new**& )"
OdsSecretConfiguration*** @
(**@ A
)**A B
;**B C
var,, #
applicationCreateResult,, '
=,,( )
await,,* /"
_firstTimeSetupService,,0 F
.,,F G)
CreateAdminAppInAdminDatabase,,G d
(,,d e
claimSet,,e m
.,,m n
ClaimSetName,,n z
,,,z {
odsInstance	,,| á
.
,,á à
Name
,,à å
,
,,å ç
_appSettings--  
.--  !
AwsCurrentVersion--! 2
)--2 3
;--3 4
if// 
(// 
await// +
_odsSecretConfigurationProvider// 5
.//5 6"
GetSecretConfiguration//6 L
(//L M
odsInstance//M X
.//X Y
OdsInstanceId//Y f
)//f g
==//h j
null//k o
)//o p
{00 
secretConfiguration11 #
.11# $%
ProductionApiKeyAndSecret11$ =
=11> ?#
applicationCreateResult11@ W
.11W X"
ProductionKeyAndSecret11X n
;11n o
await33 +
_odsSecretConfigurationProvider33 5
.335 6"
SetSecretConfiguration336 L
(33L M
secretConfiguration33M `
,33` a
odsInstance33b m
.33m n
OdsInstanceId33n {
)33{ |
;33| }
}44 
}55 	
}66 
}77 ı
\C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsSecretConfiguration.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class "
OdsSecretConfiguration '
{		 
public

 
OdsApiCredential

 %
ProductionApiKeyAndSecret

  9
{

: ;
get

< ?
;

? @
set

A D
;

D E
}

F G
public %
OdsAdminAppApiCredentials ((
GetOdsAdminAppApiCredentials) E
(E F
)F G
=>H J
newK N
(N O
)O P
{ 	#
ProductionApiCredential #
=$ %%
ProductionApiKeyAndSecret& ?
} 	
;	 

} 
} ∏D
dC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsSecretConfigurationProvider.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class *
OdsSecretConfigurationProvider /
:0 1+
IOdsSecretConfigurationProvider2 Q
{ 
private 
readonly #
IStringEncryptorService 0#
_stringEncryptorService1 H
;H I
private 
readonly 
AdminAppDbContext *
	_database+ 4
;4 5
private 
readonly 
ObjectCache $
_cache% +
=, -
MemoryCache. 9
.9 :
Default: A
;A B
private 
const 
string 
OdsSecretCacheKey .
=/ 0
$str1 I
;I J
public *
OdsSecretConfigurationProvider -
(- .#
IStringEncryptorService. E"
stringEncryptorServiceF \
,\ ]
AdminAppDbContext^ o
databasep x
)x y
{ 	#
_stringEncryptorService #
=$ %"
stringEncryptorService& <
;< =
	_database 
= 
database  
;  !
} 	
public 
async 
Task 
< "
OdsSecretConfiguration 0
>0 1"
GetSecretConfiguration2 H
(H I
intI L
?L M"
instanceRegistrationIdN d
=e f
nullg k
)k l
{ 	
var   
cacheKey   
=   "
instanceRegistrationId   1
!=  2 4
null  5 9
?  : ;
$"  < >
{  > ?
OdsSecretCacheKey  ? P
}  P Q
$str  Q R
{  R S"
instanceRegistrationId  S i
}  i j
"  j k
:  l m
OdsSecretCacheKey  n 
;	   Ä
if"" 
("" 
_cache"" 
."" 
Get"" 
("" 
cacheKey"" #
)""# $
is""% '"
OdsSecretConfiguration""( >
result""? E
)""E F
return## 
result## 
;## 
result%% 
=%% 
await%% $
ReadSecretConfigurations%% 3
(%%3 4"
instanceRegistrationId%%4 J
)%%J K
;%%K L
if'' 
('' 
result'' 
!='' 
null'' 
)'' 
CacheConfiguration(( "
(((" #
result((# )
,(() *
cacheKey((+ 3
)((3 4
;((4 5
return** 
result** 
;** 
}++ 	
public-- 
async-- 
Task-- "
SetSecretConfiguration-- 0
(--0 1"
OdsSecretConfiguration--1 G
configuration--H U
,--U V
int--W Z
?--Z ["
instanceRegistrationId--\ r
=--s t
null--u y
)--y z
{.. 	
var// 
cacheKey// 
=// "
instanceRegistrationId// 1
!=//2 4
null//5 9
?//: ;
$"//< >
{//> ?
OdsSecretCacheKey//? P
}//P Q
$str//Q R
{//R S"
instanceRegistrationId//S i
}//i j
"//j k
://l m
OdsSecretCacheKey//n 
;	// Ä
await11 $
WriteSecretConfiguration11 *
(11* +
configuration11+ 8
,118 9"
instanceRegistrationId11: P
)11P Q
;11Q R
CacheConfiguration22 
(22 
configuration22 ,
,22, -
cacheKey22. 6
)226 7
;227 8
}33 	
private55 
void55 
CacheConfiguration55 '
<55' (
T55( )
>55) *
(55* +
T55+ ,
result55- 3
,553 4
string555 ;
cacheKey55< D
)55D E
{66 	
_cache77 
.77 
Set77 
(77 
cacheKey77 
,77  
result77! '
,77' (
DateTimeOffset77) 7
.777 8
Now778 ;
.77; <

AddMinutes77< F
(77F G
$num77G H
)77H I
)77I J
;77J K
}88 	
private:: 
async:: 
Task:: 
<:: "
OdsSecretConfiguration:: 1
>::1 2$
ReadSecretConfigurations::3 K
(::K L
int::L O
?::O P

instanceId::Q [
)::[ \
{;; 	
var<< 
secretConfiguration<< #
=<<$ %
await<<& +
	_database<<, 5
.<<5 6 
SecretConfigurations<<6 J
.<<J K 
SingleOrDefaultAsync<<K _
(<<_ `
x== 
=>== 
x== 
.== 
OdsInstanceId== $
====% '

instanceId==( 2
)==2 3
;==3 4
var>> 
rawValue>> 
=>> 
secretConfiguration>> .
?>>. /
.>>/ 0
EncryptedData>>0 =
;>>= >
if@@ 
(@@ 
rawValue@@ 
==@@ 
null@@  
)@@  !
{AA 
returnBB 
nullBB 
;BB 
}CC 
returnEE 
JsonConvertEE 
.EE 
DeserializeObjectEE 0
<EE0 1"
OdsSecretConfigurationEE1 G
>EEG H
(EEH I
!EEI J
secretConfigurationEEJ ]
.EE] ^
IsEncryptedEE^ i
?EEj k
rawValueEEl t
:EEu v#
_stringEncryptorServiceFF '
.FF' (

TryDecryptFF( 2
(FF2 3
rawValueFF3 ;
,FF; <
outFF= @
varFFA D
unencryptedValueFFE U
)FFU V
?GG 
unencryptedValueGG &
:HH 
rawValueHH 
,HH !
GetSerializerSettingsHH  5
(HH5 6
)HH6 7
)HH7 8
;HH8 9
}II 	
privateKK 
asyncKK 
TaskKK $
WriteSecretConfigurationKK 3
(KK3 4"
OdsSecretConfigurationKK4 J
configurationKKK X
,KKX Y
intKKZ ]
?KK] ^

instanceIdKK_ i
)KKi j
{LL 	
varMM 
stringValueMM 
=MM 
JsonConvertMM )
.MM) *
SerializeObjectMM* 9
(MM9 :
configurationMM: G
,MMG H!
GetSerializerSettingsMMI ^
(MM^ _
)MM_ `
)MM` a
;MMa b
varNN 
encryptedValueNN 
=NN  #
_stringEncryptorServiceNN! 8
.NN8 9
EncryptNN9 @
(NN@ A
stringValueNNA L
)NNL M
;NNM N
varPP 
secretConfigurationPP #
=PP$ %
awaitQQ 
	_databaseQQ 
.QQ   
SecretConfigurationsQQ  4
.QQ4 5 
SingleOrDefaultAsyncQQ5 I
(QQI J
xQQJ K
=>QQL N
xRR 
.RR 
OdsInstanceIdRR #
==RR$ &

instanceIdRR' 1
)RR1 2
;RR2 3
ifSS 
(SS 
secretConfigurationSS #
==SS$ &
nullSS' +
)SS+ ,
	_databaseTT 
.TT  
SecretConfigurationsTT .
.TT. /
AddTT/ 2
(TT2 3
newTT3 6
SecretConfigurationTT7 J
{UU 
EncryptedDataUU "
=UU# $
encryptedValueUU% 3
,UU3 4
OdsInstanceIdUU5 B
=UUC D

instanceIdUUE O
,UUO P
IsEncryptedUUQ \
=UU] ^
trueUU_ c
}UUc d
)UUd e
;UUe f
elseVV 
{WW 
secretConfigurationXX #
.XX# $
EncryptedDataXX$ 1
=XX2 3
encryptedValueXX4 B
;XXB C
secretConfigurationYY #
.YY# $
IsEncryptedYY$ /
=YY0 1
trueYY2 6
;YY6 7
}ZZ 
await\\ 
	_database\\ 
.\\ 
SaveChangesAsync\\ ,
(\\, -
)\\- .
;\\. /
}]] 	
private__ "
JsonSerializerSettings__ &!
GetSerializerSettings__' <
(__< =
)__= >
{`` 	
returnaa 
newaa "
JsonSerializerSettingsaa -
{bb 
DateFormatHandlingcc "
=cc# $
DateFormatHandlingcc% 7
.cc7 8
MicrosoftDateFormatcc8 K
}dd 
;dd 
}ee 	
}ff 
}gg ›'
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsSecurityVersionResolver.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
;

& '
public 
	interface ,
 IOdsSecurityModelVersionResolver 1
{ -
!EdFiOdsSecurityModelCompatibility %"
DetermineSecurityModel& <
(< =
)= >
;> ?
} 
public 
class &
OdsSecurityVersionResolver '
:( ),
 IOdsSecurityModelVersionResolver* J
{ 
private 
readonly 
ILog 
_log 
; 
private 
Lazy 
< -
!EdFiOdsSecurityModelCompatibility 2
>2 3
_modelVersion4 A
;A B
private 
readonly 
IOdsApiValidator %
_apiValidator& 3
;3 4
private 
readonly 
string 
_apiServerUrl )
;) *
public 
&
OdsSecurityVersionResolver %
(% &
IOdsApiValidator& 6
apiValidator7 C
,C D
stringE K
apiServerUrlL X
)X Y
{ 
_apiValidator 
= 
apiValidator $
;$ %
_apiServerUrl 
= 
apiServerUrl $
;$ %
_log 
= 

LogManager 
. 
	GetLogger #
(# $
typeof$ *
(* +&
OdsSecurityVersionResolver+ E
)E F
)F G
;G H
_modelVersion 
= 
new 
Lazy  
<  !-
!EdFiOdsSecurityModelCompatibility! B
>B C
(C D"
InitializeModelVersionD Z
)Z [
;[ \
} 
public!! 
-
!EdFiOdsSecurityModelCompatibility!! ,"
DetermineSecurityModel!!- C
(!!C D
)!!D E
=>!!F H
_modelVersion!!I V
.!!V W
Value!!W \
;!!\ ]
private## -
!EdFiOdsSecurityModelCompatibility## -"
InitializeModelVersion##. D
(##D E
)##E F
{$$ 
var%% 
validationResult%% 
=%% 
_apiValidator%% ,
.%%, -
Validate%%- 5
(%%5 6
_apiServerUrl%%6 C
)%%C D
.%%D E

GetAwaiter%%E O
(%%O P
)%%P Q
.%%Q R
	GetResult%%R [
(%%[ \
)%%\ ]
;%%] ^
if'' 

('' 
!'' 
validationResult'' 
.'' 
IsValidOdsApi'' +
||'', .
validationResult''/ ?
.''? @
Version''@ G
==''H J
null''K O
)''O P
{(( 	
_log)) 
.)) 
Error)) 
()) 
$str)) Q
)))Q R
;))R S
throw** 
validationResult** "
.**" #
	Exception**# ,
??**- /
new**0 3
	Exception**4 =
(**= >
$str**> `
)**` a
;**a b
}++ 	
var-- 
serverVersion-- 
=-- 
validationResult-- ,
.--, -
Version--- 4
;--4 5
return// 
serverVersion// 
.// 
Major// "
<//# $
$num//% &
?00 -
!EdFiOdsSecurityModelCompatibility00 /
.00/ 0
ThreeThroughFive000 @
:11 -
!EdFiOdsSecurityModelCompatibility11 /
.11/ 0
Six110 3
;113 4
}22 
}33 
public55 
class55 6
*EdFiOdsSecurityModelCompatibilityException55 7
:558 9#
NotImplementedException55: Q
{66 
public77 
6
*EdFiOdsSecurityModelCompatibilityException77 5
(775 6
)776 7
:88 	
base88
 
(88 
$str88 <
)88< =
{88> ?
}88@ A
public99 
6
*EdFiOdsSecurityModelCompatibilityException99 5
(995 6-
!EdFiOdsSecurityModelCompatibility996 W
version99X _
)99_ `
::: 	
base::
 
(:: 
$":: 
$str:: 9
{::9 :
version::: A
}::A B
$str::B R
"::R S
)::S T
{::U V
}::W X
public;; 
6
*EdFiOdsSecurityModelCompatibilityException;; 5
(;;5 6
string;;6 <
message;;= D
);;D E
:;;F G
base;;H L
(;;L M
message;;M T
);;T U
{;;V W
};;X Y
}<< 
public>> 
enum>> -
!EdFiOdsSecurityModelCompatibility>> -
{?? 
ThreeThroughFive@@ 
=@@ 
$num@@ 
,@@ 
SixAA 
=AA 	
$numAA
 
,AA 
}BB §
YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsSqlConfiguration.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
OdsSqlConfiguration $
{		 
public

 
string

 
HostName

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public !
OdsSqlAdminCredential $
AdminCredentials% 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
OdsSqlCredential 
AdminAppCredentials  3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
OdsSqlCredential $
ProductionApiCredentials  8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
} ¿
VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OdsSqlCredential.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
OdsSqlCredential !
{		 
public

 
string

 
UserName

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
public 

class !
OdsSqlAdminCredential &
{ 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Å
XC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\OperationalContext.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
{ 
public 

class 
OperationalContext #
{		 
public

 
const

 
string

 (
DefaultOperationalContextUri

 8
=

9 :
$str

; U
;

U V
} 
} Ωè
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Services\AESEncryptorService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Services' /
{ 
public 

class 
AESEncryptorService $
:% &#
IStringEncryptorService' >
{ 
private 
const 
int "
ExpectedKeyArrayLength 0
=1 2
$num3 5
;5 6
private 
const 
int !
ExpectedIvArrayLength /
=0 1
$num2 4
;4 5
private 
const 
string 

InvalidKey '
=( )
$str ]
;] ^
private 
const 
string 
	InvalidIV &
=' (
$str o
;o p
private 
readonly 
byte 
[ 
] !
_initializationVector  5
;5 6
private 
readonly 
byte 
[ 
] 
_key  $
;$ %
public 
AESEncryptorService "
(" #
string# )
key* -
,- .
string/ 5 
initializationVector6 J
=K L
nullM Q
)Q R
{ 	
_key 
= 
ValidateKey 
( 
key "
)" #
;# $!
_initializationVector !
=" #

ValidateIV$ .
(. / 
initializationVector/ C
)C D
;D E
static 
byte 
[ 
] 
ValidateKey %
(% &
string& ,
key1- 1
)1 2
{ 
if   
(   
key1   
==   
null    
)    !
{!! 
throw"" 
new"" !
ArgumentNullException"" 3
(""3 4
$"## 
$str## $
{##$ %
nameof##% +
(##+ ,
key1##, 0
)##0 1
}##1 2
$str##2 B
"##B C
,##C D
nameof##E K
(##K L
key1##L P
)##P Q
)##Q R
;##R S
}$$ 
if&& 
(&& 
key1&& 
.&& 
Trim&& 
(&& 
)&& 
.&&  
Length&&  &
==&&' )
$num&&* +
)&&+ ,
{'' 
throw(( 
new(( 
ArgumentException(( /
(((/ 0
$")) 
$str)) $
{))$ %
nameof))% +
())+ ,
key1)), 0
)))0 1
}))1 2
$str))2 M
"))M N
,))N O
nameof))P V
())V W
key1))W [
)))[ \
)))\ ]
;))] ^
}** 
try,, 
{-- 
var.. 
k.. 
=.. 
Convert.. #
...# $
FromBase64String..$ 4
(..4 5
key1..5 9
)..9 :
;..: ;
if00 
(00 
k00 
.00 
Length00  
!=00! #"
ExpectedKeyArrayLength00$ :
)00: ;
{11 
throw22 
new22 !
ArgumentException22" 3
(223 4

InvalidKey224 >
)22> ?
;22? @
}33 
return55 
k55 
;55 
}66 
catch77 
(77 
FormatException77 &
)77& '
{88 
throw99 
new99 
ArgumentException99 /
(99/ 0

InvalidKey990 :
)99: ;
;99; <
}:: 
};; 
static== 
byte== 
[== 
]== 

ValidateIV== $
(==$ %
string==% +
s==, -
)==- .
{>> 
if@@ 
(@@ 
s@@ 
==@@ 
null@@ 
)@@ 
{AA 
returnBB 
nullBB 
;BB  
}CC 
ifEE 
(EE 
sEE 
.EE 
TrimEE 
(EE 
)EE 
.EE 
LengthEE #
==EE$ &
$numEE' (
)EE( )
{FF 
throwGG 
newGG 
ArgumentExceptionGG /
(GG/ 0
$"HH 
$strHH $
{HH$ %
nameofHH% +
(HH+ ,
sHH, -
)HH- .
}HH. /
$strHH/ J
"HHJ K
,HHK L
nameofII 
(II 
sII  
)II  !
)II! "
;II" #
}JJ 
tryLL 
{MM 
varNN 
ivNN 
=NN 
ConvertNN $
.NN$ %
FromBase64StringNN% 5
(NN5 6
sNN6 7
)NN7 8
;NN8 9
ifPP 
(PP 
ivPP 
.PP 
LengthPP !
!=PP" $!
ExpectedIvArrayLengthPP% :
)PP: ;
{QQ 
throwRR 
newRR !
ArgumentExceptionRR" 3
(RR3 4
	InvalidIVRR4 =
)RR= >
;RR> ?
}SS 
returnUU 
ivUU 
;UU 
}VV 
catchWW 
(WW 
FormatExceptionWW &
)WW& '
{XX 
throwYY 
newYY 
ArgumentExceptionYY /
(YY/ 0
	InvalidIVYY0 9
)YY9 :
;YY: ;
}ZZ 
}[[ 
}\\ 	
public^^ 
string^^ 
Encrypt^^ 
(^^ 
string^^ $
value^^% *
)^^* +
{__ 	
if`` 
(`` 
value`` 
==`` 
null`` 
)`` 
{aa 
throwbb 
newbb !
ArgumentNullExceptionbb /
(bb/ 0
$"bb0 2
$strbb2 <
{bb< =
nameofbb= C
(bbC D
valuebbD I
)bbI J
}bbJ K
$strbbK [
"bb[ \
,bb\ ]
nameofbb^ d
(bbd e
valuebbe j
)bbj k
)bbk l
;bbl m
}cc 
usinggg 
vargg 
	encryptorgg 
=gg  !
Aesgg" %
.gg% &
Creategg& ,
(gg, -
)gg- .
;gg. /
ifii 
(ii 
	encryptorii 
==ii 
nullii !
)ii! "
{jj 
throwkk 
newkk %
InvalidOperationExceptionkk 3
(kk3 4
$strkk4 b
)kkb c
;kkc d
}ll 
varnn 
ivnn 
=nn 
Convertnn 
.nn 
ToBase64Stringnn +
(nn+ ,
SetupKeyAndIVnn, 9
(nn9 :
	encryptornn: C
)nnC D
)nnD E
;nnE F
varoo 
	encryptedoo 
=oo 
EncryptValueoo (
(oo( )
	encryptoroo) 2
)oo2 3
;oo3 4
varqq 
ivPlusEncryptedqq 
=qq  !
$"qq" $
{qq$ %
ivqq% '
}qq' (
$strqq( )
{qq) *
	encryptedqq* 3
}qq3 4
"qq4 5
;qq5 6
varrr 
	signaturerr 
=rr 
CalculateSignaturerr .
(rr. /
ivPlusEncryptedrr/ >
)rr> ?
;rr? @
returntt 
$"tt 
{tt 
ivPlusEncryptedtt %
}tt% &
$strtt& '
{tt' (
	signaturett( 1
}tt1 2
"tt2 3
;tt3 4
bytevv 
[vv 
]vv 
SetupKeyAndIVvv  
(vv  !
Aesvv! $
aesvv% (
)vv( )
{ww 
aesxx 
.xx 
Keyxx 
=xx 
_keyxx 
;xx 
varyy 
vectoryy 
=yy !
_initializationVectoryy 2
;yy2 3
if{{ 
({{ 
vector{{ 
!={{ 
null{{ "
){{" #
{|| 
aes}} 
.}} 
IV}} 
=}} 
vector}} #
;}}# $
}~~ 
else 
{
ÄÄ 
aes
ÅÅ 
.
ÅÅ 

GenerateIV
ÅÅ "
(
ÅÅ" #
)
ÅÅ# $
;
ÅÅ$ %
vector
ÇÇ 
=
ÇÇ 
aes
ÇÇ  
.
ÇÇ  !
IV
ÇÇ! #
;
ÇÇ# $
}
ÉÉ 
return
ÖÖ 
vector
ÖÖ 
;
ÖÖ 
}
ÜÜ 
string
àà 
EncryptValue
àà 
(
àà  
Aes
àà  #
aes
àà$ '
)
àà' (
{
ââ 
using
ää 
var
ää 
	memStream
ää #
=
ää$ %
new
ää& )
MemoryStream
ää* 6
(
ää6 7
)
ää7 8
;
ää8 9
using
åå 
(
åå 
var
åå 
cryptoStream
åå '
=
åå( )
new
åå* -
CryptoStream
åå. :
(
åå: ;
	memStream
çç 
,
çç 
aes
çç "
.
çç" #
CreateEncryptor
çç# 2
(
çç2 3
)
çç3 4
,
çç4 5
CryptoStreamMode
çç6 F
.
ççF G
Write
ççG L
)
ççL M
)
ççM N
{
éé 
var
èè 
b
èè 
=
èè 
Encoding
èè $
.
èè$ %
Unicode
èè% ,
.
èè, -
GetBytes
èè- 5
(
èè5 6
value
èè6 ;
)
èè; <
;
èè< =
cryptoStream
êê  
.
êê  !
Write
êê! &
(
êê& '
b
êê' (
)
êê( )
;
êê) *
}
ëë 
return
ìì 
Convert
ìì 
.
ìì 
ToBase64String
ìì -
(
ìì- .
	memStream
ìì. 7
.
ìì7 8
ToArray
ìì8 ?
(
ìì? @
)
ìì@ A
)
ììA B
;
ììB C
}
îî 
}
ïï 	
public
óó 
bool
óó 

TryDecrypt
óó 
(
óó 
string
óó %
value
óó& +
,
óó+ ,
out
óó- 0
string
óó1 7
decryptedValue
óó8 F
)
óóF G
{
òò 	
if
ôô 
(
ôô 
value
ôô 
==
ôô 
null
ôô 
)
ôô 
{
öö 
throw
õõ 
new
õõ #
ArgumentNullException
õõ /
(
õõ/ 0
$"
õõ0 2
$str
õõ2 <
{
õõ< =
nameof
õõ= C
(
õõC D
value
õõD I
)
õõI J
}
õõJ K
$str
õõK [
"
õõ[ \
,
õõ\ ]
nameof
õõ^ d
(
õõd e
value
õõe j
)
õõj k
)
õõk l
;
õõl m
}
úú 
if
ûû 
(
ûû 
value
ûû 
.
ûû 
Trim
ûû 
(
ûû 
)
ûû 
.
ûû 
Length
ûû #
==
ûû$ &
$num
ûû' (
)
ûû( )
{
üü 
throw
†† 
new
†† 
ArgumentException
†† +
(
††+ ,
$"
°° 
$str
°°  
{
°°  !
nameof
°°! '
(
°°' (
value
°°( -
)
°°- .
}
°°. /
$str
°°/ J
"
°°J K
,
°°K L
nameof
°°M S
(
°°S T
value
°°T Y
)
°°Y Z
)
°°Z [
;
°°[ \
}
¢¢ 
var
§§ 

components
§§ 
=
§§ 
ExtractComponents
§§ .
(
§§. /
value
§§/ 4
)
§§4 5
;
§§5 6
if
¶¶ 
(
¶¶ #
SignatureDoesNotMatch
¶¶ %
(
¶¶% &

components
¶¶& 0
)
¶¶0 1
)
¶¶1 2
{
ßß 
decryptedValue
®® 
=
®®  
string
®®! '
.
®®' (
Empty
®®( -
;
®®- .
return
©© 
false
©© 
;
©© 
}
™™ 
try
¨¨ 
{
≠≠ 
decryptedValue
ÆÆ 
=
ÆÆ  
Decrypt
ÆÆ! (
(
ÆÆ( )

components
ÆÆ) 3
)
ÆÆ3 4
;
ÆÆ4 5
return
ØØ 
true
ØØ 
;
ØØ 
}
∞∞ 
catch
±± 
(
±± $
CryptographicException
±± )
)
±±) *
{
≤≤ 
decryptedValue
µµ 
=
µµ  
string
µµ! '
.
µµ' (
Empty
µµ( -
;
µµ- .
return
∂∂ 
false
∂∂ 
;
∂∂ 
}
∑∑ 
static
ππ 
(
ππ 
string
ππ 
iv
ππ 
,
ππ 
string
ππ %
	encrypted
ππ& /
,
ππ/ 0
string
ππ1 7
	signature
ππ8 A
)
ππA B
ExtractComponents
ππC T
(
ππT U
string
ππU [

localValue
ππ\ f
)
ππf g
{
∫∫ 
var
ªª 
split
ªª 
=
ªª 

localValue
ªª &
.
ªª& '
Split
ªª' ,
(
ªª, -
$char
ªª- 0
)
ªª0 1
;
ªª1 2
if
ΩΩ 
(
ΩΩ 
split
ΩΩ 
.
ΩΩ 
Length
ΩΩ  
!=
ΩΩ! #
$num
ΩΩ$ %
)
ΩΩ% &
{
ææ 
throw
øø 
new
øø '
InvalidOperationException
øø 7
(
øø7 8
$str
¿¿ Y
)
¿¿Y Z
;
¿¿Z [
}
¡¡ 
return
√√ 
(
√√ 
split
√√ 
[
√√ 
$num
√√ 
]
√√  
,
√√  !
split
√√" '
[
√√' (
$num
√√( )
]
√√) *
,
√√* +
split
√√, 1
[
√√1 2
$num
√√2 3
]
√√3 4
)
√√4 5
;
√√5 6
}
ƒƒ 
bool
∆∆ #
SignatureDoesNotMatch
∆∆ &
(
∆∆& '
(
∆∆' (
string
∆∆( .
iv
∆∆/ 1
,
∆∆1 2
string
∆∆3 9
	encrypted
∆∆: C
,
∆∆C D
string
∆∆E K
	signature
∆∆L U
)
∆∆U V
	localComp
∆∆W `
)
∆∆` a
{
«« 
return
»»  
CalculateSignature
»» )
(
»») *
$"
»»* ,
{
»», -
	localComp
»»- 6
.
»»6 7
iv
»»7 9
}
»»9 :
$str
»»: ;
{
»»; <
	localComp
»»< E
.
»»E F
	encrypted
»»F O
}
»»O P
"
»»P Q
)
»»Q R
!=
»»S U
	localComp
»»V _
.
»»_ `
	signature
»»` i
;
»»i j
}
…… 
string
ÀÀ 
Decrypt
ÀÀ 
(
ÀÀ 
(
ÀÀ 
string
ÀÀ "
iv
ÀÀ# %
,
ÀÀ% &
string
ÀÀ' -
	encrypted
ÀÀ. 7
,
ÀÀ7 8
string
ÀÀ9 ?
_
ÀÀ@ A
)
ÀÀA B
	localComp
ÀÀC L
)
ÀÀL M
{
ÃÃ 
using
ÕÕ 
var
ÕÕ 
aes
ÕÕ 
=
ÕÕ 
Aes
ÕÕ  #
.
ÕÕ# $
Create
ÕÕ$ *
(
ÕÕ* +
)
ÕÕ+ ,
;
ÕÕ, -
if
œœ 
(
œœ 
aes
œœ 
==
œœ 
null
œœ 
)
œœ  
{
–– 
throw
—— 
new
—— '
InvalidOperationException
—— 7
(
——7 8
$str
——8 f
)
——f g
;
——g h
}
““ 
aes
‘‘ 
.
‘‘ 
Key
‘‘ 
=
‘‘ 
_key
‘‘ 
;
‘‘ 
aes
’’ 
.
’’ 
IV
’’ 
=
’’ 
Convert
’’  
.
’’  !
FromBase64String
’’! 1
(
’’1 2

components
’’2 <
.
’’< =
iv
’’= ?
)
’’? @
;
’’@ A
var
◊◊ 
b
◊◊ 
=
◊◊ 
Convert
◊◊ 
.
◊◊  
FromBase64String
◊◊  0
(
◊◊0 1
	localComp
◊◊1 :
.
◊◊: ;
	encrypted
◊◊; D
)
◊◊D E
;
◊◊E F
using
ŸŸ 
var
ŸŸ 
	memStream
ŸŸ #
=
ŸŸ$ %
new
ŸŸ& )
MemoryStream
ŸŸ* 6
(
ŸŸ6 7
)
ŸŸ7 8
;
ŸŸ8 9
using
€€ 
(
€€ 
var
€€ 
cryptoStream
€€ '
=
€€( )
new
€€* -
CryptoStream
€€. :
(
€€: ;
	memStream
‹‹ 
,
‹‹ 
aes
‹‹ "
.
‹‹" #
CreateDecryptor
‹‹# 2
(
‹‹2 3
)
‹‹3 4
,
‹‹4 5
CryptoStreamMode
‹‹6 F
.
‹‹F G
Write
‹‹G L
)
‹‹L M
)
‹‹M N
{
›› 
cryptoStream
ﬁﬁ  
.
ﬁﬁ  !
Write
ﬁﬁ! &
(
ﬁﬁ& '
b
ﬁﬁ' (
,
ﬁﬁ( )
$num
ﬁﬁ* +
,
ﬁﬁ+ ,
b
ﬁﬁ- .
.
ﬁﬁ. /
Length
ﬁﬁ/ 5
)
ﬁﬁ5 6
;
ﬁﬁ6 7
}
ﬂﬂ 
return
·· 
Encoding
·· 
.
··  
Unicode
··  '
.
··' (
	GetString
··( 1
(
··1 2
	memStream
··2 ;
.
··; <
ToArray
··< C
(
··C D
)
··D E
)
··E F
;
··F G
}
‚‚ 
}
„„ 	
private
ÂÂ 
string
ÂÂ  
CalculateSignature
ÂÂ )
(
ÂÂ) *
string
ÂÂ* 0
value
ÂÂ1 6
)
ÂÂ6 7
{
ÊÊ 	
var
ÁÁ 
	textBytes
ÁÁ 
=
ÁÁ 
Encoding
ÁÁ $
.
ÁÁ$ %
Unicode
ÁÁ% ,
.
ÁÁ, -
GetBytes
ÁÁ- 5
(
ÁÁ5 6
value
ÁÁ6 ;
)
ÁÁ; <
;
ÁÁ< =
var
ËË 
keyBytes
ËË 
=
ËË 
_key
ËË 
;
ËË  
using
ÍÍ 
var
ÍÍ 
hash
ÍÍ 
=
ÍÍ 
new
ÍÍ  

HMACSHA256
ÍÍ! +
(
ÍÍ+ ,
keyBytes
ÍÍ, 4
)
ÍÍ4 5
;
ÍÍ5 6
var
ÎÎ 
	hashBytes
ÎÎ 
=
ÎÎ 
hash
ÎÎ  
.
ÎÎ  !
ComputeHash
ÎÎ! ,
(
ÎÎ, -
	textBytes
ÎÎ- 6
)
ÎÎ6 7
;
ÎÎ7 8
return
ÏÏ 
Convert
ÏÏ 
.
ÏÏ 
ToBase64String
ÏÏ )
(
ÏÏ) *
	hashBytes
ÏÏ* 3
)
ÏÏ3 4
;
ÏÏ4 5
}
ÌÌ 	
}
ÓÓ 
}ÔÔ ú
tC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Services\ConnectionStringBuilderAdapterFactory.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Services' /
{ 
public 

	interface 2
&IConnectionStringBuilderAdapterFactory ;
{ -
!IDbConnectionStringBuilderAdapter )
Get* -
(- .
). /
;/ 0
} 
public 

class 1
%ConnectionStringBuilderAdapterFactory 6
:7 82
&IConnectionStringBuilderAdapterFactory9 _
{ 
private 
readonly 
IOptions !
<! "
AppSettings" -
>- .
_appSettings/ ;
;; <
public 1
%ConnectionStringBuilderAdapterFactory 4
(4 5
IOptions5 =
<= >
AppSettings> I
>I J
appSettingsK V
)V W
=>X Z
_appSettings[ g
=h i
appSettingsj u
;u v
public -
!IDbConnectionStringBuilderAdapter 0
Get1 4
(4 5
)5 6
{ 	
var 
isPostgreSql 
= 
$str +
.+ ,
Equals, 2
(2 3
_appSettings3 ?
.? @
Value@ E
.E F
DatabaseEngineF T
,T U
StringComparison 
. &
InvariantCultureIgnoreCase 7
)7 8
;8 9
if 
( 
isPostgreSql 
) 
{ 
return   
new   0
$NpgsqlConnectionStringBuilderAdapter   ?
(  ? @
)  @ A
;  A B
}!! 
return"" 
new"" -
!SqlConnectionStringBuilderAdapter"" 8
(""8 9
)""9 :
;"": ;
}## 	
}$$ 
}%% œ
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Services\ConnectionStringService.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Services		' /
{

 
public 

class #
ConnectionStringService (
:( )$
IConnectionStringService* B
{ 
private 
readonly 
ConnectionStrings *
_connectionStrings+ =
;= >
private 
readonly 2
&IConnectionStringBuilderAdapterFactory ?2
&_connectionStringBuilderAdapterFactory@ f
;f g
public #
ConnectionStringService &
(& '
IOptions' /
</ 0
ConnectionStrings0 A
>A B
connectionStringsC T
,T U2
&IConnectionStringBuilderAdapterFactory 21
%connectionStringBuilderAdapterFactory3 X
)X Y
{ 	
_connectionStrings 
=  
connectionStrings! 2
.2 3
Value3 8
;8 92
&_connectionStringBuilderAdapterFactory 2
=3 41
%connectionStringBuilderAdapterFactory5 Z
;Z [
} 	
public 
string 
GetConnectionString )
() *
)* +
{ 	
var #
connectionStringBuilder '
=( )2
&_connectionStringBuilderAdapterFactory* P
.P Q
GetQ T
(T U
)U V
;V W#
connectionStringBuilder #
.# $
ConnectionString$ 4
=5 6
_connectionStrings7 I
.I J
ProductionOdsJ W
;W X
return #
connectionStringBuilder *
.* +
ConnectionString+ ;
;; <
} 	
}   
}!! å
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Services\IConnectionStringService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Services' /
{ 
public 

	interface $
IConnectionStringService -
{		 
string

 
GetConnectionString

 "
(

" #
)

# $
;

$ %
} 
} Û
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Services\IStringEncryptorService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Services' /
{ 
public 

	interface #
IStringEncryptorService ,
{		 
string

 
Encrypt

 
(

 
string

 
value

 #
)

# $
;

$ %
bool 

TryDecrypt 
( 
string 
value $
,$ %
out& )
string* 0
decryptedValue1 ?
)? @
;@ A
} 
} œ5
_C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Services\SimpleGetRequest.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Services' /
{ 
public 

	interface 
ISimpleGetRequest &
{ 
public 
Task 
< 
string 
> 
DownloadString *
(* +
string+ 1
address2 9
)9 :
;: ;
} 
public 

class 
SimpleGetRequest !
:" #
ISimpleGetRequest$ 5
{ 
private 
readonly 
IHttpClientFactory +
_clientFactory, :
;: ;
public 
SimpleGetRequest 
(  
IHttpClientFactory  2
clientFactory3 @
)@ A
{ 	
_clientFactory 
= 
clientFactory *
;* +
} 	
public 
async 
Task 
< 
string  
>  !
DownloadString" 0
(0 1
string1 7
address8 ?
)? @
{ 	
var 

httpClient 
= 
_clientFactory +
.+ ,
CreateClient, 8
(8 9
)9 :
;: ;
using 
( 
var 
response 
=  !
await" '

httpClient( 2
.2 3
GetAsync3 ;
(; <
address< C
)C D
)D E
{   
await!! #
CheckResponseStatusCode!! -
(!!- .
address!!. 5
,!!5 6
response!!7 ?
)!!? @
;!!@ A
using## 
(## 
var## 
content## "
=### $
response##% -
.##- .
Content##. 5
)##5 6
{$$ 
return%% 
await%%  
content%%! (
.%%( )
ReadAsStringAsync%%) :
(%%: ;
)%%; <
;%%< =
}&& 
}'' 
async)) 
Task)) #
CheckResponseStatusCode)) .
()). /
string))/ 5

requestUrl))6 @
,))@ A
HttpResponseMessage))B U
response))V ^
)))^ _
{** 
switch++ 
(++ 
response++  
.++  !

StatusCode++! +
)+++ ,
{,, 
case-- 
HttpStatusCode-- '
.--' (
OK--( *
:--* +
break.. 
;.. 
case// 
$num// 
:// 
throw00 
new00 ! 
HttpRequestException00" 6
(006 7
$"007 9
$str009 J
{00J K

requestUrl00K U
}00U V
$str00V W
"00W X
)00X Y
;00Y Z
case11 
HttpStatusCode11 '
.11' (
NotFound11( 0
:110 1
throw22 
new22 ! 
HttpRequestException22" 6
(226 7
$"227 9
{229 :

requestUrl22: D
}22D E
$str22E P
"22P Q
,22Q R
null22S W
,22W X
HttpStatusCode22Y g
.22g h
NotFound22h p
)22p q
;22q r
case33 
HttpStatusCode33 '
.33' (
ServiceUnavailable33( :
:33: ;
throw44 
new44 ! 
HttpRequestException44" 6
(446 7
$"55 
{55 

requestUrl55 )
}55) *
$str55* 9
"559 :
,55: ;
null55< @
,55@ A
HttpStatusCode55B P
.55P Q
ServiceUnavailable55Q c
)55c d
;55d e
case66 
HttpStatusCode66 '
.66' (

BadGateway66( 2
:662 3
throw77 
new77 ! 
HttpRequestException77" 6
(776 7
$"88 
{88 

requestUrl88 )
}88) *
$str	88* Ü
"
88Ü á
,
88á à
null99  
,99  !
HttpStatusCode99" 0
.990 1

BadGateway991 ;
)99; <
;99< =
case:: 
(:: 
HttpStatusCode:: (
)::( )
$num::) ,
:::, -
throw;; 
new;; ! 
HttpRequestException;;" 6
(;;6 7
$"<< 
$str<< A
{<<A B

requestUrl<<B L
}<<L M
$str<<M N
"<<N O
,<<O P
null<<Q U
,<<U V
(<<W X
HttpStatusCode<<X f
)<<f g
$num<<g j
)<<j k
;<<k l
case== 
(== 
HttpStatusCode== (
)==( )
$num==) ,
:==, -
throw>> 
new>> ! 
HttpRequestException>>" 6
(>>6 7
$"?? 
$str?? A
{??A B

requestUrl??B L
}??L M
$str??M N
"??N O
,??O P
null??Q U
,??U V
(??W X
HttpStatusCode??X f
)??f g
$num??g j
)??j k
;??k l
case@@ 
HttpStatusCode@@ '
.@@' (

BadRequest@@( 2
:@@2 3
throwAA 
newAA !%
InvalidOperationExceptionAA" ;
(AA; <
$"AA< >
$strAA> T
{AAT U

requestUrlAAU _
}AA_ `
$strAA` a
"AAa b
)AAb c
;AAc d
defaultBB 
:BB 
varCC 
messageCC #
=CC$ %
$"CC& (
$strCC( A
{CCA B

requestUrlCCB L
}CCL M
"CCM N
;CCN O
usingEE 
(EE 
varEE "
contentEE# *
=EE+ ,
responseEE- 5
.EE5 6
ContentEE6 =
)EE= >
{FF 
varGG 
detailsGG  '
=GG( )
awaitGG* /
contentGG0 7
.GG7 8
ReadAsStringAsyncGG8 I
(GGI J
)GGJ K
;GGK L
ifII 
(II  
!II  !
stringII! '
.II' (
IsNullOrEmptyII( 5
(II5 6
detailsII6 =
)II= >
)II> ?
messageJJ  '
+=JJ( *
$"JJ+ -
$strJJ- /
{JJ/ 0
detailsJJ0 7
}JJ7 8
"JJ8 9
;JJ9 :
}KK 
throwMM 
newMM ! 
HttpRequestExceptionMM" 6
(MM6 7
messageMM7 >
,MM> ?
nullMM@ D
,MMD E
HttpStatusCodeMMF T
.MMT U
ServiceUnavailableMMU g
)MMg h
;MMh i
}NN 
}OO 
}PP 	
}QQ 
}RR £
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Settings\CloudOdsApiWebsiteSettings.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Settings' /
{		 
public

 

class

 &
CloudOdsApiWebsiteSettings

 +
{ 
public 
const 
string )
BearerTokenTimeoutSettingName 9
=: ;
$str< Y
;Y Z
public 
const 
int .
"DefaultBearerTokenTimeoutInMinutes ;
=< =
$num> @
;@ A
public 
const 
string 
LogLevelSettingName /
=0 1
$str2 D
;D E
public 
static 
readonly 
LogLevel '
DefaultLogLevel( 7
=8 9
LogLevel: B
.B C
InfoC G
;G H
private 
readonly 
IDictionary $
<$ %
string% +
,+ ,
string- 3
>3 4
_settingsDictionary5 H
;H I
public &
CloudOdsApiWebsiteSettings )
() *
)* +
{ 	
_settingsDictionary 
=  !
new" %

Dictionary& 0
<0 1
string1 7
,7 8
string9 ?
>? @
(@ A
)A B
;B C
} 	
public &
CloudOdsApiWebsiteSettings )
() *
IDictionary* 5
<5 6
string6 <
,< =
string> D
>D E
settingsF N
)N O
{ 	
_settingsDictionary 
=  !
settings" *
;* +
} 	
public 
IDictionary 
< 
string !
,! "
string# )
>) *
AsDictionary+ 7
(7 8
)8 9
{ 	
return   
_settingsDictionary   &
;  & '
}!! 	
public$$ 
int$$ '
BearerTokenTimeoutInMinutes$$ .
{%% 	
get&& 
=>&& 
_settingsDictionary&& &
.&&& '(
GetOptionalIntValueOrDefault&&' C
(&&C D)
BearerTokenTimeoutSettingName&&D a
,&&a b/
"DefaultBearerTokenTimeoutInMinutes	&&c Ö
)
&&Ö Ü
;
&&Ü á
set'' 
=>'' 
_settingsDictionary'' &
[''& ')
BearerTokenTimeoutSettingName''' D
]''D E
=''F G
value''H M
.''M N
ToString''N V
(''V W
)''W X
;''X Y
}(( 	
public** 
LogLevel** 
LogLevel**  
{++ 	
get,, 
{-- 
var.. 
stringSetting.. !
=.." #
_settingsDictionary..$ 7
...7 8"
GetOptionalStringValue..8 N
(..N O
LogLevelSettingName..O b
,..b c
DefaultLogLevel..d s
...s t
DisplayName..t 
)	.. Ä
;
..Ä Å
LogLevel// 
result// 
;//  
return11 
LogLevel11 
.11  
TryParse11  (
(11( )
stringSetting11) 6
,116 7
out118 ;
result11< B
)11B C
?22 
result22 
:33 
DefaultLogLevel33 %
;33% &
}44 
set55 
=>55 
_settingsDictionary55 &
[55& '
LogLevelSettingName55' :
]55: ;
=55< =
value55> C
.55C D
DisplayName55D O
;55O P
}66 	
}77 
}88 ı"
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Settings\CloudOdsSettingsService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Settings' /
{		 
public

 

	interface

 $
ICloudOdsSettingsService

 -
{ 
Task 
< &
CloudOdsApiWebsiteSettings '
>' (
GetSettings) 4
(4 5
string5 ;
instanceName< H
)H I
;I J
Task 
UpdateSettings 
( 
string "
instanceName# /
,/ 0&
CloudOdsApiWebsiteSettings1 K
newSettingsL W
)W X
;X Y
} 
public 

class #
CloudOdsSettingsService (
:) *$
ICloudOdsSettingsService+ C
{ 
private 
readonly /
#IGetCloudOdsApiWebsiteSettingsQuery </
#_getCloudOdsApiWebsiteSettingsQuery= `
;` a
private 
readonly %
IGetCloudOdsInstanceQuery 2%
_getCloudOdsInstanceQuery3 L
;L M
private 
readonly 4
(IUpdateCloudOdsApiWebsiteSettingsCommand A4
(_updateCloudOdsApiWebsiteSettingsCommandB j
;j k
public #
CloudOdsSettingsService &
(& '%
IGetCloudOdsInstanceQuery' @$
getCloudOdsInstanceQueryA Y
,Y Z/
#IGetCloudOdsApiWebsiteSettingsQuery /.
"getCloudOdsApiWebsiteSettingsQuery0 R
,R S4
(IUpdateCloudOdsApiWebsiteSettingsCommand 43
'updateCloudOdsApiWebsiteSettingsCommand5 \
)\ ]
{ 	%
_getCloudOdsInstanceQuery %
=& '$
getCloudOdsInstanceQuery( @
;@ A/
#_getCloudOdsApiWebsiteSettingsQuery /
=0 1.
"getCloudOdsApiWebsiteSettingsQuery2 T
;T U4
(_updateCloudOdsApiWebsiteSettingsCommand 4
=5 63
'updateCloudOdsApiWebsiteSettingsCommand7 ^
;^ _
} 	
public   
async   
Task   
<   &
CloudOdsApiWebsiteSettings   4
>  4 5
GetSettings  6 A
(  A B
string  B H
instanceName  I U
)  U V
{!! 	
var"" 
instance"" 
="" 
await""  
GetCloudOdsInstance""! 4
(""4 5
instanceName""5 A
)""A B
;""B C
var## 
context## 
=## 
new## '
CloudOdsApiOperationContext## 9
(##9 :
instance##: B
)##B C
;##C D
return%% 
await%% /
#_getCloudOdsApiWebsiteSettingsQuery%% <
.%%< =
Execute%%= D
(%%D E
context%%E L
)%%L M
;%%M N
}&& 	
public(( 
async(( 
Task(( 
UpdateSettings(( (
(((( )
string(() /
instanceName((0 <
,((< =&
CloudOdsApiWebsiteSettings((> X
newSettings((Y d
)((d e
{)) 	
var** 
instance** 
=** 
await**  
GetCloudOdsInstance**! 4
(**4 5
instanceName**5 A
)**A B
;**B C
var++ 
context++ 
=++ 
new++ '
CloudOdsApiOperationContext++ 9
(++9 :
instance++: B
)++B C
;++C D
await-- 4
(_updateCloudOdsApiWebsiteSettingsCommand-- :
.--: ;
Execute--; B
(--B C
context--C J
,--J K
newSettings--L W
)--W X
;--X Y
}.. 	
private00 
async00 
Task00 
<00 
CloudOdsInstance00 +
>00+ ,
GetCloudOdsInstance00- @
(00@ A
string00A G 
cloudOdsInstanceName00H \
)00\ ]
{11 	
var22 
defaultInstance22 
=22  !
await22" '%
_getCloudOdsInstanceQuery22( A
.22A B
Execute22B I
(22I J 
cloudOdsInstanceName22J ^
)22^ _
;22_ `
return33 
defaultInstance33 "
;33" #
}44 	
}55 
}66 œ%
cC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Settings\DictionaryExtensions.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
Settings		' /
{

 
public 

static 
class  
DictionaryExtensions ,
{ 
public 
static 
string "
GetOptionalStringValue 3
(3 4
this4 8
IDictionary9 D
<D E
stringE K
,K L
stringM S
>S T
settingsU ]
,] ^
string_ e
keyf i
,i j
stringk q
defaultValuer ~
=	 Ä
null
Å Ö
)
Ö Ü
{ 	
return 
! 
settings 
. 
ContainsKey (
(( )
key) ,
), -
?. /
defaultValue0 <
:= >
settings? G
[G H
keyH K
]K L
;L M
} 	
public 
static 
string "
GetRequiredStringValue 3
(3 4
this4 8
IDictionary9 D
<D E
stringE K
,K L
stringM S
>S T
settingsU ]
,] ^
string_ e
keyf i
)i j
{ 	
if 
( 
! 
settings 
. 
ContainsKey %
(% &
key& )
)) *
)* +
{ 
throw 
new  
KeyNotFoundException .
(. /
$"/ 1
$str1 6
{6 7
key7 :
}: ;
$str; F
"F G
)G H
;H I
} 
return 
settings 
[ 
key 
]  
;  !
} 	
public 
static 
int 
GetRequiredIntValue -
(- .
this. 2
IDictionary3 >
<> ?
string? E
,E F
stringG M
>M N
settingsO W
,W X
stringY _
key` c
)c d
{ 	
if 
( 
! 
settings 
. 
ContainsKey %
(% &
key& )
)) *
)* +
{ 
throw   
new    
KeyNotFoundException   .
(  . /
$"  / 1
$str  1 6
{  6 7
key  7 :
}  : ;
$str  ; F
"  F G
)  G H
;  H I
}!! 
int## 
result## 
;## 
if$$ 
($$ 
!$$ 
int$$ 
.$$ 
TryParse$$ 
($$ 
settings$$ &
[$$& '
key$$' *
]$$* +
,$$+ ,
out$$- 0
result$$1 7
)$$7 8
)$$8 9
{%% 
throw&& 
new&& 
FormatException&& )
(&&) *
$"&&* ,
$str&&, ;
{&&; <
key&&< ?
}&&? @
$str&&@ ]
"&&] ^
)&&^ _
;&&_ `
}'' 
return)) 
result)) 
;)) 
}** 	
public,, 
static,, 
int,, (
GetOptionalIntValueOrDefault,, 6
(,,6 7
this,,7 ;
IDictionary,,< G
<,,G H
string,,H N
,,,N O
string,,P V
>,,V W
settings,,X `
,,,` a
string,,b h
key,,i l
,,,l m
int,,n q
defaultValue,,r ~
),,~ 
{-- 	
string.. 
valueString.. 
;.. 
if// 
(// 
!// 
settings// 
.// 
TryGetValue// %
(//% &
key//& )
,//) *
out//+ .
valueString/// :
)//: ;
)//; <
return//= C
defaultValue//D P
;//P Q
int11 
valueInt11 
;11 
if22 
(22 
int22 
.22 
TryParse22 
(22 
valueString22 (
,22( )
out22* -
valueInt22. 6
)226 7
)227 8
{33 
return44 
valueInt44 
;44  
}55 
throw66 
new66 
FormatException66 %
(66% &
$"66& (
$str66( 7
{667 8
key668 ;
}66; <
$str66< Y
"66Y Z
)66Z [
;66[ \
}77 	
}88 
}99 ú
WC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\Settings\LogLevel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
Settings' /
{ 
public 

sealed 
class 
LogLevel  
:! "
Enumeration# .
<. /
LogLevel/ 7
>7 8
{		 
public

 
static

 
readonly

 
LogLevel

 '
All

( +
=

, -
new

. 1
LogLevel

2 :
(

: ;
$num

; <
,

< =
$str

> C
)

C D
;

D E
public 
static 
readonly 
LogLevel '
Debug( -
=. /
new0 3
LogLevel4 <
(< =
$num= >
,> ?
$str@ G
)G H
;H I
public 
static 
readonly 
LogLevel '
Info( ,
=- .
new/ 2
LogLevel3 ;
(; <
$num< =
,= >
$str? E
)E F
;F G
public 
static 
readonly 
LogLevel '
Warn( ,
=- .
new/ 2
LogLevel3 ;
(; <
$num< =
,= >
$str? E
)E F
;F G
public 
static 
readonly 
LogLevel '
Error( -
=. /
new0 3
LogLevel4 <
(< =
$num= >
,> ?
$str@ G
)G H
;H I
public 
static 
readonly 
LogLevel '
Fatal( -
=. /
new0 3
LogLevel4 <
(< =
$num= >
,> ?
$str@ G
)G H
;H I
public 
static 
readonly 
LogLevel '
Off( +
=, -
new. 1
LogLevel2 :
(: ;
$num; <
,< =
$str> C
)C D
;D E
private 
LogLevel 
( 
int 
value "
," #
string$ *
displayName+ 6
)6 7
:8 9
base: >
(> ?
value? D
,D E
displayNameF Q
)Q R
{ 	
} 	
} 
} ®
YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\AddUserCommand.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
User

' +
{ 
public 

class 
AddUserCommand 
{ 
public 
async 
Task 
< 
( 
string !
userId" (
,( )
IdentityResult* 8
result9 ?
)? @
>@ A
ExecuteB I
(I J
IAddUserModelJ W
	userModelX a
,a b
UserManagerc n
<n o
AdminAppUsero {
>{ |
userManager	} à
)
à â
{ 	
var 
user 
= 
new 
AdminAppUser '
{( )
UserName* 2
=3 4
	userModel5 >
.> ?
Email? D
,D E
EmailF K
=L M
	userModelN W
.W X
EmailX ]
,] ^!
RequirePasswordChange_ t
=u v
truew {
}| }
;} ~
var 
result 
= 
await 
userManager *
.* +
CreateAsync+ 6
(6 7
user7 ;
,; <
	userModel= F
.F G
PasswordG O
)O P
;P Q
return 
( 
userId 
: 
user  
.  !
Id! #
,# $
result% +
:+ ,
result- 3
)3 4
;4 5
} 	
} 
public 

	interface 
IAddUserModel "
{ 
string 
Email 
{ 
get 
; 
} 
string 
Password 
{ 
get 
; 
}  
} 
} ˜!
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\AddUserLoginCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
User' +
{ 
public 

class 
AddUserLoginCommand $
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public 
AddUserLoginCommand "
(" #%
AdminAppIdentityDbContext# <
identity= E
)E F
{ 	
	_identity 
= 
identity  
;  !
} 	
public 
async 
Task 
< 
string  
>  !
Execute" )
() *
IAddUserLoginModel* <
userLoginModel= K
)K L
{ 	
var 
userId 
= 
await 
GetOrAddUser +
(+ ,
userLoginModel, :
): ;
;; <
var 
newUserLogin 
= 
new "
IdentityUserLogin# 4
{ 
LoginProvider 
= 
userLoginModel  .
.. /
LoginProvider/ <
,< =
ProviderDisplayName #
=$ %
userLoginModel& 4
.4 5
ProviderDisplayName5 H
,H I
ProviderKey 
= 
userLoginModel ,
., -
ProviderKey- 8
,8 9
UserId 
= 
userId 
,  
}   
;   
await!! 
	_identity!! 
.!! 

UserLogins!! &
.!!& '
AddAsync!!' /
(!!/ 0
newUserLogin!!0 <
)!!< =
;!!= >
await## 
	_identity## 
.## 
SaveChangesAsync## ,
(##, -
)##- .
;##. /
return%% 
userId%% 
;%% 
}&& 	
private(( 
async(( 
Task(( 
<(( 
string(( !
>((! "
GetOrAddUser((# /
(((/ 0
IAddUserLoginModel((0 B
userLoginModel((C Q
)((Q R
{)) 	
var** 
user** 
=** 
	_identity**  
.**  !
Users**! &
.**& '
SingleOrDefault**' 6
(**6 7
u**7 8
=>**9 ;
u**< =
.**= >
UserName**> F
==**G I
userLoginModel**J X
.**X Y
	UserEmail**Y b
)**b c
;**c d
if,, 
(,, 
user,, 
!=,, 
null,, 
),, 
{,, 
return,,  &
user,,' +
.,,+ ,
Id,,, .
;,,. /
},,0 1
var.. 
newUser.. 
=.. 
new.. 
AdminAppUser.. *
{..+ ,
UserName..- 5
=..6 7
userLoginModel..8 F
...F G
	UserEmail..G P
,..P Q
Email..R W
=..X Y
userLoginModel..Z h
...h i
	UserEmail..i r
,..r s"
RequirePasswordChange	..t â
=
..ä ã
false
..å ë
}
..í ì
;
..ì î
await// 
	_identity// 
.// 
Users// !
.//! "
AddAsync//" *
(//* +
newUser//+ 2
)//2 3
;//3 4
return00 
newUser00 
.00 
Id00 
;00 
}11 	
}22 
public44 

	interface44 
IAddUserLoginModel44 '
{55 
public66 
string66 
LoginProvider66 #
{66$ %
get66& )
;66) *
}66+ ,
public77 
string77 
ProviderKey77 !
{77" #
get77$ '
;77' (
}77) *
public88 
string88 
ProviderDisplayName88 )
{88* +
get88, /
;88/ 0
}881 2
public99 
string99 
	UserEmail99 
{99  !
get99" %
;99% &
}99' (
}:: 
};; ≥
\C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\DeleteUserCommand.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
User		' +
{

 
public 

class 
DeleteUserCommand "
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public 
DeleteUserCommand  
(  !%
AdminAppIdentityDbContext! :
identity; C
)C D
{ 	
	_identity 
= 
identity  
;  !
} 	
public 
void 
Execute 
( 
IDeleteUserModel ,
	userModel- 6
)6 7
{ 	#
RemoveExistingUserRoles #
(# $
	userModel$ -
.- .
UserId. 4
)4 5
;5 6*
RemoveExistingUserOdsInstances *
(* +
	userModel+ 4
.4 5
UserId5 ;
); <
;< =
	_identity 
. 
Users 
. 
Remove "
(" #
	_identity# ,
., -
Users- 2
.2 3
Single3 9
(9 :
x: ;
=>< >
x? @
.@ A
IdA C
==D F
	userModelG P
.P Q
UserIdQ W
)W X
)X Y
;Y Z
	_identity 
. 
SaveChanges !
(! "
)" #
;# $
} 	
private 
void *
RemoveExistingUserOdsInstances 3
(3 4
string4 :
userId; A
)A B
{   	
var!! $
existingUserOdsInstances!! (
=!!) *
	_identity"" 
."" 
UserOdsInstances"" *
.""* +
Where""+ 0
(""0 1
x""1 2
=>""3 5
x""6 7
.""7 8
UserId""8 >
==""? A
userId""B H
)""H I
;""I J
if$$ 
($$ $
existingUserOdsInstances$$ (
.$$( )
Any$$) ,
($$, -
)$$- .
)$$. /
{%% 
	_identity&& 
.&& 
UserOdsInstances&& *
.&&* +
RemoveRange&&+ 6
(&&6 7$
existingUserOdsInstances&&7 O
)&&O P
;&&P Q
}'' 
	_identity)) 
.)) 
SaveChanges)) !
())! "
)))" #
;))# $
}** 	
private,, 
void,, #
RemoveExistingUserRoles,, ,
(,,, -
string,,- 3
userId,,4 :
),,: ;
{-- 	
var.. 
existingUserRoles.. !
=.." #
	_identity// 
.// 
	UserRoles// #
.//# $
Where//$ )
(//) *
x//* +
=>//, .
x/// 0
.//0 1
UserId//1 7
==//8 :
userId//; A
)//A B
;//B C
if11 
(11 
existingUserRoles11 !
.11! "
Any11" %
(11% &
)11& '
)11' (
{22 
	_identity33 
.33 
	UserRoles33 #
.33# $
RemoveRange33$ /
(33/ 0
existingUserRoles330 A
)33A B
;33B C
}44 
	_identity66 
.66 
SaveChanges66 !
(66! "
)66" #
;66# $
}77 	
}88 
public:: 

	interface:: 
IDeleteUserModel:: %
{;; 
string<< 
UserId<< 
{<< 
get<< 
;<< 
}<< 
}== 
}>> ß1
tC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\EditOdsInstanceRegistrationForUserCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
User' +
{ 
public 

class )
EditOdsInstanceForUserCommand .
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public )
EditOdsInstanceForUserCommand ,
(, -%
AdminAppIdentityDbContext- F
identityG O
)O P
{ 	
	_identity 
= 
identity  
;  !
} 	
public 
void 
Execute 
( (
IEditOdsInstanceForUserModel 8
model9 >
)> ?
{ 	
var #
preexistingAssociations '
=( )
	_identity* 3
.3 4
UserOdsInstances4 D
.D E
WhereE J
(J K
xK L
=>M O
xP Q
.Q R
UserIdR X
==Y [
model\ a
.a b
UserIdb h
)h i
.i j
ToListj p
(p q
)q r
;r s
var "
selectedOdsInstanceIds &
=' (
model 
. 
OdsInstances "
." #
Where# (
(( )
x) *
=>+ -
x. /
./ 0
Selected0 8
)8 9
.9 :
Select: @
(@ A
xA B
=>C E
xF G
.G H
OdsInstanceIdH U
)U V
.V W
ToListW ]
(] ^
)^ _
;_ `
var 
recordsToAdd 
= 
NewAssignments -
(- .
model. 3
.3 4
UserId4 :
,: ;"
selectedOdsInstanceIds< R
,R S#
preexistingAssociationsT k
)k l
;l m
if 
( 
recordsToAdd 
. 
Any  
(  !
)! "
)" #
	_identity   
.   
UserOdsInstances   *
.  * +
AddRange  + 3
(  3 4
recordsToAdd  4 @
)  @ A
;  A B
var"" 
recordsToRemove"" 
=""  !
AssignmentsToRemove""" 5
(""5 6"
selectedOdsInstanceIds""6 L
,""L M#
preexistingAssociations""N e
)""e f
;""f g
if$$ 
($$ 
recordsToRemove$$ 
.$$  
Any$$  #
($$# $
)$$$ %
)$$% &
	_identity%% 
.%% 
UserOdsInstances%% *
.%%* +
RemoveRange%%+ 6
(%%6 7
recordsToRemove%%7 F
)%%F G
;%%G H
	_identity'' 
.'' 
SaveChanges'' !
(''! "
)''" #
;''# $
}(( 	
private** 
static** 
List** 
<** 
UserOdsInstance** +
>**+ ,
AssignmentsToRemove**- @
(**@ A
List**A E
<**E F
int**F I
>**I J#
requestedOdsInstanceIds**K b
,**b c
List**d h
<**h i
UserOdsInstance**i x
>**x y$
preexistingAssociations	**z ë
)
**ë í
{++ 	
return,, #
preexistingAssociations,, *
.-- 
Where-- 
(-- 
record-- 
=>--  
!--! "#
requestedOdsInstanceIds--" 9
.--9 :
Contains--: B
(--B C
record--C I
.--I J
OdsInstanceId--J W
)--W X
)--X Y
... 
ToList.. 
(.. 
).. 
;.. 
}// 	
private11 
static11 
List11 
<11 
UserOdsInstance11 +
>11+ ,
NewAssignments11- ;
(11; <
string11< B
userId11C I
,11I J
List11K O
<11O P
int11P S
>11S T#
requestedOdsInstanceIds11U l
,11l m
List11n r
<11r s
UserOdsInstance	11s Ç
>
11Ç É%
preexistingAssociations
11Ñ õ
)
11õ ú
{22 	
var33 !
missingOdsInstanceIds33 %
=33& '#
requestedOdsInstanceIds44 '
.44' (
Except44( .
(44. /#
preexistingAssociations55 +
.55+ ,
Select55, 2
(552 3
x553 4
=>555 7
x558 9
.559 :
OdsInstanceId55: G
)55G H
)55H I
;55I J
return77 !
missingOdsInstanceIds77 (
.88 
Select88 
(88 
x88 
=>88 
new88  
UserOdsInstance88! 0
{99 
UserId:: 
=:: 
userId:: #
,::# $
OdsInstanceId;; !
=;;" #
x;;$ %
}<< 
)<< 
.<< 
ToList<< 
(<< 
)<< 
;<< 
}== 	
}>> 
public@@ 

	interface@@ (
IEditOdsInstanceForUserModel@@ 1
{AA 
stringBB 
UserIdBB 
{BB 
getBB 
;BB 
}BB 
ListCC 
<CC  
OdsInstanceSelectionCC !
>CC! "
OdsInstancesCC# /
{CC0 1
getCC2 5
;CC5 6
}CC7 8
}DD 
publicFF 

classFF  
OdsInstanceSelectionFF %
{GG 
publicHH 
intHH 
OdsInstanceIdHH  
{HH! "
getHH# &
;HH& '
setHH( +
;HH+ ,
}HH- .
publicII 
stringII 
NameII 
{II 
getII  
;II  !
setII" %
;II% &
}II' (
publicJJ 
boolJJ 
SelectedJJ 
{JJ 
getJJ "
;JJ" #
setJJ$ '
;JJ' (
}JJ) *
}KK 
}LL “
ZC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\EditUserCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
User' +
{ 
public 

class 
EditUserCommand  
{ 
public 
async 
Task 
< 
IdentityResult (
>( )
Execute* 1
(1 2
IEditUserModel2 @
	userModelA J
,J K
UserManagerL W
<W X
AdminAppUserX d
>d e
userManagerf q
)q r
{ 	
var 
existingUser 
= 
await $
userManager% 0
.0 1
FindByIdAsync1 >
(> ?
	userModel? H
.H I
UserIdI O
)O P
;P Q
existingUser 
. 
Email 
=  
	userModel! *
.* +
Email+ 0
;0 1
existingUser 
. 
UserName !
=" #
	userModel$ -
.- .
Email. 3
;3 4
var 
result 
= 
await 
userManager *
.* +
UpdateAsync+ 6
(6 7
existingUser7 C
)C D
;D E
return 
result 
; 
} 	
} 
public 

	interface 
IEditUserModel #
{ 
string 
Email 
{ 
get 
; 
} 
string 
UserId 
{ 
get 
; 
} 
}   
}!! Ë
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\EditUserRoleCommand.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
User

' +
{ 
public 

class 
EditUserRoleCommand $
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public 
EditUserRoleCommand "
(" #%
AdminAppIdentityDbContext# <
identity= E
)E F
{ 	
	_identity 
= 
identity  
;  !
} 	
public 
void 
Execute 
( 
IEditUserRoleModel .
model/ 4
)4 5
{ 	
var 
newUserRole 
= 
new !
IdentityUserRole" 2
{ 
UserId 
= 
model 
. 
UserId %
,% &
RoleId 
= 
model 
. 
RoleId %
} 
; 
var 
currentUserRole 
=  !
	_identity 
. 
	UserRoles #
.# $
SingleOrDefault$ 3
(3 4
x4 5
=>6 8
x9 :
.: ;
UserId; A
==B D
modelE J
.J K
UserIdK Q
)Q R
;R S
if   
(   
currentUserRole   
!=    "
null  # '
)  ' (
{!! 
	_identity"" 
."" 
	UserRoles"" #
.""# $
Remove""$ *
(""* +
currentUserRole""+ :
)"": ;
;""; <
}## 
	_identity%% 
.%% 
	UserRoles%% 
.%%  
Add%%  #
(%%# $
newUserRole%%$ /
)%%/ 0
;%%0 1
	_identity&& 
.&& 
SaveChanges&& !
(&&! "
)&&" #
;&&# $
}'' 	
}(( 
public** 

	interface** 
IEditUserRoleModel** '
{++ 
string,, 
UserId,, 
{,, 
get,, 
;,, 
},, 
string-- 
RoleId-- 
{-- 
get-- 
;-- 
}-- 
}.. 
}// …	
cC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\GetAdminAppUserByIdQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
User

' +
{ 
public 

class $
GetAdminAppUserByIdQuery )
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public $
GetAdminAppUserByIdQuery '
(' (%
AdminAppIdentityDbContext( A
identityB J
)J K
{ 	
	_identity 
= 
identity  
;  !
} 	
public 
AdminAppUser 
Execute #
(# $
string$ *
userId+ 1
)1 2
{ 	
return 
	_identity 
. 
Users "
." #
Single# )
() *
x* +
=>, .
x/ 0
.0 1
Id1 3
==4 6
userId7 =
)= >
;> ?
} 	
} 
} ˆ	
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\GetAdminAppUsersQuery.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
User' +
{ 
public 

class !
GetAdminAppUsersQuery &
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public !
GetAdminAppUsersQuery $
($ %%
AdminAppIdentityDbContext% >
identity? G
)G H
{ 	
	_identity 
= 
identity  
;  !
} 	
public 
IReadOnlyList 
< 
AdminAppUser )
>) *
Execute+ 2
(2 3
)3 4
{ 	
return 
	_identity 
. 
Users "
." #
OrderBy# *
(* +
x+ ,
=>- /
x0 1
.1 2
UserName2 :
): ;
.; <
ToArray< C
(C D
)D E
;E F
} 	
} 
} ¥
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\GetRoleForUserQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
User

' +
{ 
public 

class 
GetRoleForUserQuery $
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public 
GetRoleForUserQuery "
(" #%
AdminAppIdentityDbContext# <
identity= E
)E F
{ 	
	_identity 
= 
identity  
;  !
} 	
public 
Role 
Execute 
( 
string "
userId# )
)) *
{ 	
var 

userRoleId 
= 
	_identity &
.& '
	UserRoles' 0
.0 1
SingleOrDefault1 @
(@ A
xA B
=>C E
xF G
.G H
UserIdH N
==O Q
userIdR X
)X Y
?Y Z
.Z [
RoleId[ a
;a b
return 

userRoleId 
!=  
null! %
?& '
Role( ,
., -
GetAll- 3
(3 4
)4 5
.5 6
Single6 <
(< =
x= >
=>? A
xB C
.C D
ValueD I
.I J
EqualsJ P
(P Q
intQ T
.T U
ParseU Z
(Z [

userRoleId[ e
)e f
)f g
)g h
:i j
nullk o
;o p
} 	
} 
} Ω
\C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management\User\GetUserLoginQuery.cs
	namespace

 	
EdFi


 
.

 
Ods

 
.

 
AdminApp

 
.

 

Management

 &
.

& '
User

' +
{ 
public 

class 
GetUserLoginQuery "
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public 
GetUserLoginQuery  
(  !%
AdminAppIdentityDbContext! :
identity; C
)C D
{ 	
	_identity 
= 
identity  
;  !
} 	
public 
IdentityUserLogin  
Execute! (
(( )
IGetUserLoginModel) ;
userLoginModel< J
)J K
{ 	
var 
	userLogin 
= 
	_identity %
.% &

UserLogins& 0
.0 1
SingleOrDefault1 @
(@ A
x 
=> 
x 
. 
LoginProvider $
==% '
userLoginModel( 6
.6 7
LoginProvider7 D
&&E G
x 
. 
ProviderKey "
==# %
userLoginModel& 4
.4 5
ProviderKey5 @
)@ A
;A B
if 
( 
	userLogin 
!= 
null !
)! "
{ 
return 
new 
IdentityUserLogin ,
{ 
LoginProvider !
=" #
	userLogin$ -
.- .
LoginProvider. ;
,; <
ProviderKey   
=    !
	userLogin  " +
.  + ,
ProviderKey  , 7
,  7 8
UserId!! 
=!! 
	userLogin!! &
.!!& '
UserId!!' -
,!!- .
ProviderDisplayName"" '
=""( )
	userLogin""* 3
.""3 4
ProviderDisplayName""4 G
}## 
;## 
}$$ 
return&& 
null&& 
;&& 
}'' 	
}(( 
public** 

	interface** 
IGetUserLoginModel** '
{++ 
public,, 
string,, 
LoginProvider,, #
{,,$ %
get,,& )
;,,) *
},,+ ,
public-- 
string-- 
ProviderKey-- !
{--" #
get--$ '
;--' (
}--) *
}.. 
}// 
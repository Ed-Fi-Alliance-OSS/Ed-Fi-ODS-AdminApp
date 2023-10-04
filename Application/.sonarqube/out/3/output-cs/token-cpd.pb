�
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\BypassInstanceContextFilter.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{		 
[

 
AttributeUsage

 
(

 
AttributeTargets

 $
.

$ %
Class

% *
)

* +
]

+ ,
public 

class '
BypassInstanceContextFilter ,
:- .
	Attribute/ 8
{ 
} 
} �
xC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\BypassPasswordChangeRequiredFilterAttribute.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{		 
[

 
AttributeUsage

 
(

 
AttributeTargets

 $
.

$ %
Class

% *
)

* +
]

+ ,
public 

class 7
+BypassPasswordChangeRequiredFilterAttribute <
:= >
	Attribute? H
{ 
} 
} �
oC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\BypassSetupRequiredFilterAttribute.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{		 
[

 
AttributeUsage

 
(

 
AttributeTargets

 $
.

$ %
Class

% *
)

* +
]

+ ,
public 

class .
"BypassSetupRequiredFilterAttribute 3
:4 5
	Attribute6 ?
{ 
} 
} �2
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\InstanceContextFilter.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{ 
public 

class !
InstanceContextFilter &
:' (!
ActionFilterAttribute) >
,> ? 
IAuthorizationFilter@ T
{ 
private 
readonly 
InstanceContext (
_instanceContext) 9
;9 :
private 
readonly 
IUsersContext &

_dbContext' 1
;1 2
private 
readonly %
AdminAppIdentityDbContext 2&
_adminAppIdentityDbContext3 M
;M N
public !
InstanceContextFilter $
($ %
InstanceContext% 4
instanceContext5 D
,D E
IUsersContextF S
	dbContextT ]
,] ^%
AdminAppIdentityDbContext %%
adminAppIdentityDbContext& ?
)? @
{ 	
_instanceContext 
= 
instanceContext .
;. /

_dbContext 
= 
	dbContext "
;" #&
_adminAppIdentityDbContext &
=' (%
adminAppIdentityDbContext) B
;B C
} 	
public   
void   
OnAuthorization   #
(  # $&
AuthorizationFilterContext  $ >
filterContext  ? L
)  L M
{!! 	
if"" 
("" 

SkipFilter"" 
("" 
filterContext"" (
.""( )
ActionDescriptor"") 9
as"": <&
ControllerActionDescriptor""= W
)""W X
)""X Y
return""Z `
;""` a
var$$ 
unsafeInstanceId$$  
=$$! "
filterContext$$# 0
.$$0 1
HttpContext$$1 <
.$$< =
Request$$= D
.$$D E
Cookies$$E L
[$$L M
$str$$M W
]$$W X
;$$X Y
var%% 
userId%% 
=%% 
filterContext%% &
.%%& '
HttpContext%%' 2
.%%2 3
User%%3 7
.%%7 8
FindFirstValue%%8 F
(%%F G

ClaimTypes%%G Q
.%%Q R
NameIdentifier%%R `
)%%` a
;%%a b
if'' 
('' 
!'' (
TryQueryInstanceRegistration'' -
(''- .
userId''. 4
,''4 5
unsafeInstanceId''6 F
,''F G
out''H K
var''L O
instance''P X
)''X Y
)''Y Z
{(( 
filterContext)) 
.)) 
Result)) $
=))% &
new))' *
RedirectResult))+ 9
())9 :
$str)): J
)))J K
;))K L
return** 
;** 
}++ 
_instanceContext-- 
.-- 
Id-- 
=--  !
instance--" *
.--* +
OdsInstanceId--+ 8
;--8 9
_instanceContext.. 
... 
Name.. !
=.." #
instance..$ ,
..., -
Name..- 1
;..1 2
_instanceContext// 
.// 
Description// (
=//) *
instance//+ 3
.//3 4
Name//4 8
;//8 9
}00 	
private22 
bool22 (
TryQueryInstanceRegistration22 1
(221 2
string222 8
userId229 ?
,22? @
string22A G
unsafeInstanceId22H X
,22X Y
out22Z ]
OdsInstance22^ i
instance22j r
)22r s
{33 	
if44 
(44 
int44 
.44 
TryParse44 
(44 
unsafeInstanceId44 -
,44- .
out44/ 2
var443 6
safeInstanceId447 E
)44E F
)44F G
{55 
var66 
isAuthorized66  
=66! "
true66# '
;66' (
var88 
instanceLookup88 "
=88# $

_dbContext88% /
.88/ 0
OdsInstances880 <
.88< =
Find88= A
(88A B
safeInstanceId88B P
)88P Q
;88Q R
if:: 
(:: 
isAuthorized::  
&&::! #
instanceLookup::$ 2
!=::3 5
null::6 :
)::: ;
{;; 
instance<< 
=<< 
instanceLookup<< -
;<<- .
return== 
true== 
;==  
}>> 
}?? 
instanceAA 
=AA 
nullAA 
;AA 
returnBB 
falseBB 
;BB 
}CC 	
privateEE 
staticEE 
boolEE 

SkipFilterEE &
(EE& '&
ControllerActionDescriptorEE' A
actionDescriptorEEB R
)EER S
{FF 	
ifGG 
(GG 
actionDescriptorGG  
==GG! #
nullGG$ (
)GG( )
returnHH 
falseHH 
;HH 
varJJ 
declaringTypeJJ 
=JJ 
actionDescriptorJJ  0
.JJ0 1

MethodInfoJJ1 ;
.JJ; <
DeclaringTypeJJ< I
;JJI J
returnKK 
declaringTypeKK  
!=KK! #
nullKK$ (
&&KK) +
declaringTypeKK, 9
.KK9 :
CustomAttributesKK: J
.KKJ K
AnyKKK N
(KKN O
caKKO Q
=>KKR T
caKKU W
.KKW X
AttributeTypeKKX e
==KKf h
typeofKKi o
(KKo p(
BypassInstanceContextFilter	KKp �
)
KK� �
)
KK� �
;
KK� �
}LL 	
privateNN 
boolNN '
IsUserAuthorizedForInstanceNN 0
(NN0 1
intNN1 4

instanceIdNN5 ?
,NN? @
stringNNA G
userIdNNH N
)NNN O
{OO 	
returnPP &
_adminAppIdentityDbContextPP -
.PP- .
UserOdsInstancesPP. >
.PP> ?
AnyPP? B
(PPB C
xQQ 
=>QQ 
xRR 
.RR 
OdsInstanceIdRR #
==RR$ &

instanceIdRR' 1
&&SS 
xSS 
.SS 
UserIdSS 
==SS  "
userIdSS# )
)SS) *
;SS* +
}TT 	
}UU 
}VV �
aC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\JsonValidationFilter.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{ 
public 

class  
JsonValidationFilter %
:& '!
ActionFilterAttribute( =
{ 
public 
override 
void 
OnActionExecuting .
(. /"
ActionExecutingContext/ E
filterContextF S
)S T
{ 	
var 
request 
= 
filterContext '
.' (
HttpContext( 3
.3 4
Request4 ;
;; <
var 

modelState 
= 
filterContext *
.* +

ModelState+ 5
;5 6
var 
requestMethod 
= 
request  '
.' (
Method( .
;. /
if 
( 
requestMethod 
!=  
$str! '
||( *

modelState+ 5
.5 6
IsValid6 =
)= >
return 
; 
if 
( 
request 
. 
IsAjaxRequest %
(% &
)& '
)' (
{ 
var 
result 
= 
new  
ContentResult! .
(. /
)/ 0
;0 1
var 
content 
= 
JsonConvert )
.) *
SerializeObject* 9
(9 :

modelState: D
,D E
new "
JsonSerializerSettings .
{ !
ReferenceLoopHandling -
=. /!
ReferenceLoopHandling0 E
.E F
IgnoreF L
} 
) 
; 
result   
.   
Content   
=    
content  ! (
;  ( )
result!! 
.!! 
ContentType!! "
=!!# $
$str!!% 7
;!!7 8
filterContext## 
.## 
HttpContext## )
.##) *
Response##* 2
.##2 3

StatusCode##3 =
=##> ?
$num##@ C
;##C D
filterContext$$ 
.$$ 
Result$$ $
=$$% &
result$$' -
;$$- .
}%% 
}&& 	
}'' 
}(( �)
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\OpenIdConnectUserContextFilter.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{ 
public 

class *
OpenIdConnectUserContextFilter /
:0 1 
IAuthorizationFilter2 F
{ 
private 
readonly 
AdminAppUserContext ,
_userContext- 9
;9 :
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
private 
readonly 
IdentitySettings )
_identitySettings* ;
;; <
public *
OpenIdConnectUserContextFilter -
(- .
AdminAppUserContext. A
userContextB M
,M N%
AdminAppIdentityDbContextO h
identityi q
,q r
IOptionss {
<{ |
IdentitySettings	| �
>
� �
identitySettings
� �
)
� �
{ 	
_userContext 
= 
userContext &
;& '
	_identity 
= 
identity  
;  !
_identitySettings 
= 
identitySettings  0
.0 1
Value1 6
;6 7
} 	
public   
void   
OnAuthorization   #
(  # $&
AuthorizationFilterContext  $ >
filterContext  ? L
)  L M
{!! 	
var"" 

providerId"" 
="" 
filterContext"" *
.""* +
HttpContext""+ 6
.""6 7
User""7 ;
.""; <
FindFirstValue""< J
(""J K

ClaimTypes""K U
.""U V
NameIdentifier""V d
)""d e
;""e f
var## 
	userLogin## 
=## 
	_identity## %
.##% &

UserLogins##& 0
.##0 1
SingleOrDefault##1 @
(##@ A
x$$ 
=>$$ 
x$$ 
.$$ 
LoginProvider$$ $
==$$% '
_identitySettings$$( 9
.$$9 :
OpenIdSettings$$: H
.$$H I
LoginProvider$$I V
&&$$W Y
x%% 
.%% 
ProviderKey%% "
==%%# %

providerId%%& 0
)%%0 1
;%%1 2
if'' 
('' 

providerId'' 
=='' 
null'' "
||''# %
	userLogin''& /
==''0 2
null''3 7
)''7 8
{(( 
return)) 
;)) 
}** 
var,, 
user,, 
=,, 
	_identity,,  
.,,  !
Users,,! &
.,,& '
SingleOrDefault,,' 6
(,,6 7
x,,7 8
=>,,9 ;
x,,< =
.,,= >
Id,,> @
==,,A C
	userLogin,,D M
.,,M N
UserId,,N T
),,T U
;,,U V
if.. 
(.. 
user.. 
==.. 
null.. 
).. 
{// 
return00 
;00 
}11 
_userContext33 
.33 
User33 
=33 
user33  $
;33$ %
var44 
	userRoles44 
=44 
	_identity44 %
.44% &
	UserRoles44& /
.44/ 0
Where440 5
(445 6
x446 7
=>448 :
x44; <
.44< =
UserId44= C
==44D F
user44G K
.44K L
Id44L N
)44N O
.44O P
ToArray44P W
(44W X
)44X Y
;44Y Z
_userContext55 
.55 
Permissions55 $
=55% &
PopulatePermissions55' :
(55: ;
	userRoles55; D
)55D E
;55E F
}66 	
private88 
static88 

Permission88 !
[88! "
]88" #
PopulatePermissions88$ 7
(887 8
IEnumerable888 C
<88C D
IdentityUserRole88D T
<88T U
string88U [
>88[ \
>88\ ]
	userRoles88^ g
)88g h
{99 	
IEnumerable:: 
<:: 

Permission:: "
>::" #
permissions::$ /
=::0 1
new::2 5

Permission::6 @
[::@ A
]::A B
{::C D
}::E F
;::F G
permissions;; 
=;; 
	userRoles;; #
.;;# $
	Aggregate;;$ -
(;;- .
permissions;;. 9
,;;9 :
(;;; <
current;;< C
,;;C D
userRole;;E M
);;M N
=>;;O Q
current;;R Y
.;;Y Z
Union;;Z _
(;;_ `
RolePermission;;` n
.;;n o
GetPermissions;;o }
(;;} ~
userRole	;;~ �
.
;;� �
RoleId
;;� �
)
;;� �
)
;;� �
)
;;� �
;
;;� �
return<< 
permissions<< 
.<< 
ToArray<< &
(<<& '
)<<' (
;<<( )
}== 	
}>> 
}?? �
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\PasswordChangeRequiredFilter.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{ 
public 

class (
PasswordChangeRequiredFilter -
:. /
IAsyncActionFilter0 B
{ 
private 
readonly 
UserManager $
<$ %
AdminAppUser% 1
>1 2
_userManager3 ?
;? @
public (
PasswordChangeRequiredFilter +
(+ ,
UserManager, 7
<7 8
AdminAppUser8 D
>D E
userManagerF Q
)Q R
{ 	
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task "
OnActionExecutionAsync 0
(0 1"
ActionExecutingContext1 G
filterContextH U
,U V#
ActionExecutionDelegateW n
nexto s
)s t
{ 	
if 
( 
! "
ShouldBypassThisFilter '
(' (
filterContext( 5
)5 6
)6 7
{ 
if 
( 
await $
IsPasswordChangeRequired 2
(2 3
filterContext3 @
)@ A
)A B
{ 
filterContext !
.! "
Result" (
=) *
RouteHelpers   $
.  $ %!
RedirectToActionRoute  % :
<  : ;
IdentityController  ; M
>  M N
(  N O
x  O P
=>  Q S
x  T U
.  U V
ChangePassword  V d
(  d e
)  e f
)  f g
;  g h
return"" 
;"" 
}## 
}$$ 
await&& 
next&& 
(&& 
)&& 
;&& 
}'' 	
private)) 
bool)) "
ShouldBypassThisFilter)) +
())+ ,"
ActionExecutingContext)), B
filterContext))C P
)))P Q
{** 	
return++ 
filterContext++  
.++  !

Controller++! +
.+++ ,
GetType++, 3
(++3 4
)++4 5
.++5 6
GetAttribute++6 B
<++B C7
+BypassPasswordChangeRequiredFilterAttribute++C n
>++n o
(++o p
)++p q
!=++r t
null++u y
;++y z
},, 	
private.. 
async.. 
Task.. 
<.. 
bool.. 
>..  $
IsPasswordChangeRequired..! 9
(..9 :"
ActionExecutingContext..: P
filterContext..Q ^
)..^ _
{// 	
var00 
user00 
=00 
await00 
_userManager00 )
.00) *
GetUserAsync00* 6
(006 7
filterContext007 D
.00D E
HttpContext00E P
.00P Q
User00Q U
)00U V
;00V W
return11 
user11 
!=11 
null11 
&&11  "
user11# '
.11' (!
RequirePasswordChange11( =
;11= >
}22 	
}33 
}44 �	
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\PermissionRequiredAttribute.cs
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
 
Web

 
.

  
ActionFilters

  -
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
,D E
AllowMultipleF S
=T U
trueV Z
)Z [
][ \
public 

class '
PermissionRequiredAttribute ,
:- .
TypeFilterAttribute/ B
{ 
public '
PermissionRequiredAttribute *
(* +

Permission+ 5

permission6 @
)@ A
: 
base 
( 
typeof 
( $
PermissionRequiredFilter 2
)2 3
)3 4
{ 	
	Arguments 
= 
new 
object "
[" #
]# $
{% &

permission' 1
}2 3
;3 4
} 	
} 
} �
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\PermissionRequiredFilter.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{ 
public 

class $
PermissionRequiredFilter )
:* + 
IAuthorizationFilter, @
{ 
private 
readonly 

Permission #
_permission$ /
;/ 0
private 
readonly 
AdminAppUserContext ,
_userContext- 9
;9 :
public $
PermissionRequiredFilter '
(' (

Permission( 2

permission3 =
,= >
AdminAppUserContext? R
userContextS ^
)^ _
{ 	
_permission 
= 

permission $
;$ %
_userContext 
= 
userContext &
;& '
} 	
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
context? F
)F G
{ 	
if 
( 
! 
_userContext 
. 
Has !
(! "
_permission" -
)- .
). /
context 
. 
Result 
=  
new! $
ForbidResult% 1
(1 2
)2 3
;3 4
} 	
} 
} �
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\SetupRequiredFilter.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{ 
public 

class 
SetupRequiredFilter $
:% &!
ActionFilterAttribute' <
{ 
private 
readonly 
AdminAppDbContext *
	_database+ 4
;4 5
public 
SetupRequiredFilter "
(" #
AdminAppDbContext# 4
database5 =
)= >
{ 	
	_database 
= 
database  
;  !
} 	
public 
override 
void 
OnActionExecuting .
(. /"
ActionExecutingContext/ E
filterContextF S
)S T
{ 	
if 
( "
ShouldBypassThisFilter &
(& '
filterContext' 4
)4 5
)5 6
return 
; 
filterContext 
. 
Result  
=! "
RouteHelpers# /
./ 0!
RedirectToActionRoute0 E
<E F
SetupControllerF U
>U V
(V W
xW X
=>Y [
x\ ]
.] ^
PostUpdateSetup^ m
(m n
)n o
)o p
;p q
} 	
private 
bool "
ShouldBypassThisFilter +
(+ ,"
ActionExecutingContext, B
filterContextC P
)P Q
{   	
return!! 
filterContext!!  
.!!  !

Controller!!! +
.!!+ ,
GetType!!, 3
(!!3 4
)!!4 5
.!!5 6
GetAttribute!!6 B
<!!B C.
"BypassSetupRequiredFilterAttribute!!C e
>!!e f
(!!f g
)!!g h
!=!!i k
null!!l p
||"" *
GeneralFirstTimeSetUpCompleted"" 1
(""1 2
)""2 3
;""3 4
}## 	
private%% 
bool%% *
GeneralFirstTimeSetUpCompleted%% 3
(%%3 4
)%%4 5
{&& 	
{'' 
var(( *
generalFirstTimeSetUpCompleted(( 2
=((3 4
	_database((5 >
.))9 :%
ApplicationConfigurations)): S
.**9 :
SingleOrDefault**: I
(**I J
)**J K
?**K L
.++9 :#
FirstTimeSetUpCompleted++: Q
??++R T
false++U Z
;++Z [
return-- *
generalFirstTimeSetUpCompleted-- 5
;--5 6
}.. 
}// 	
}00 
}11 �
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\ActionFilters\UserContextFilter.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
ActionFilters  -
{ 
public 

class 
UserContextFilter "
:# $ 
IAuthorizationFilter% 9
{ 
private 
readonly 
AdminAppUserContext ,
_userContext- 9
;9 :
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public 
UserContextFilter  
(  !
AdminAppUserContext! 4
userContext5 @
,@ A%
AdminAppIdentityDbContextB [
identity\ d
)d e
{ 	
_userContext 
= 
userContext &
;& '
	_identity 
= 
identity  
;  !
} 	
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
filterContext? L
)L M
{ 	
var 
userId 
= 
filterContext &
.& '
HttpContext' 2
.2 3
User3 7
.7 8
FindFirstValue8 F
(F G

ClaimTypesG Q
.Q R
NameIdentifierR `
)` a
;a b
var   
user   
=   
	_identity    
.    !
Users  ! &
.  & '
SingleOrDefault  ' 6
(  6 7
x  7 8
=>  9 ;
x  < =
.  = >
Id  > @
==  A C
userId  D J
)  J K
;  K L
if!! 
(!! 
user!! 
==!! 
null!! 
)!! 
{"" 
return## 
;## 
}$$ 
_userContext&& 
.&& 
User&& 
=&& 
user&&  $
;&&$ %
var'' 
	userRoles'' 
='' 
	_identity'' %
.''% &
	UserRoles''& /
.''/ 0
Where''0 5
(''5 6
x''6 7
=>''8 :
x''; <
.''< =
UserId''= C
==''D F
user''G K
.''K L
Id''L N
)''N O
.''O P
ToArray''P W
(''W X
)''X Y
;''Y Z
_userContext(( 
.(( 
Permissions(( $
=((% &
PopulatePermissions((' :
(((: ;
	userRoles((; D
)((D E
;((E F
})) 	
private++ 
static++ 

Permission++ !
[++! "
]++" #
PopulatePermissions++$ 7
(++7 8
IEnumerable++8 C
<++C D
IdentityUserRole++D T
<++T U
string++U [
>++[ \
>++\ ]
	userRoles++^ g
)++g h
{,, 	
IEnumerable-- 
<-- 

Permission-- "
>--" #
permissions--$ /
=--0 1
new--2 5

Permission--6 @
[--@ A
]--A B
{--C D
}--E F
;--F G
permissions.. 
=.. 
	userRoles.. #
...# $
	Aggregate..$ -
(..- .
permissions... 9
,..9 :
(..; <
current..< C
,..C D
userRole..E M
)..M N
=>..O Q
current..R Y
...Y Z
Union..Z _
(.._ `
RolePermission..` n
...n o
GetPermissions..o }
(..} ~
userRole	..~ �
.
..� �
RoleId
..� �
)
..� �
)
..� �
)
..� �
;
..� �
return// 
permissions// 
.// 
ToArray// &
(//& '
)//' (
;//( )
}00 	
}11 
}22 ��
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\ApplicationController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
public 

class !
ApplicationController &
:' (
ControllerBase) 7
{ 
private 
readonly "
IAddApplicationCommand /"
_addApplicationCommand0 F
;F G
private 
readonly %
IDeleteApplicationCommand 2%
_deleteApplicationCommand3 L
;L M
private 
readonly #
IEditApplicationCommand 0#
_editApplicationCommand1 H
;H I
private 
readonly #
GetApplicationByIdQuery 0$
_getApplicationByIdQuery1 I
;I J
private   
readonly   !
IGetAllClaimSetsQuery   ."
_getClaimSetNamesQuery  / E
;  E F
private!! 
readonly!! 
GetProfilesQuery!! )
_getProfilesQuery!!* ;
;!!; <
private"" 
readonly"" 
IGetVendorByIdQuery"" ,
_getVendorByIdQuery""- @
;""@ A
private## 
readonly## 
IMapper##  
_mapper##! (
;##( )
private$$ 
readonly$$  
IOdsApiFacadeFactory$$ - 
_odsApiFacadeFactory$$. B
;$$B C
private%% 
readonly%% 
InstanceContext%% (
_instanceContext%%) 9
;%%9 :
private&& 
readonly&& ,
 RegenerateApiClientSecretCommand&& 9-
!_regenerateApiClientSecretCommand&&: [
;&&[ \
private'' 
readonly'' 
ITabDisplayService'' +
_tabDisplayService'', >
;''> ?
private(( 
readonly(( 0
$IOdsApiConnectionInformationProvider(( =-
!_apiConnectionInformationProvider((> _
;((_ `
private)) 
readonly)) 
IGetVendorsQuery)) )
_getVendorsQuery))* :
;)): ;
private** 
readonly** "
IInferExtensionDetails** /"
_inferExtensionDetails**0 F
;**F G
public,, !
ApplicationController,, $
(,,$ %
IMapper,,% ,
mapper,,- 3
,-- %
IDeleteApplicationCommand-- '$
deleteApplicationCommand--( @
,.. "
IAddApplicationCommand.. $!
addApplicationCommand..% :
,// #
IEditApplicationCommand// %"
editApplicationCommand//& <
,00 #
GetApplicationByIdQuery00 %#
getApplicationByIdQuery00& =
,11 
IGetVendorByIdQuery11 !
getVendorByIdQuery11" 4
,22 !
IGetAllClaimSetsQuery22 #!
getClaimSetNamesQuery22$ 9
,33 
GetProfilesQuery33 
getProfilesQuery33 /
,44 ,
 RegenerateApiClientSecretCommand44 .,
 regenerateApiClientSecretCommand44/ O
,55  
IOdsApiFacadeFactory55 "
odsApiFacadeFactory55# 6
,66 
InstanceContext66 
instanceContext66 -
,77 
ITabDisplayService77  
tabDisplayService77! 2
,88 0
$IOdsApiConnectionInformationProvider88 2,
 apiConnectionInformationProvider883 S
,99 
IGetVendorsQuery99 
getVendorsQuery99 .
,:: "
IInferExtensionDetails:: $!
inferExtensionDetails::% :
)::: ;
{;; 	
_mapper<< 
=<< 
mapper<< 
;<< %
_deleteApplicationCommand== %
===& '$
deleteApplicationCommand==( @
;==@ A"
_addApplicationCommand>> "
=>># $!
addApplicationCommand>>% :
;>>: ;#
_editApplicationCommand?? #
=??$ %"
editApplicationCommand??& <
;??< =$
_getApplicationByIdQuery@@ $
=@@% &#
getApplicationByIdQuery@@' >
;@@> ?
_getVendorByIdQueryAA 
=AA  !
getVendorByIdQueryAA" 4
;AA4 5"
_getClaimSetNamesQueryBB "
=BB# $!
getClaimSetNamesQueryBB% :
;BB: ;
_getProfilesQueryCC 
=CC 
getProfilesQueryCC  0
;CC0 1-
!_regenerateApiClientSecretCommandDD -
=DD. /,
 regenerateApiClientSecretCommandDD0 P
;DDP Q 
_odsApiFacadeFactoryEE  
=EE! "
odsApiFacadeFactoryEE# 6
;EE6 7
_instanceContextFF 
=FF 
instanceContextFF .
;FF. /
_tabDisplayServiceGG 
=GG  
tabDisplayServiceGG! 2
;GG2 3-
!_apiConnectionInformationProviderHH -
=HH. /,
 apiConnectionInformationProviderHH0 P
;HHP Q
_getVendorsQueryII 
=II 
getVendorsQueryII .
;II. /"
_inferExtensionDetailsJJ "
=JJ# $!
inferExtensionDetailsJJ% :
;JJ: ;
}KK 	
publicNN 
asyncNN 
TaskNN 
<NN 
ActionResultNN &
>NN& '
IndexNN( -
(NN- .
)NN. /
{OO 	
varPP 
apiUrlPP 
=PP 
(PP 
awaitPP -
!_apiConnectionInformationProviderPP  A
.PPA B2
&GetConnectionInformationForEnvironmentPPB h
(PPh i
)PPi j
)PPj k
.QQ 
ApiServerUrlQQ 
;QQ 
varSS 
modelSS 
=SS 
newSS "
ApplicationsIndexModelSS 2
{TT .
"OdsInstanceSettingsTabEnumerationsUU 2
=UU3 4
_tabDisplayServiceVV &
.VV& ',
 GetOdsInstanceSettingsTabDisplayVV' G
(VVG H-
!OdsInstanceSettingsTabEnumerationVVH i
.VVi j
ApplicationsVVj v
)VVv w
,VVw x
OdsInstanceWW 
=WW 
_instanceContextWW .
,WW. /
DisplayApiUrlXX 
=XX 
GetApiUrlForDisplayXX  3
(XX3 4
apiUrlXX4 :
)XX: ;
}YY 
;YY 
return[[ 
View[[ 
([[ 
$str[[ 
,[[  
model[[! &
)[[& '
;[[' (
}\\ 	
public^^ 
async^^ 
Task^^ 
<^^ 
ActionResult^^ &
>^^& '
ApplicationList^^( 7
(^^7 8
int^^8 ;

pageNumber^^< F
)^^F G
{__ 	
var`` 
edOrgs`` 
=`` 
(`` 
await``  
_odsApiFacadeFactory``  4
.``4 5
Create``5 ;
(``; <
)``< =
)``= >
.aa (
GetAllEducationOrganizationsaa -
(aa- .
_mapperaa. 5
)aa5 6
;aa6 7
varcc 
vendorsIndexModelcc !
=cc" #
newcc$ '(
VendorApplicationsIndexModelcc( D
{dd 
Vendorsee 
=ee 
Pageee 
<ee #
VendorApplicationsModelee 6
>ee6 7
.ee7 8
Fetchee8 =
(ee= >$
VendorsApplicationsModelee> V
,eeV W

pageNumbereeX b
)eeb c
}ff 
;ff 
returnhh 
PartialViewhh 
(hh 
$strhh .
,hh. /
vendorsIndexModelhh0 A
)hhA B
;hhB C
Listjj 
<jj #
VendorApplicationsModeljj (
>jj( )$
VendorsApplicationsModeljj* B
(jjB C
intjjC F
offsetjjG M
,jjM N
intjjO R
limitjjS X
)jjX Y
{kk 
varll 
vendorsll 
=ll 
_getVendorsQueryll .
.ll. /
Executell/ 6
(ll6 7
offsetll7 =
,ll= >
limitll? D
)llD E
.llE F
ToListllF L
(llL M
)llM N
;llN O
varnn $
vendorsApplicationsModelnn ,
=nn- .
_mappernn/ 6
.nn6 7
Mapnn7 :
<nn: ;
Listnn; ?
<nn? @#
VendorApplicationsModelnn@ W
>nnW X
>nnX Y
(nnY Z
vendorsoo 
,oo 
optsoo !
=>oo" $
optsoo% )
.oo) *&
WithEducationOrganizationsoo* D
(ooD E
edOrgsooE K
)ooK L
)ooL M
;ooM N
foreachqq 
(qq 
varqq 
modelqq "
inqq# %$
vendorsApplicationsModelqq& >
)qq> ?
{rr .
"FilterInstanceSpecificApplicationsss 6
(ss6 7
modelss7 <
)ss< =
;ss= >
}tt 
returnvv $
vendorsApplicationsModelvv /
;vv/ 0
}ww 
}xx 	
privatezz 
voidzz .
"FilterInstanceSpecificApplicationszz 7
(zz7 8#
VendorApplicationsModelzz8 O
vendorzzP V
)zzV W
{{{ 	
var|| 
applications|| 
=|| 
vendor|| %
.||% &
Applications||& 2
.||2 3
Where||3 8
(||8 9
x||9 :
=>||; =
x}} 
.}} 
OdsInstanceName}} %
.}}% &
Equals}}& ,
(}}, -
_instanceContext}}- =
.}}= >
Name}}> B
,}}B C
StringComparison}}D T
.}}T U&
InvariantCultureIgnoreCase}}U o
)}}o p
)}}p q
.~~ 
ToList~~ 
(~~ 
)~~ 
;~~ 
vendor 
. 
Applications 
=  !
applications" .
;. /
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
Add
��( +
(
��+ ,
int
��, /
vendorId
��0 8
)
��8 9
{
�� 	
var
�� 
	apiFacade
�� 
=
�� 
await
�� !"
_odsApiFacadeFactory
��" 6
.
��6 7
Create
��7 =
(
��= >
)
��> ?
;
��? @
var
�� 
vendor
�� 
=
�� !
_getVendorByIdQuery
�� ,
.
��, -
Execute
��- 4
(
��4 5
vendorId
��5 =
)
��= >
;
��> ?
var
�� 
psis
�� 
=
�� 
	apiFacade
��  
.
��  !-
GetAllPostSecondaryInstitutions
��! @
(
��@ A
)
��A B
.
��B C
ToList
��C I
(
��I J
)
��J K
;
��K L
var
�� 
schools
�� 
=
�� 
	apiFacade
�� #
.
��# $
GetAllSchools
��$ 1
(
��1 2
)
��2 3
.
��3 4
ToList
��4 :
(
��: ;
)
��; <
;
��< =
var
�� 
profiles
�� 
=
�� 
_mapper
�� "
.
��" #
Map
��# &
<
��& '
List
��' +
<
��+ ,
ProfileModel
��, 8
>
��8 9
>
��9 :
(
��: ;
_getProfilesQuery
��; L
.
��L M
Execute
��M T
(
��T U
)
��U V
)
��V W
;
��W X
var
�� 
leas
�� 
=
�� 
	apiFacade
��  
.
��  !*
GetAllLocalEducationAgencies
��! =
(
��= >
)
��> ?
.
��? @
ToList
��@ F
(
��F G
)
��G H
;
��H I
var
�� 
model
�� 
=
�� 
new
�� %
AddApplicationViewModel
�� 3
{
�� 
VendorId
�� 
=
�� 
vendorId
�� #
,
��# $

VendorName
�� 
=
�� 
vendor
�� #
.
��# $

VendorName
��$ .
,
��. /$
LocalEducationAgencies
�� &
=
��' (
leas
��) -
,
��- .'
PostSecondaryInstitutions
�� )
=
��* +
psis
��, 0
,
��0 1
Schools
�� 
=
�� 
schools
�� !
,
��! "
ClaimSetNames
�� 
=
�� 
GetClaimSetNames
��  0
(
��0 1
)
��1 2
,
��2 3
Profiles
�� 
=
�� 
profiles
�� #
,
��# $
TpdmEnabled
�� 
=
�� 
await
�� #
TpdmEnabled
��$ /
(
��/ 0
)
��0 1
}
�� 
;
�� 
return
�� 
PartialView
�� 
(
�� 
$str
�� 5
,
��5 6
model
��7 <
)
��< =
;
��= >
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
Add
�� 
(
��  !
AddApplicationModel
��  3
model
��4 9
)
��9 :
{
�� 	
var
�� 
result
�� 
=
�� $
_addApplicationCommand
�� /
.
��/ 0
Execute
��0 7
(
��7 8
model
��8 =
)
��= >
;
��> ?
var
�� 
apiUrl
�� 
=
�� 6
(CloudOdsApiConnectionInformationProvider
�� A
.
��A B4
&GetConnectionInformationForEnvironment
��B h
(
��h i
new
�� 
OdsApiCredential
�� $
(
��$ %
result
��% +
.
��+ ,
Key
��, /
,
��/ 0
result
��1 7
.
��7 8
Secret
��8 >
)
��> ?
)
��? @
.
��@ A

ApiBaseUrl
��A K
;
��K L
return
�� 
PartialView
�� 
(
�� 
$str
�� 1
,
��1 2
new
��3 6!
ApplicationKeyModel
��7 J
{
�� 
ApplicationName
�� #
=
��$ %
model
��& +
.
��+ ,
ApplicationName
��, ;
,
��; <
Key
�� 
=
�� 
result
��  
.
��  !
Key
��! $
,
��$ %
Secret
�� 
=
�� 
result
�� #
.
��# $
Secret
��$ *
,
��* +
DisplayApiUrl
�� !
=
��" #!
GetApiUrlForDisplay
��$ 7
(
��7 8
apiUrl
��8 >
)
��> ?
}
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
Delete
�� "
(
��" #$
DeleteApplicationModel
��# 9
model
��: ?
)
��? @
{
�� 	
try
�� 
{
�� '
_deleteApplicationCommand
�� )
.
��) *
Execute
��* 1
(
��1 2
model
��2 7
.
��7 8
ApplicationId
��8 E
)
��E F
;
��F G
return
�� 
JsonSuccess
�� "
(
��" #
$str
��# E
)
��E F
;
��F G
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
	JsonError
��  
(
��  !
ex
��! #
.
��# $
Message
��$ +
)
��+ ,
;
��, -
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
Edit
��( ,
(
��, -
int
��- 0
applicationId
��1 >
)
��> ?
{
�� 	
var
�� 
application
�� 
=
�� &
_getApplicationByIdQuery
�� 6
.
��6 7
Execute
��7 >
(
��> ?
applicationId
��? L
)
��L M
;
��M N
var
�� 
	apiFacade
�� 
=
�� 
await
�� !"
_odsApiFacadeFactory
��" 6
.
��6 7
Create
��7 =
(
��= >
)
��> ?
;
��? @
var
�� 
psis
�� 
=
�� 
	apiFacade
��  
.
��  !-
GetAllPostSecondaryInstitutions
��! @
(
��@ A
)
��A B
.
��B C
ToList
��C I
(
��I J
)
��J K
;
��K L
var
�� 
leas
�� 
=
�� 
	apiFacade
��  
.
��  !*
GetAllLocalEducationAgencies
��! =
(
��= >
)
��> ?
.
��? @
ToList
��@ F
(
��F G
)
��G H
;
��H I
var
�� 
schools
�� 
=
�� 
	apiFacade
�� #
.
��# $
GetAllSchools
��$ 1
(
��1 2
)
��2 3
.
��3 4
ToList
��4 :
(
��: ;
)
��; <
;
��< =
var
�� 
profiles
�� 
=
�� 
_mapper
�� "
.
��" #
Map
��# &
<
��& '
List
��' +
<
��+ ,
ProfileModel
��, 8
>
��8 9
>
��9 :
(
��: ;
_getProfilesQuery
��; L
.
��L M
Execute
��M T
(
��T U
)
��U V
)
��V W
;
��W X
var
�� &
educationOrganizationIds
�� (
=
��) *
application
�� 
.
�� /
!ApplicationEducationOrganizations
�� =
.
��= >
Select
��> D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L%
EducationOrganizationId
��L c
)
��c d
.
��d e
ToList
��e k
(
��k l
)
��l m
;
��m n
var
�� 
	edOrgType
�� 
=
�� 
schools
�� #
.
��# $
Any
��$ '
(
��' (
x
��( )
=>
��* ,&
educationOrganizationIds
��- E
.
��E F
Contains
��F N
(
��N O
x
��O P
.
��P Q%
EducationOrganizationId
��Q h
)
��h i
)
��i j
?
�� 2
$ApplicationEducationOrganizationType
�� 6
.
��6 7
School
��7 =
:
�� 
psis
�� 
.
�� 
Any
�� 
(
�� 
x
�� 
=>
�� &
educationOrganizationIds
��  8
.
��8 9
Contains
��9 A
(
��A B
x
��B C
.
��C D%
EducationOrganizationId
��D [
)
��[ \
)
��\ ]
?
�� 2
$ApplicationEducationOrganizationType
�� :
.
��: ;&
PostSecondaryInstitution
��; S
:
�� 2
$ApplicationEducationOrganizationType
�� :
.
��: ;"
LocalEducationAgency
��; O
;
��P Q
var
�� 
model
�� 
=
�� 
new
�� &
EditApplicationViewModel
�� 4
{
�� 
ApplicationId
�� 
=
�� 
applicationId
��  -
,
��- .
ApplicationName
�� 
=
��  !
application
��" -
.
��- .
ApplicationName
��. =
,
��= >
ClaimSetName
�� 
=
�� 
application
�� *
.
��* +
ClaimSetName
��+ 7
,
��7 8
ClaimSetNames
�� 
=
�� 
GetClaimSetNames
��  0
(
��0 1
)
��1 2
,
��2 3&
EducationOrganizationIds
�� (
=
��) *
application
��+ 6
.
��6 7/
!ApplicationEducationOrganizations
��7 X
.
��X Y
Select
��Y _
(
��_ `
x
��` a
=>
��b d
x
��e f
.
��f g%
EducationOrganizationId
��g ~
)
��~ 
,�� �$
LocalEducationAgencies
�� &
=
��' (
leas
��) -
,
��- .'
PostSecondaryInstitutions
�� )
=
��* +
psis
��, 0
,
��0 1
Schools
�� 
=
�� 
schools
�� !
,
��! "
	ProfileId
�� 
=
�� 
application
�� '
.
��' (
Profiles
��( 0
.
��0 1
FirstOrDefault
��1 ?
(
��? @
)
��@ A
?
��A B
.
��B C
	ProfileId
��C L
??
��M O
$num
��P Q
,
��Q R
Profiles
�� 
=
�� 
profiles
�� #
,
��# $
VendorId
�� 
=
�� 
application
�� &
.
��& '
Vendor
��' -
.
��- .
VendorId
��. 6
,
��6 7'
EducationOrganizationType
�� )
=
��* +
	edOrgType
��, 5
,
��5 6
TpdmEnabled
�� 
=
�� 
await
�� #
TpdmEnabled
��$ /
(
��/ 0
)
��0 1
}
�� 
;
�� 
return
�� 
PartialView
�� 
(
�� 
$str
�� 6
,
��6 7
model
��8 =
)
��= >
;
��> ?
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
Edit
��  
(
��  !"
EditApplicationModel
��! 5
model
��6 ;
)
��; <
{
�� 	
try
�� 
{
�� %
_editApplicationCommand
�� '
.
��' (
Execute
��( /
(
��/ 0
model
��0 5
)
��5 6
;
��6 7
return
�� 
JsonSuccess
�� "
(
��" #
$str
��# E
)
��E F
;
��F G
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
	JsonError
��  
(
��  !
ex
��! #
.
��# $
Message
��$ +
)
��+ ,
;
��, -
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
RegenerateSecret
�� ,
(
��, -#
RegenerateSecretModel
��- B
model
��C H
)
��H I
{
�� 	
var
��  
regenerationResult
�� "
=
��# $/
!_regenerateApiClientSecretCommand
��% F
.
��F G
Execute
��G N
(
��N O
model
��O T
.
��T U
ApplicationId
��U b
)
��b c
;
��c d
var
�� 
application
�� 
=
��  
regenerationResult
�� 0
.
��0 1
Application
��1 <
;
��< =
var
�� 
apiUrl
�� 
=
�� 6
(CloudOdsApiConnectionInformationProvider
�� A
.
��A B4
&GetConnectionInformationForEnvironment
��B h
(
��h i
new
�� 
OdsApiCredential
�� $
(
��$ % 
regenerationResult
��% 7
.
��7 8
Key
��8 ;
,
��; < 
regenerationResult
��= O
.
��O P
Secret
��P V
)
��V W
)
��W X
.
��X Y

ApiBaseUrl
��Y c
;
��c d
return
�� 
PartialView
�� 
(
�� 
$str
�� @
,
��@ A
new
��B E!
ApplicationKeyModel
��F Y
{
�� 
ApplicationName
�� 
=
��  !
application
��" -
.
��- .
ApplicationName
��. =
,
��= >
Key
�� 
=
��  
regenerationResult
�� (
.
��( )
Key
��) ,
,
��, -
Secret
�� 
=
��  
regenerationResult
�� +
.
��+ ,
Secret
��, 2
,
��2 3
DisplayApiUrl
�� 
=
�� !
GetApiUrlForDisplay
��  3
(
��3 4
apiUrl
��4 :
)
��: ;
}
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
List
�� 
<
�� 
string
�� 
>
�� 
GetClaimSetNames
�� -
(
��- .
)
��. /
{
�� 	
return
�� $
_getClaimSetNamesQuery
�� )
.
��) *
Execute
��* 1
(
��1 2
)
��2 3
.
��3 4
Select
��4 :
(
��: ;
x
��; <
=>
��= ?
x
��@ A
.
��A B
Name
��B F
)
��F G
.
��G H
Except
��H N
(
��N O
CloudOdsAdminApp
��O _
.
��_ `%
SystemReservedClaimSets
��` w
)
��w x
.
��x y
ToList
��y 
(�� �
)��� �
;��� �
}
�� 	
private
�� 
static
�� 
string
�� !
GetApiUrlForDisplay
�� 1
(
��1 2
string
��2 8
apiUrl
��9 ?
)
��? @
{
�� 	
return
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� (
(
��( )&
CloudOdsAdminAppSettings
��) A
.
��A B
Instance
��B J
.
��J K
ApiExternalUrl
��K Y
)
��Y Z
?
�� 
apiUrl
�� 
.
�� 
Replace
��  
(
��  !&
CloudOdsAdminAppSettings
��! 9
.
��9 :
Instance
��: B
.
��B C
ProductionApiUrl
��C S
,
��S T&
CloudOdsAdminAppSettings
��U m
.
��m n
Instance
��n v
.
��v w
ApiExternalUrl��w �
)��� �
:
�� 
apiUrl
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
TpdmEnabled
��! ,
(
��, -
)
��- .
{
�� 	
var
�� 
versionDetails
�� 
=
��  
await
��! &
InMemoryCache
��' 4
.
��4 5
Instance
��5 =
.
��= >
GetOrSet
��> F
(
��F G
$str
�� &
,
��& '
async
��( -
(
��. /
)
��/ 0
=>
��1 3
await
�� $
_inferExtensionDetails
�� 0
.
��0 1"
TpdmExtensionVersion
��1 E
(
��E F&
CloudOdsAdminAppSettings
�� 0
.
��0 1
Instance
��1 9
.
��9 :
ProductionApiUrl
��: J
)
��J K
)
��K L
;
��L M
return
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� (
(
��( )
versionDetails
��) 7
.
��7 8
TpdmVersion
��8 C
)
��C D
;
��D E
}
�� 	
}
�� 
}�� ��
^C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\ClaimSetsController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ '
BypassInstanceContextFilter  
]  !
[ 
PermissionRequired 
( 

Permission "
." # 
AccessGlobalSettings# 7
)7 8
]8 9
public 

class 
ClaimSetsController $
:% &
ControllerBase' 5
{ 
private 
readonly !
IGetClaimSetByIdQuery .!
_getClaimSetByIdQuery/ D
;D E
private 
readonly -
!IGetApplicationsByClaimSetIdQuery :-
!_getApplicationsByClaimSetIdQuery; \
;\ ]
private   
readonly   *
IGetResourcesByClaimSetIdQuery   7*
_getResourcesByClaimSetIdQuery  8 V
;  V W
private!! 
readonly!! /
#IGetClaimSetsByApplicationNameQuery!! </
#_getClaimSetsByApplicationNameQuery!!= `
;!!` a
private"" 
readonly"" 4
(IGetAuthStrategiesByApplicationNameQuery"" A4
(_getAuthStrategiesByApplicationNameQuery""B j
;""j k
private## 
readonly## 
ITabDisplayService## +
_tabDisplayService##, >
;##> ?
private$$ 
readonly$$  
ICopyClaimSetCommand$$ - 
_copyClaimSetCommand$$. B
;$$B C
private%% 
readonly%% 
AddClaimSetCommand%% +
_addClaimSetCommand%%, ?
;%%? @
private&& 
readonly&&  
IEditClaimSetCommand&& - 
_editClaimSetCommand&&. B
;&&B C
private'' 
readonly'' #
IGetResourceClaimsQuery'' 0#
_getResourceClaimsQuery''1 H
;''H I
private(( 
readonly(( 0
$GetChildResourceClaimsForParentQuery(( =1
%_getChildResourceClaimsForParentQuery((> c
;((c d
private)) 
readonly)) "
IDeleteClaimSetCommand)) /"
_deleteClaimSetCommand))0 F
;))F G
private** 
readonly** )
EditResourceOnClaimSetCommand** 6*
_editResourceOnClaimSetCommand**7 U
;**U V
private++ 
readonly++ +
DeleteResourceOnClaimSetCommand++ 8,
 _deleteResourceOnClaimSetCommand++9 Y
;++Y Z
private,, 
readonly,, %
ClaimSetFileImportCommand,, 2&
_claimSetFileImportCommand,,3 M
;,,M N
private-- 
readonly-- %
ClaimSetFileExportCommand-- 2&
_claimSetFileExportCommand--3 M
;--M N
private.. 
readonly.. 7
+OverrideDefaultAuthorizationStrategyCommand.. D8
,_overrideDefaultAuthorizationStrategyCommand..E q
;..q r
private// 
readonly// -
!ResetToDefaultAuthStrategyCommand// :.
"_resetToDefaultAuthStrategyCommand//; ]
;//] ^
public11 
ClaimSetsController11 "
(11" #!
IGetClaimSetByIdQuery11# 8 
getClaimSetByIdQuery119 M
,22 -
!IGetApplicationsByClaimSetIdQuery22 /,
 getApplicationsByClaimSetIdQuery220 P
,33 *
IGetResourcesByClaimSetIdQuery33 ,)
getResourcesByClaimSetIdQuery33- J
,44 /
#IGetClaimSetsByApplicationNameQuery44 1.
"getClaimSetsByApplicationNameQuery442 T
,55 4
(IGetAuthStrategiesByApplicationNameQuery55 63
'getAuthStrategiesByApplicationNameQuery557 ^
,66 
ITabDisplayService66  
tabDisplayService66! 2
,77  
ICopyClaimSetCommand77 "
copyClaimSetCommand77# 6
,88 
AddClaimSetCommand88  
addClaimSetCommand88! 3
,99  
IEditClaimSetCommand99 "
editClaimSetCommand99# 6
,:: #
IGetResourceClaimsQuery:: %"
getResourceClaimsQuery::& <
,;; 0
$GetChildResourceClaimsForParentQuery;; 20
$getChildResourceClaimsForParentQuery;;3 W
,<< "
IDeleteClaimSetCommand<< $!
deleteClaimSetCommand<<% :
,== )
EditResourceOnClaimSetCommand== +)
editResourceOnClaimSetCommand==, I
,>> +
DeleteResourceOnClaimSetCommand>> -+
deleteResourceOnClaimSetCommand>>. M
,?? %
ClaimSetFileExportCommand?? '%
claimSetFileExportCommand??( A
,@@ %
ClaimSetFileImportCommand@@ '%
claimSetFileImportCommand@@( A
,AA 7
+OverrideDefaultAuthorizationStrategyCommandAA 97
+overrideDefaultAuthorizationStrategyCommandAA: e
,BB -
!ResetToDefaultAuthStrategyCommandBB /-
!resetToDefaultAuthStrategyCommandBB0 Q
)BBQ R
{CC 	!
_getClaimSetByIdQueryDD !
=DD" # 
getClaimSetByIdQueryDD$ 8
;DD8 9-
!_getApplicationsByClaimSetIdQueryEE -
=EE. /,
 getApplicationsByClaimSetIdQueryEE0 P
;EEP Q*
_getResourcesByClaimSetIdQueryFF *
=FF+ ,)
getResourcesByClaimSetIdQueryFF- J
;FFJ K/
#_getClaimSetsByApplicationNameQueryGG /
=GG0 1.
"getClaimSetsByApplicationNameQueryGG2 T
;GGT U4
(_getAuthStrategiesByApplicationNameQueryHH 4
=HH5 63
'getAuthStrategiesByApplicationNameQueryHH7 ^
;HH^ _
_tabDisplayServiceII 
=II  
tabDisplayServiceII! 2
;II2 3 
_copyClaimSetCommandJJ  
=JJ! "
copyClaimSetCommandJJ# 6
;JJ6 7
_addClaimSetCommandKK 
=KK  !
addClaimSetCommandKK" 4
;KK4 5 
_editClaimSetCommandLL  
=LL! "
editClaimSetCommandLL# 6
;LL6 7!
_getClaimSetByIdQueryMM !
=MM" # 
getClaimSetByIdQueryMM$ 8
;MM8 9#
_getResourceClaimsQueryNN #
=NN$ %"
getResourceClaimsQueryNN& <
;NN< =1
%_getChildResourceClaimsForParentQueryOO 1
=OO2 30
$getChildResourceClaimsForParentQueryOO4 X
;OOX Y"
_deleteClaimSetCommandPP "
=PP# $!
deleteClaimSetCommandPP% :
;PP: ;*
_editResourceOnClaimSetCommandQQ *
=QQ+ ,)
editResourceOnClaimSetCommandQQ- J
;QQJ K,
 _deleteResourceOnClaimSetCommandRR ,
=RR- .+
deleteResourceOnClaimSetCommandRR/ N
;RRN O&
_claimSetFileExportCommandSS &
=SS' (%
claimSetFileExportCommandSS) B
;SSB C&
_claimSetFileImportCommandTT &
=TT' (%
claimSetFileImportCommandTT) B
;TTB C8
,_overrideDefaultAuthorizationStrategyCommandUU 8
=UU9 :7
+overrideDefaultAuthorizationStrategyCommandUU; f
;UUf g.
"_resetToDefaultAuthStrategyCommandVV .
=VV/ 0-
!resetToDefaultAuthStrategyCommandVV1 R
;VVR S
}WW 	
publicYY 
ActionResultYY 
ClaimSetDetailsYY +
(YY+ ,
intYY, /

claimSetIdYY0 :
)YY: ;
{ZZ 	
var[[ 
model[[ 
=[[ 
new[[ 
ClaimSetModel[[ )
{\\  
ClaimSetDetailsModel]] $
=]]% &
new]]' * 
ClaimSetDetailsModel]]+ ?
{^^ 
ClaimSet__ 
=__ !
_getClaimSetByIdQuery__ 4
.__4 5
Execute__5 <
(__< =

claimSetId__= G
)__G H
,__H I
Applications``  
=``! "-
!_getApplicationsByClaimSetIdQuery``# D
.``D E
Execute``E L
(``L M

claimSetId``M W
)``W X
,``X Y
ResourceClaimsaa "
=aa# $*
_getResourcesByClaimSetIdQueryaa% C
.aaC D
AllResourcesaaD P
(aaP Q

claimSetIdaaQ [
)aa[ \
}bb 
,bb )
GlobalSettingsTabEnumerationscc -
=cc. /
_tabDisplayServicecc0 B
.ccB C'
GetGlobalSettingsTabDisplayccC ^
(cc^ _(
GlobalSettingsTabEnumerationdd 0
.dd0 1
	ClaimSetsdd1 :
)dd: ;
}ee 
;ee 
returngg 
Viewgg 
(gg 
modelgg 
)gg 
;gg 
}hh 	
publicjj 
ActionResultjj 
AuthStrategyModaljj -
(jj- .
intjj. 1

claimSetIdjj2 <
,jj< =
intjj> A
resourceClaimIdjjB Q
)jjQ R
{kk 	
varll 
modelll 
=ll 
newll #
AuthStrategyEditorModelll 3
{mm 
AuthStrategiesnn 
=nn  *
GetSelectListForAuthStrategiesnn! ?
(nn? @
)nn@ A
,nnA B
ResourceClaimoo 
=oo *
_getResourcesByClaimSetIdQueryoo  >
.oo> ?
SingleResourceoo? M
(ooM N

claimSetIdooN X
,ooX Y
resourceClaimIdooZ i
)ooi j
}pp 
;pp 
returnrr 
PartialViewrr 
(rr 
$strrr 5
,rr5 6
modelrr7 <
)rr< =
;rr= >
}ss 	
publicuu 
stringuu #
GetUpdatedResourceClaimuu -
(uu- .
intuu. 1

claimSetIduu2 <
,uu< =
intuu> A
resourceClaimIduuB Q
)uuQ R
{vv 	
varww 
resourceClaimww 
=ww *
_getResourcesByClaimSetIdQueryww  >
.ww> ?
SingleResourceww? M
(wwM N

claimSetIdwwN X
,wwX Y
resourceClaimIdwwZ i
)wwi j
;wwj k
returnxx 
JsonConvertxx 
.xx 
SerializeObjectxx .
(xx. /
resourceClaimxx/ <
)xx< =
;xx= >
}yy 	
private{{ 
string{{ *
GetSelectListForAuthStrategies{{ 5
({{5 6
){{6 7
{|| 	
var}} 

selectList}} 
=}} 
new}}  
List}}! %
<}}% &
SelectListItem}}& 4
>}}4 5
{}}5 6
new~~ 
SelectListItem~~ "
{~~" #
Text~~$ (
=~~( )
$str~~) @
,~~@ A
Value~~B G
=~~H I
$str~~J M
,~~N O
Disabled~~P X
=~~Y Z
true~~[ _
,~~_ `
Selected~~a i
=~~j k
true~~l p
}~~p q
,~~q r
} 
; 
var
�� %
authorizationStrategies
�� '
=
��( )6
(_getAuthStrategiesByApplicationNameQuery
��* R
.
��R S
Execute
��S Z
(
��Z [
CloudOdsAdminApp
��[ k
.
��k l-
SecurityContextApplicationName��l �
)��� �
;��� �

selectList
�� 
.
�� 
AddRange
�� 
(
��  
new
��  #

SelectList
��$ .
(
��. /%
authorizationStrategies
��/ F
.
��F G
Select
��G M
(
��M N
x
��N O
=>
��P R
new
��S V
SelectListItem
��W e
(
��e f
)
��f g
{
�� 
Text
�� 
=
�� 
x
�� 
.
�� 
AuthStrategyName
�� )
,
��) *
Value
�� 
=
�� 
x
�� 
.
�� 
AuthStrategyId
�� (
.
��( )
ToString
��) 1
(
��1 2
)
��2 3
}
�� 
)
�� 
,
�� 
$str
�� 
,
�� 
$str
�� 
)
��  
)
��  !
;
��! "
return
�� 
JsonConvert
�� 
.
�� 
SerializeObject
�� .
(
��. /

selectList
��/ 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
ActionResult
�� 
CopyClaimSetModal
�� -
(
��- .
int
��. 1

claimSetId
��2 <
)
��< =
{
�� 	
var
�� 
existingClaimSet
��  
=
��! "#
_getClaimSetByIdQuery
��# 8
.
��8 9
Execute
��9 @
(
��@ A

claimSetId
��A K
)
��K L
;
��L M
var
�� 
model
�� 
=
�� 
new
�� 
CopyClaimSetModel
�� -
{
�� 
Name
�� 
=
�� 
existingClaimSet
�� '
.
��' (
Name
��( ,
+
��, -
$str
��- 4
,
��4 5

OriginalId
�� 
=
�� 

claimSetId
�� '
,
��' (
OriginalName
�� 
=
�� 
existingClaimSet
�� /
.
��/ 0
Name
��0 4
}
�� 
;
�� 
return
�� 
PartialView
�� 
(
�� 
$str
�� 3
,
��3 4
model
��5 :
)
��: ;
;
��; <
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
CopyClaimSet
�� (
(
��( )
CopyClaimSetModel
��) :
model
��; @
)
��@ A
{
�� 	"
_copyClaimSetCommand
��  
.
��  !
Execute
��! (
(
��( )
model
��) .
)
��. /
;
��/ 0
return
�� 

JsonResult
�� 
(
�� 
new
�� !
{
�� 
successMessage
�� 
=
��  
$"
��! #
$str
��# C
{
��C D
model
��D I
.
��I J
Name
��J N
}
��N O
"
��O P
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
ActionResult
�� 
AddClaimSet
�� '
(
��' (
)
��( )
{
�� 	
return
�� 
PartialView
�� 
(
�� 
$str
�� -
,
��- .
new
��/ 2
AddClaimSetModel
��3 C
(
��C D
)
��D E
)
��E F
;
��F G
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
AddClaimSet
�� '
(
��' (
AddClaimSetModel
��( 8
model
��9 >
)
��> ?
{
�� 	
var
�� 

claimSetId
�� 
=
�� !
_addClaimSetCommand
�� 0
.
��0 1
Execute
��1 8
(
��8 9
model
��9 >
)
��> ?
;
��? @
var
�� 
editClaimSetModel
�� !
=
��" #"
GetEditClaimSetModel
��$ 8
(
��8 9

claimSetId
��9 C
)
��C D
;
��D E
return
�� 
PartialView
�� 
(
�� 
$str
�� .
,
��. /
editClaimSetModel
��/ @
)
��@ A
;
��A B
}
�� 	
public
�� 
ActionResult
�� 
EditClaimSet
�� (
(
��( )
int
��) ,

claimSetId
��- 7
)
��7 8
{
�� 	
var
�� 
model
�� 
=
�� 
new
�� 
ClaimSetModel
�� )
{
�� 
EditClaimSetModel
�� !
=
��" #"
GetEditClaimSetModel
��$ 8
(
��8 9

claimSetId
��9 C
)
��C D
,
��D E+
GlobalSettingsTabEnumerations
�� -
=
��. / 
_tabDisplayService
��0 B
.
��B C)
GetGlobalSettingsTabDisplay
��C ^
(
��^ _*
GlobalSettingsTabEnumeration
��_ {
.
��{ |
	ClaimSets��| �
)��� �
}
�� 
;
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
EditClaimSetModel
�� !"
GetEditClaimSetModel
��" 6
(
��6 7
int
��7 :

claimSetId
��; E
)
��E F
{
�� 	
var
�� 
existingClaimSet
��  
=
��! "#
_getClaimSetByIdQuery
��# 8
.
��8 9
Execute
��9 @
(
��@ A

claimSetId
��A K
)
��K L
;
��L M
if
�� 
(
�� 
!
�� 
existingClaimSet
�� !
.
��! "

IsEditable
��" ,
)
��, -
{
�� 
throw
�� 
new
�� 
AdminAppException
�� +
(
��+ ,
$str
��, X
)
��X Y
{
�� 

StatusCode
�� 
=
��  
HttpStatusCode
��! /
.
��/ 0
MethodNotAllowed
��0 @
}
�� 
;
�� 
}
�� 
var
�� 
allResourceClaims
�� !
=
��" #%
_getResourceClaimsQuery
��$ ;
.
��; <
Execute
��< C
(
��C D
)
��D E
.
��E F
ToList
��F L
(
��L M
)
��M N
;
��N O
return
�� 
new
�� 
EditClaimSetModel
�� (
{
�� 
ClaimSetName
�� 
=
�� 
existingClaimSet
�� /
.
��/ 0
Name
��0 4
,
��4 5

ClaimSetId
�� 
=
�� 

claimSetId
�� '
,
��' (
Applications
�� 
=
�� /
!_getApplicationsByClaimSetIdQuery
�� @
.
��@ A
Execute
��A H
(
��H I

claimSetId
��I S
)
��S T
,
��T U
ResourceClaims
�� 
=
��  ,
_getResourcesByClaimSetIdQuery
��! ?
.
��? @
AllResources
��@ L
(
��L M

claimSetId
��M W
)
��W X
,
��X Y
AllResourceClaims
�� !
=
��" #,
GetSelectListForResourceClaims
��$ B
(
��B C
allResourceClaims
��C T
)
��T U
}
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 

JsonResult
�� 1
#GetSelectListForChildResourceClaims
�� =
(
��= >
int
��> A#
parentResourceClaimId
��B W
)
��W X
{
�� 	
var
�� 

selectList
�� 
=
�� 
new
��  
List
��! %
<
��% &
SelectListItem
��& 4
>
��4 5
{
��5 6
new
�� 
SelectListItem
�� "
{
��" #
Text
��$ (
=
��( )
$str
��) @
,
��@ A
Value
��B G
=
��H I
$str
��J M
,
��N O
Disabled
��P X
=
��Y Z
true
��[ _
,
��_ `
Selected
��a i
=
��j k
true
��l p
}
��p q
,
��q r
}
�� 
;
�� 
var
�� 
childResources
�� 
=
��  3
%_getChildResourceClaimsForParentQuery
��! F
.
��F G
Execute
��G N
(
��N O#
parentResourceClaimId
��O d
)
��d e
;
��e f

selectList
�� 
.
�� 
AddRange
�� 
(
��  
new
��  #

SelectList
��$ .
(
��. /
childResources
��/ =
.
��= >
Select
��> D
(
��D E
x
��E F
=>
��G I
new
��J M
SelectListItem
��N \
(
��\ ]
)
��] ^
{
�� 
Text
�� 
=
�� 
x
�� 
.
�� 
Name
�� 
,
�� 
Value
�� 
=
�� 
x
�� 
.
�� 
Id
�� 
.
�� 
ToString
�� %
(
��% &
)
��& '
}
�� 
)
�� 
,
�� 
$str
�� 
,
�� 
$str
�� 
)
��  
)
��  !
;
��! "
return
�� 
Json
�� 
(
�� 

selectList
�� "
)
��" #
;
��# $
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
EditClaimSet
�� (
(
��( )
EditClaimSetModel
��) :
model
��; @
)
��@ A
{
�� 	"
_editClaimSetCommand
��  
.
��  !
Execute
��! (
(
��( )
model
��) .
)
��. /
;
��/ 0
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ /
,
��/ 0
$str
��1 A
)
��A B
;
��B C
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� $
EditResourceOnClaimSet
�� 2
(
��2 3'
EditClaimSetResourceModel
��3 L
model
��M R
)
��R S
{
�� 	,
_editResourceOnClaimSetCommand
�� *
.
��* +
Execute
��+ 2
(
��2 3
model
��3 8
)
��8 9
;
��9 :
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 2
,
��2 3
$str
��4 ?
,
��? @
new
��A D
{
��E F

claimSetId
��G Q
=
��R S
model
��T Y
.
��Y Z

ClaimSetId
��Z d
}
��e f
)
��f g
;
��g h
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� .
 OverrideAuthStrategiesOnResource
�� <
(
��< =7
)OverrideDefaultAuthorizationStrategyModel
��= f
model
��g l
)
��l m
{
�� 	:
,_overrideDefaultAuthorizationStrategyCommand
�� 8
.
��8 9
Execute
��9 @
(
��@ A
model
��A F
)
��F G
;
��G H
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 2
,
��2 3
$str
��4 ?
,
��? @
new
��A D
{
��E F

claimSetId
��G Q
=
��R S
model
��T Y
.
��Y Z

ClaimSetId
��Z d
}
��e f
)
��f g
;
��g h
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� +
ResetAuthStrategiesOnResource
�� 9
(
��9 :-
ResetToDefaultAuthStrategyModel
��: Y
model
��Z _
)
��_ `
{
�� 	0
"_resetToDefaultAuthStrategyCommand
�� .
.
��. /
Execute
��/ 6
(
��6 7
model
��7 <
)
��< =
;
��= >
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 2
,
��2 3
$str
��4 ?
,
��? @
new
��A D
{
��E F

claimSetId
��G Q
=
��R S
model
��T Y
.
��Y Z

ClaimSetId
��Z d
}
��e f
)
��f g
;
��g h
}
�� 	
public
�� 
ActionResult
�� !
DeleteClaimSetModal
�� /
(
��/ 0
int
��0 3

claimSetId
��4 >
)
��> ?
{
�� 	
var
�� 
existingClaimSet
��  
=
��! "#
_getClaimSetByIdQuery
��# 8
.
��8 9
Execute
��9 @
(
��@ A

claimSetId
��A K
)
��K L
;
��L M
var
�� /
!vendorApplicationCountForClaimSet
�� 1
=
��2 3/
!_getApplicationsByClaimSetIdQuery
��4 U
.
��U V
Execute
��V ]
(
��] ^

claimSetId
��^ h
)
��h i
.
��i j
Count
��j o
(
��o p
)
��p q
;
��q r
var
�� 
model
�� 
=
�� 
new
�� !
DeleteClaimSetModel
�� /
{
�� 
Id
�� 
=
�� 

claimSetId
�� 
,
��  
Name
�� 
=
�� 
existingClaimSet
�� '
.
��' (
Name
��( ,
,
��, -

IsEditable
�� 
=
�� 
existingClaimSet
�� -
.
��- .

IsEditable
��. 8
,
��8 9$
VendorApplicationCount
�� &
=
��' (/
!vendorApplicationCountForClaimSet
��) J
}
�� 
;
�� 
return
�� 
PartialView
�� 
(
�� 
$str
�� 5
,
��5 6
model
��7 <
)
��< =
;
��= >
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
DeleteClaimSet
�� *
(
��* +!
DeleteClaimSetModel
��+ >
model
��? D
)
��D E
{
�� 	$
_deleteClaimSetCommand
�� "
.
��" #
Execute
��# *
(
��* +
model
��+ 0
)
��0 1
;
��1 2
return
�� 

JsonResult
�� 
(
�� 
new
�� !
{
�� 
successMessage
�� 
=
��  
$"
��! #
$str
��# @
"
��@ A
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
ActionResult
�� +
DeleteResourceOnClaimSetModal
�� 9
(
��9 :)
DeleteClaimSetResourceModel
��: U
deleteModel
��V a
)
��a b
{
�� 	
return
�� 
PartialView
�� 
(
�� 
$str
�� =
,
��= >
deleteModel
��? J
)
��J K
;
��K L
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� &
DeleteResourceOnClaimSet
�� 4
(
��4 5)
DeleteClaimSetResourceModel
��5 P
model
��Q V
)
��V W
{
�� 	.
 _deleteResourceOnClaimSetCommand
�� ,
.
��, -
Execute
��- 4
(
��4 5
model
��5 :
)
��: ;
;
��; <
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 2
,
��2 3
$str
��4 ?
,
��? @
new
��A D
{
��E F

claimSetId
��G Q
=
��R S
model
��T Y
.
��Y Z

ClaimSetId
��Z d
}
��e f
)
��f g
;
��g h
}
�� 	
public
�� 
ActionResult
�� 
ImportClaimSet
�� *
(
��* +
)
��+ ,
{
�� 	
return
�� 
PartialView
�� 
(
�� 
$str
�� 0
,
��0 1
new
��2 5%
ClaimSetFileImportModel
��6 M
(
��M N
)
��N O
)
��O P
;
��P Q
}
�� 	
public
�� 
ActionResult
�� 
ExportClaimSet
�� *
(
��* +
)
��+ ,
{
�� 	
var
�� 
	claimSets
�� 
=
�� 1
#_getClaimSetsByApplicationNameQuery
�� ?
.
��? @
Execute
��@ G
(
��G H
CloudOdsAdminApp
��H X
.
��X Y,
SecurityContextApplicationName
��Y w
)
��w x
;
��x y
return
�� 
PartialView
�� 
(
�� 
$str
�� 0
,
��0 1
new
��2 5%
ClaimSetFileExportModel
��6 M
(
��M N
)
��N O
{
�� 
	ClaimSets
�� 
=
�� 
	claimSets
�� %
}
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 

FileImport
�� &
(
��& '%
ClaimSetFileImportModel
��' >%
claimSetFileImportModel
��? V
)
��V W
{
�� 	(
_claimSetFileImportCommand
�� &
.
��& '
Execute
��' .
(
��. /%
claimSetFileImportModel
��/ F
.
��F G
AsSharingModel
��G U
(
��U V
)
��V W
)
��W X
;
��X Y
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ /
,
��/ 0
$str
��1 A
)
��A B
;
��B C
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 

FileExport
�� &
(
��& '%
ClaimSetFileExportModel
��' >%
claimSetFileExportModel
��? V
)
��V W
{
�� 	
var
�� 
exports
�� 
=
�� (
_claimSetFileExportCommand
�� 4
.
��4 5
Execute
��5 <
(
��< =%
claimSetFileExportModel
��= T
)
��T U
;
��U V
var
�� 
currentDate
�� 
=
�� 
DateTime
�� &
.
��& '
Now
��' *
.
��* +
ToString
��+ 3
(
��3 4
$str
��4 I
)
��I J
;
��J K
var
�� !
exportClaimSetModel
�� #
=
��$ %
new
��& )(
ExportClaimSetPreviewModel
��* D
{
�� 
DownLoadFileTitle
�� !
=
��" #
$"
��$ &
{
��& '
exports
��' .
.
��. /
Title
��/ 4
}
��4 5
$str
��5 6
{
��6 7
currentDate
��7 B
}
��B C
$str
��C D
"
��D E
,
��E F!
ExportPreviewString
�� #
=
��$ %
SharingModel
��& 2
.
��2 3'
SerializeFromSharingModel
��3 L
(
��L M
exports
��M T
)
��T U
}
�� 
;
�� 
return
�� 
PartialView
�� 
(
�� 
$str
�� 7
,
��7 8!
exportClaimSetModel
��9 L
)
��L M
;
��M N
}
�� 	
}
�� 
}�� �*
YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\ControllerBase.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
public 

class 
ControllerBase 
:  !

Controller" ,
{ 
	protected 
ActionResult 
RedirectToAction /
</ 0
TController0 ;
>; <
(< =

Expression= G
<G H
FuncH L
<L M
TControllerM X
,X Y
objectZ `
>` a
>a b
actionExpressionc s
)s t
where 
TController 
: 

Controller  *
{ 	
return 
RouteHelpers 
.  !
RedirectToActionRoute  5
(5 6
actionExpression6 F
)F G
;G H
} 	
	protected 
ActionResult  
RedirectToActionJson 3
<3 4
TController4 ?
>? @
(@ A

ExpressionA K
<K L
FuncL P
<P Q
TControllerQ \
,\ ]
object^ d
>d e
>e f
actionExpressiong w
,w x
stringy 
successMessage
� �
=
� �
null
� �
)
� �
where 
TController 
: 

Controller  *
{ 	
return  
RedirectToActionJson '
(' (
actionExpression( 8
,8 9
null: >
,> ?
successMessage@ N
)N O
;O P
} 	
	protected 
ActionResult  
RedirectToActionJson 3
<3 4
TController4 ?
>? @
(@ A

ExpressionA K
<K L
FuncL P
<P Q
TControllerQ \
,\ ]
object^ d
>d e
>e f
actionExpressiong w
,w x
objecty 
routeValues
� �
,
� �
string
� �
successMessage
� �
=
� �
null
� �
)
� �
where 
TController 
: 

Controller  *
{ 	
var 
controllerName 
=  
actionExpression! 1
.1 2
GetControllerName2 C
(C D
)D E
;E F
var 

actionName 
= 
actionExpression -
.- .
GetActionName. ;
(; <
)< =
;= >
return!! 

JsonResult!! 
(!! 
new!! !
{"" 
redirect## 
=## 
Url## 
.## 
Action## %
(##% &

actionName##& 0
,##0 1
controllerName##2 @
,##@ A
routeValues##B M
)##M N
,##N O
successMessage$$ 
=$$  
successMessage$$! /
}%% 
)%% 
;%% 
}&& 	
	protected(( 
ActionResult(( 
JsonSuccess(( *
(((* +
string((+ 1
successMessage((2 @
)((@ A
{)) 	
return** 

JsonResult** 
(** 
new** !
{++ 
successMessage,, 
=,,  
successMessage,,! /
}-- 
)-- 
;-- 
}.. 	
	protected00 
ActionResult00 
	JsonError00 (
(00( )
string00) /
errorMessage000 <
)00< =
{11 	
return22 

JsonResult22 
(22 
new22 !
{33 
errorMessage44 
=44 
errorMessage44 +
}55 
)55 
;55 
}66 	
	protected88 
ContentResult88 

JsonResult88  *
(88* +
object88+ 1
model882 7
)887 8
{99 	
return:: 
ResponseHelpers:: "
.::" #

JsonResult::# -
(::- .
model::. 3
)::3 4
;::4 5
};; 	
	protected== 
void== 
SuccessToastMessage== *
(==* +
string==+ 1
message==2 9
)==9 :
{>> 	
Toast?? 
(?? 
message?? 
,?? 
$str?? $
)??$ %
;??% &
}@@ 	
	protectedBB 
voidBB 
ErrorToastMessageBB (
(BB( )
stringBB) /
messageBB0 7
)BB7 8
{CC 	
ToastDD 
(DD 
messageDD 
,DD 
$strDD "
)DD" #
;DD# $
}EE 	
privateGG 
voidGG 
ToastGG 
(GG 
stringGG !
messageGG" )
,GG) *
stringGG+ 1
typeGG2 6
)GG6 7
{HH 	
TempDataII 
[II 
$strII #
]II# $
=II% &
messageII' .
;II. /
TempDataJJ 
[JJ 
$strJJ  
]JJ  !
=JJ" #
typeJJ$ (
;JJ( )
}KK 	
}LL 
}MM �%
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\DescriptorsController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
public 

class !
DescriptorsController &
:' (
ControllerBase) 7
{ 
private 
readonly  
IOdsApiFacadeFactory - 
_odsApiFacadeFactory. B
;B C
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
ITabDisplayService +
_tabDisplayService, >
;> ?
private 
readonly 
InstanceContext (
_instanceContext) 9
;9 :
public !
DescriptorsController $
($ % 
IOdsApiFacadeFactory% 9
odsApiFacadeFactory: M
, 
IMapper 
mapper 
, 
ITabDisplayService  
tabDisplayService! 2
, 
InstanceContext 
instanceContext -
)- .
{ 	 
_odsApiFacadeFactory    
=  ! "
odsApiFacadeFactory  # 6
;  6 7
_mapper!! 
=!! 
mapper!! 
;!! 
_tabDisplayService"" 
=""  
tabDisplayService""! 2
;""2 3
_instanceContext## 
=## 
instanceContext## .
;##. /
}$$ 	
public&& 
ActionResult&& 
Index&& !
(&&! "
)&&" #
{'' 	
var(( 
model(( 
=(( 
new(( !
DescriptorsIndexModel(( 1
{)) .
"OdsInstanceSettingsTabEnumerations** 2
=**3 4
_tabDisplayService++ &
.++& ',
 GetOdsInstanceSettingsTabDisplay++' G
(++G H-
!OdsInstanceSettingsTabEnumeration++H i
.++i j
Descriptors++j u
)++u v
,++v w
OdsInstance,, 
=,, 
_instanceContext,, .
}-- 
;-- 
return// 
View// 
(// 
model// 
)// 
;// 
}00 	
public22 
async22 
Task22 
<22 
ActionResult22 &
>22& '"
DescriptorCategoryList22( >
(22> ?
)22? @
{33 	
var44 #
descriptorCategoryPaths44 '
=44( )
(44* +
await44+ 0 
_odsApiFacadeFactory441 E
.44E F
Create44F L
(44L M
)44M N
)44N O
.44O P
GetAllDescriptors44P a
(44a b
)44b c
;44c d
var66 
model66 
=66 
new66 %
DescriptorCategoriesModel66 5
{77  
DescriptorCategories88 $
=88% &#
descriptorCategoryPaths88' >
.88> ?
Select88? E
(88E F
path88F J
=>88K M
new88N Q%
DescriptorCategoriesModel88R k
.88k l
Category88l t
{99 
Path:: 
=:: 
path:: 
,::  
Name;; 
=;; 
path;; 
.;;  %
GetDescriptorCategoryName;;  9
(;;9 :
);;: ;
}<< 
)<< 
.<< 
OrderBy<< 
(<< 
x<< 
=><< 
x<<  !
.<<! "
Name<<" &
)<<& '
.<<' (
ToList<<( .
(<<. /
)<</ 0
}== 
;== 
return?? 
PartialView?? 
(?? 
$str?? 5
,??5 6
model??7 <
)??< =
;??= >
}@@ 	
publicBB 
asyncBB 
TaskBB 
<BB 
ActionResultBB &
>BB& '&
GetDescriptorsFromCategoryBB( B
(BBB C
stringBBC I
categoryPathBBJ V
)BBV W
{CC 	
varDD 
descriptorsDD 
=DD 
(DD 
awaitDD $ 
_odsApiFacadeFactoryDD% 9
.DD9 :
CreateDD: @
(DD@ A
)DDA B
)DDB C
.DDC D 
GetDescriptorsByPathDDD X
(DDX Y
categoryPathDDY e
)DDe f
;DDf g
returnEE 
PartialViewEE 
(EE 
$strEE ,
,EE, -
_mapperEE. 5
.EE5 6
MapEE6 9
<EE9 :
ListEE: >
<EE> ?
DescriptorModelEE? N
>EEN O
>EEO P
(EEP Q
descriptorsEEQ \
)EE\ ]
)EE] ^
;EE^ _
}FF 	
}GG 
}HH ��
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\EducationOrganizationsController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
public 

class ,
 EducationOrganizationsController 1
:2 3
ControllerBase4 B
{ 
private 
readonly  
IOdsApiFacadeFactory - 
_odsApiFacadeFactory. B
;B C
private 
readonly 
IMapper  
_mapper! (
;( )
private   
readonly   
InstanceContext   (
_instanceContext  ) 9
;  9 :
private!! 
readonly!! 
ITabDisplayService!! +
_tabDisplayService!!, >
;!!> ?
private"" 
readonly"" "
IInferExtensionDetails"" /"
_inferExtensionDetails""0 F
;""F G
private## 
readonly## 
IOdsApiValidator## )
_odsApiValidator##* :
;##: ;
public%% ,
 EducationOrganizationsController%% /
(%%/ 0 
IOdsApiFacadeFactory%%0 D
odsApiFacadeFactory%%E X
,&& 
IMapper&& 
mapper&& 
,&& 
InstanceContext&& -
instanceContext&&. =
,&&= >
ITabDisplayService&&? Q
tabDisplayService&&R c
,'' "
IInferExtensionDetails'' $!
inferExtensionDetails''% :
,'': ;
IOdsApiValidator''< L
odsApiValidator''M \
)''\ ]
{(( 	 
_odsApiFacadeFactory))  
=))! "
odsApiFacadeFactory))# 6
;))6 7
_mapper** 
=** 
mapper** 
;** 
_instanceContext++ 
=++ 
instanceContext++ .
;++. /
_tabDisplayService,, 
=,,  
tabDisplayService,,! 2
;,,2 3"
_inferExtensionDetails-- "
=--# $!
inferExtensionDetails--% :
;--: ;
_odsApiValidator.. 
=.. 
odsApiValidator.. .
;... /
}// 	
public11 
async11 
Task11 
<11 
ActionResult11 &
>11& '"
LocalEducationAgencies11( >
(11> ?
)11? @
{22 	
var33 
validatorResult33 
=33  !
await33" '
_odsApiValidator33( 8
.338 9
Validate339 A
(33A B$
CloudOdsAdminAppSettings33B Z
.33Z [
AppSettings33[ f
.33f g
ProductionApiUrl33g w
)33w x
;33x y
if55 
(55 
!55 
validatorResult55  
.55  !
IsValidOdsApi55! .
)55. /
{66 
throw77 
validatorResult77 %
.77% &
	Exception77& /
;77/ 0
}88 
var:: 
model:: 
=:: 
new:: ,
 EducationOrganizationsIndexModel:: <
{;; .
"OdsInstanceSettingsTabEnumerations<< 2
=<<3 4
_tabDisplayService== &
.==& ',
 GetOdsInstanceSettingsTabDisplay==' G
(==G H-
!OdsInstanceSettingsTabEnumeration==H i
.>> "
EducationOrganizations>> /
)>>/ 0
,>>0 1
OdsInstance?? 
=?? 
_instanceContext?? .
,??. /
TpdmEnabled@@ 
=@@ 
await@@ #
TpdmEnabled@@$ /
(@@/ 0
)@@0 1
,@@1 2
ModeAA 
=AA &
EducationOrganizationsModeAA 1
.AA1 2"
LocalEducationAgenciesAA2 H
}BB 
;BB 
returnDD 
ViewDD 
(DD 
$strDD 
,DD  
modelDD! &
)DD& '
;DD' (
}EE 	
publicHH 
asyncHH 
TaskHH 
<HH 
ActionResultHH &
>HH& '%
PostSecondaryInstitutionsHH( A
(HHA B
)HHB C
{II 	
varJJ 
validatorResultJJ 
=JJ  !
awaitJJ" '
_odsApiValidatorJJ( 8
.JJ8 9
ValidateJJ9 A
(JJA B$
CloudOdsAdminAppSettingsJJB Z
.JJZ [
AppSettingsJJ[ f
.JJf g
ProductionApiUrlJJg w
)JJw x
;JJx y
ifLL 
(LL 
!LL 
validatorResultLL  
.LL  !
IsValidOdsApiLL! .
)LL. /
{MM 
throwNN 
validatorResultNN %
.NN% &
	ExceptionNN& /
;NN/ 0
}OO 
varQQ 
modelQQ 
=QQ 
newQQ ,
 EducationOrganizationsIndexModelQQ <
{RR .
"OdsInstanceSettingsTabEnumerationsSS 2
=SS3 4
_tabDisplayServiceTT &
.TT& ',
 GetOdsInstanceSettingsTabDisplayTT' G
(TTG H-
!OdsInstanceSettingsTabEnumerationTTH i
.UU "
EducationOrganizationsUU /
)UU/ 0
,UU0 1
OdsInstanceVV 
=VV 
_instanceContextVV .
,VV. /
TpdmEnabledWW 
=WW 
awaitWW #
TpdmEnabledWW$ /
(WW/ 0
)WW0 1
,WW1 2
ModeXX 
=XX &
EducationOrganizationsModeXX 1
.XX1 2%
PostSecondaryInstitutionsXX2 K
}YY 
;YY 
return[[ 
View[[ 
([[ 
$str[[ 
,[[  
model[[! &
)[[& '
;[[' (
}\\ 	
[^^ 	
HttpPost^^	 
]^^ 
public__ 
async__ 
Task__ 
<__ 
ActionResult__ &
>__& '#
AddLocalEducationAgency__( ?
(__? @(
AddLocalEducationAgencyModel__@ \
	viewModel__] f
)__f g
{`` 	
varaa 
	apiFacadeaa 
=aa 
awaitaa ! 
_odsApiFacadeFactoryaa" 6
.aa6 7
Createaa7 =
(aa= >
)aa> ?
;aa? @
varcc 
leaIdcc 
=cc 
	viewModelcc !
.cc! ""
LocalEducationAgencyIdcc" 8
;cc8 9
ifee 
(ee 
leaIdee 
!=ee 
nullee 
)ee 
{ff 
ifgg 
(gg 2
&ProposedEducationOrganizationIdIsInUsegg :
(gg: ;
leaIdgg; @
.gg@ A
ValueggA F
,ggF G
	apiFacadeggH Q
)ggQ R
)ggR S
returnhh #
ValidationFailureResulthh 2
(hh2 3
$strii 0
,ii0 1
$strjj \
+jj] ^
$strkk X
)kkX Y
;kkY Z
}ll 
varnn 
modelnn 
=nn 
_mappernn 
.nn  
Mapnn  #
<nn# $ 
LocalEducationAgencynn$ 8
>nn8 9
(nn9 :
	viewModelnn: C
)nnC D
;nnD E
modeloo 
.oo 
Idoo 
=oo 
Guidoo 
.oo 
Emptyoo !
.oo! "
ToStringoo" *
(oo* +
)oo+ ,
;oo, -
varpp 
	addResultpp 
=pp 
	apiFacadepp %
.pp% &#
AddLocalEducationAgencypp& =
(pp= >
modelpp> C
)ppC D
;ppD E
returnqq 
	addResultqq 
.qq 
Successqq $
?qq% &
JsonSuccessqq' 2
(qq2 3
$strqq3 G
)qqG H
:qqI J
	JsonErrorqqK T
(qqT U
	addResultqqU ^
.qq^ _
ErrorMessageqq_ k
)qqk l
;qql m
}rr 	
[tt 	
HttpPosttt	 
]tt 
publicuu 
asyncuu 
Taskuu 
<uu 
ActionResultuu &
>uu& ''
AddPostSecondaryInstitutionuu( C
(uuC D,
 AddPostSecondaryInstitutionModeluuD d
	viewModeluue n
)uun o
{vv 	
varww 
	apiFacadeww 
=ww 
awaitww ! 
_odsApiFacadeFactoryww" 6
.ww6 7
Createww7 =
(ww= >
)ww> ?
;ww? @
varyy 
psiIdyy 
=yy 
	viewModelyy !
.yy! "&
PostSecondaryInstitutionIdyy" <
;yy< =
if{{ 
({{ 
psiId{{ 
!={{ 
null{{ 
){{ 
{|| 
if}} 
(}} 2
&ProposedEducationOrganizationIdIsInUse}} :
(}}: ;
psiId}}; @
.}}@ A
Value}}A F
,}}F G
	apiFacade}}H Q
)}}Q R
)}}R S
return~~ #
ValidationFailureResult~~ 2
(~~2 3
$str 4
,4 5
$str
�� Z
+
��[ \
$str
�� X
)
��X Y
;
��Y Z
}
�� 
var
�� 
model
�� 
=
�� 
_mapper
�� 
.
��  
Map
��  #
<
��# $&
PostSecondaryInstitution
��$ <
>
��< =
(
��= >
	viewModel
��> G
)
��G H
;
��H I
model
�� 
.
�� 
Id
�� 
=
�� 
Guid
�� 
.
�� 
Empty
�� !
.
��! "
ToString
��" *
(
��* +
)
��+ ,
;
��, -
var
�� 
	addResult
�� 
=
�� 
	apiFacade
�� %
.
��% &)
AddPostSecondaryInstitution
��& A
(
��A B
model
��B G
)
��G H
;
��H I
return
�� 
	addResult
�� 
.
�� 
Success
�� $
?
��% &
JsonSuccess
��' 2
(
��2 3
$str
��3 U
)
��U V
:
��W X
	JsonError
��Y b
(
��b c
	addResult
��c l
.
��l m
ErrorMessage
��m y
)
��y z
;
��z {
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
	AddSchool
��( 1
(
��1 2
AddSchoolModel
��2 @
	viewModel
��A J
)
��J K
{
�� 	
var
�� 
	apiFacade
�� 
=
�� 
await
�� !"
_odsApiFacadeFactory
��" 6
.
��6 7
Create
��7 =
(
��= >
)
��> ?
;
��? @
var
�� 
schoolId
�� 
=
�� 
	viewModel
�� $
.
��$ %
SchoolId
��% -
;
��- .
if
�� 
(
�� 
schoolId
�� 
!=
�� 
null
��  
)
��  !
{
�� 
if
�� 
(
�� 4
&ProposedEducationOrganizationIdIsInUse
�� :
(
��: ;
schoolId
��; C
.
��C D
Value
��D I
,
��I J
	apiFacade
��K T
)
��T U
)
��U V
return
�� %
ValidationFailureResult
�� 2
(
��2 3
$str
�� &
,
��& '
$str
�� R
+
��S T
$str
�� T
)
��T U
;
��U V
}
�� 
var
�� 
model
�� 
=
�� 
_mapper
�� 
.
��  
Map
��  #
<
��# $
School
��$ *
>
��* +
(
��+ ,
	viewModel
��, 5
)
��5 6
;
��6 7
model
�� 
.
�� 
Id
�� 
=
�� 
Guid
�� 
.
�� 
Empty
�� !
.
��! "
ToString
��" *
(
��* +
)
��+ ,
;
��, -
var
�� 
	addResult
�� 
=
�� 
	apiFacade
�� %
.
��% &
	AddSchool
��& /
(
��/ 0
model
��0 5
)
��5 6
;
��6 7
return
�� 
	addResult
�� 
.
�� 
Success
�� $
?
��% &
JsonSuccess
��' 2
(
��2 3
$str
��3 A
)
��A B
:
��C D
	JsonError
��E N
(
��N O
	addResult
��O X
.
��X Y
ErrorMessage
��Y e
)
��e f
;
��f g
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
AddPsiSchool
��( 4
(
��4 5
AddPsiSchoolModel
��5 F
	viewModel
��G P
)
��P Q
{
�� 	
var
�� 
	apiFacade
�� 
=
�� 
await
�� !"
_odsApiFacadeFactory
��" 6
.
��6 7
Create
��7 =
(
��= >
)
��> ?
;
��? @
var
�� 
schoolId
�� 
=
�� 
	viewModel
�� $
.
��$ %
SchoolId
��% -
;
��- .
if
�� 
(
�� 
schoolId
�� 
!=
�� 
null
��  
)
��  !
{
�� 
if
�� 
(
�� 4
&ProposedEducationOrganizationIdIsInUse
�� :
(
��: ;
schoolId
��; C
.
��C D
Value
��D I
,
��I J
	apiFacade
��K T
)
��T U
)
��U V
return
�� %
ValidationFailureResult
�� 2
(
��2 3
$str
�� "
,
��" #
$str
�� N
+
��O P
$str
�� P
)
��P Q
;
��Q R
}
�� 
var
�� 
model
�� 
=
�� 
_mapper
�� 
.
��  
Map
��  #
<
��# $
	PsiSchool
��$ -
>
��- .
(
��. /
	viewModel
��/ 8
)
��8 9
;
��9 :
model
�� 
.
�� 
Id
�� 
=
�� 
Guid
�� 
.
�� 
Empty
�� !
.
��! "
ToString
��" *
(
��* +
)
��+ ,
;
��, -
var
�� 
	addResult
�� 
=
�� 
	apiFacade
�� %
.
��% &
AddPsiSchool
��& 2
(
��2 3
model
��3 8
)
��8 9
;
��9 :
return
�� 
	addResult
�� 
.
�� 
Success
�� $
?
��% &
JsonSuccess
��' 2
(
��2 3
$str
��3 A
)
��A B
:
��C D
	JsonError
��E N
(
��N O
	addResult
��O X
.
��X Y
ErrorMessage
��Y e
)
��e f
;
��f g
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '+
EditLocalEducationAgencyModal
��( E
(
��E F
string
��F L
id
��M O
)
��O P
{
�� 	
var
�� 
api
�� 
=
�� 
await
�� "
_odsApiFacadeFactory
�� 0
.
��0 1
Create
��1 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
educationAgency
�� 
=
��  !
api
��" %
.
��% &)
GetLocalEducationAgencyById
��& A
(
��A B
id
��B D
)
��D E
;
��E F
var
�� 1
#localEducationAgencyCategoryOptions
�� 3
=
��4 5
api
��6 9
.
��9 :/
!GetLocalEducationAgencyCategories
��: [
(
��[ \
)
��\ ]
;
��] ^
var
�� 
stateOptions
�� 
=
�� 
api
�� "
.
��" #&
GetAllStateAbbreviations
��# ;
(
��; <
)
��< =
;
��= >
var
�� 
model
�� 
=
�� 
_mapper
�� 
.
��  
Map
��  #
<
��# $+
EditLocalEducationAgencyModel
��$ A
>
��A B
(
��B C
educationAgency
��C R
)
��R S
;
��S T
model
�� 
.
�� 5
'LocalEducationAgencyCategoryTypeOptions
�� 9
=
��: ;1
#localEducationAgencyCategoryOptions
��< _
;
��_ `
model
�� 
.
�� 
StateOptions
�� 
=
��  
stateOptions
��! -
;
��- .
return
�� 
PartialView
�� 
(
�� 
$str
�� ?
,
��? @
model
��A F
)
��F G
;
��G H
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '&
EditLocalEducationAgency
��( @
(
��@ A+
EditLocalEducationAgencyModel
��A ^
model
��_ d
)
��d e
{
�� 	
var
�� 

editResult
�� 
=
�� 
(
�� 
await
�� #"
_odsApiFacadeFactory
��$ 8
.
��8 9
Create
��9 ?
(
��? @
)
��@ A
)
��A B
.
��B C&
EditLocalEducationAgency
��C [
(
��[ \
_mapper
��\ c
.
��c d
Map
��d g
<
��g h"
LocalEducationAgency
��h |
>
��| }
(
��} ~
model��~ �
)��� �
)��� �
;��� �
return
�� 

editResult
�� 
.
�� 
Success
�� %
?
��& '
JsonSuccess
��( 3
(
��3 4
$str
��4 J
)
��J K
:
��L M
	JsonError
��N W
(
��W X

editResult
��X b
.
��b c
ErrorMessage
��c o
)
��o p
;
��p q
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '/
!EditPostSecondaryInstitutionModal
��( I
(
��I J
string
��J P
id
��Q S
)
��S T
{
�� 	
var
�� 
api
�� 
=
�� 
await
�� "
_odsApiFacadeFactory
�� 0
.
��0 1
Create
��1 7
(
��7 8
)
��8 9
;
��9 :
var
�� &
postSecondaryInstitution
�� (
=
��) *
api
��+ .
.
��. /-
GetPostSecondaryInstitutionById
��/ N
(
��N O
id
��O Q
)
��Q R
;
��R S
var
�� 2
$postSecondaryInstitutionLevelOptions
�� 4
=
��5 6&
BuildListWithEmptyOption
��7 O
(
��O P
api
��P S
.
��S T/
!GetPostSecondaryInstitutionLevels
��T u
)
��u v
;
��v w
var
�� 1
#administrativeFundingControlOptions
�� 3
=
��4 5&
BuildListWithEmptyOption
��6 N
(
��N O
api
��O R
.
��R S.
 GetAdministrativeFundingControls
��S s
)
��s t
;
��t u
var
�� 
stateOptions
�� 
=
�� 
api
�� "
.
��" #&
GetAllStateAbbreviations
��# ;
(
��; <
)
��< =
;
��= >
var
�� 
model
�� 
=
�� 
_mapper
�� 
.
��  
Map
��  #
<
��# $/
!EditPostSecondaryInstitutionModel
��$ E
>
��E F
(
��F G&
postSecondaryInstitution
��G _
)
��_ `
;
��` a
model
�� 
.
�� 2
$PostSecondaryInstitutionLevelOptions
�� 6
=
��7 82
$postSecondaryInstitutionLevelOptions
��9 ]
;
��] ^
model
�� 
.
�� 1
#AdministrativeFundingControlOptions
�� 5
=
��6 71
#administrativeFundingControlOptions
��8 [
;
��[ \
model
�� 
.
�� 
StateOptions
�� 
=
��  
stateOptions
��! -
;
��- .
return
�� 
PartialView
�� 
(
�� 
$str
�� C
,
��C D
model
��E J
)
��J K
;
��K L
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '*
EditPostSecondaryInstitution
��( D
(
��D E/
!EditPostSecondaryInstitutionModel
��E f
model
��g l
)
��l m
{
�� 	
var
�� 

editResult
�� 
=
�� 
(
�� 
await
�� #"
_odsApiFacadeFactory
��$ 8
.
��8 9
Create
��9 ?
(
��? @
)
��@ A
)
��A B
.
��B C*
EditPostSecondaryInstitution
��C _
(
��_ `
_mapper
��` g
.
��g h
Map
��h k
<
��k l'
PostSecondaryInstitution��l �
>��� �
(��� �
model��� �
)��� �
)��� �
;��� �
return
�� 

editResult
�� 
.
�� 
Success
�� %
?
��& '
JsonSuccess
��( 3
(
��3 4
$str
��4 X
)
��X Y
:
��Z [
	JsonError
��\ e
(
��e f

editResult
��f p
.
��p q
ErrorMessage
��q }
)
��} ~
;
��~ 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
EditSchoolModal
��( 7
(
��7 8
string
��8 >
id
��? A
)
��A B
{
�� 	
var
�� 
api
�� 
=
�� 
await
�� "
_odsApiFacadeFactory
�� 0
.
��0 1
Create
��1 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
school
�� 
=
�� 
api
�� 
.
�� 
GetSchoolById
�� *
(
��* +
id
��+ -
)
��- .
;
��. /
var
�� 
gradeLevelOptions
�� !
=
��" #
api
��$ '
.
��' (
GetAllGradeLevels
��( 9
(
��9 :
)
��: ;
;
��; <
var
�� 
stateOptions
�� 
=
�� 
api
�� "
.
��" #&
GetAllStateAbbreviations
��# ;
(
��; <
)
��< =
;
��= >
var
�� 
model
�� 
=
�� 
_mapper
�� 
.
��  
Map
��  #
<
��# $
EditSchoolModel
��$ 3
>
��3 4
(
��4 5
school
��5 ;
)
��; <
;
��< =
model
�� 
.
�� 
GradeLevelOptions
�� #
=
��$ %
gradeLevelOptions
��& 7
;
��7 8
model
�� 
.
�� 
StateOptions
�� 
=
��  
stateOptions
��! -
;
��- .
return
�� 
PartialView
�� 
(
�� 
$str
�� 1
,
��1 2
model
��3 8
)
��8 9
;
��9 :
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '

EditSchool
��( 2
(
��2 3
EditSchoolModel
��3 B
model
��C H
)
��H I
{
�� 	
var
�� 

editResult
�� 
=
�� 
(
�� 
await
�� #"
_odsApiFacadeFactory
��$ 8
.
��8 9
Create
��9 ?
(
��? @
)
��@ A
)
��A B
.
��B C

EditSchool
��C M
(
��M N
_mapper
��N U
.
��U V
Map
��V Y
<
��Y Z
School
��Z `
>
��` a
(
��a b
model
��b g
)
��g h
)
��h i
;
��i j
return
�� 

editResult
�� 
.
�� 
Success
�� %
?
��& '
JsonSuccess
��( 3
(
��3 4
$str
��4 D
)
��D E
:
��F G
	JsonError
��H Q
(
��Q R

editResult
��R \
.
��\ ]
ErrorMessage
��] i
)
��i j
;
��j k
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& ' 
EditPsiSchoolModal
��( :
(
��: ;
string
��; A
id
��B D
)
��D E
{
�� 	
var
�� 
api
�� 
=
�� 
await
�� "
_odsApiFacadeFactory
�� 0
.
��0 1
Create
��1 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
	psiSchool
�� 
=
�� 
api
�� 
.
��  
GetPsiSchoolById
��  0
(
��0 1
id
��1 3
)
��3 4
;
��4 5
var
�� 
gradeLevelOptions
�� !
=
��" #
api
��$ '
.
��' (
GetAllGradeLevels
��( 9
(
��9 :
)
��: ;
;
��; <
var
�� 
stateOptions
�� 
=
�� 
api
�� "
.
��" #&
GetAllStateAbbreviations
��# ;
(
��; <
)
��< =
;
��= >
var
�� &
federalLocaleCodeOptions
�� (
=
��) *
await
��+ 00
"CheckAndFillIfTpdmCommunityVersion
��1 S
(
��S T
api
��T W
.
��W X#
GetFederalLocaleCodes
��X m
)
��m n
;
��n o
var
�� (
accreditationStatusOptions
�� *
=
��+ ,
await
��- 20
"CheckAndFillIfTpdmCommunityVersion
��3 U
(
��U V
api
��V Y
.
��Y Z+
GetAccreditationStatusOptions
��Z w
)
��w x
;
��x y
var
�� 
model
�� 
=
�� 
_mapper
�� 
.
��  
Map
��  #
<
��# $ 
EditPsiSchoolModel
��$ 6
>
��6 7
(
��7 8
	psiSchool
��8 A
)
��A B
;
��B C
model
�� 
.
�� 
GradeLevelOptions
�� #
=
��$ %
gradeLevelOptions
��& 7
;
��7 8
model
�� 
.
�� 
StateOptions
�� 
=
��  
stateOptions
��! -
;
��- .
model
�� 
.
�� &
FederalLocaleCodeOptions
�� *
=
��+ ,&
federalLocaleCodeOptions
��- E
;
��E F
model
�� 
.
�� (
AccreditationStatusOptions
�� ,
=
��- .(
accreditationStatusOptions
��/ I
;
��I J
return
�� 
PartialView
�� 
(
�� 
$str
�� 4
,
��4 5
model
��6 ;
)
��; <
;
��< =
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
EditPsiSchool
��( 5
(
��5 6 
EditPsiSchoolModel
��6 H
model
��I N
)
��N O
{
�� 	
var
�� 

editResult
�� 
=
�� 
(
�� 
await
�� #"
_odsApiFacadeFactory
��$ 8
.
��8 9
Create
��9 ?
(
��? @
)
��@ A
)
��A B
.
��B C
EditPsiSchool
��C P
(
��P Q
_mapper
��Q X
.
��X Y
Map
��Y \
<
��\ ]
	PsiSchool
��] f
>
��f g
(
��g h
model
��h m
)
��m n
)
��n o
;
��o p
return
�� 

editResult
�� 
.
�� 
Success
�� %
?
��& '
JsonSuccess
��( 3
(
��3 4
$str
��4 D
)
��D E
:
��F G
	JsonError
��H Q
(
��Q R

editResult
��R \
.
��\ ]
ErrorMessage
��] i
)
��i j
;
��j k
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '&
LocalEducationAgencyList
��( @
(
��@ A
int
��A D

pageNumber
��E O
)
��O P
{
�� 	
var
�� 
api
�� 
=
�� 
await
�� "
_odsApiFacadeFactory
�� 0
.
��0 1
Create
��1 7
(
��7 8
)
��8 9
;
��9 :
var
�� $
localEducationAgencies
�� &
=
��' (
await
�� 
Page
�� 
<
�� "
LocalEducationAgency
�� /
>
��/ 0
.
��0 1

FetchAsync
��1 ;
(
��; <'
GetLocalEducationAgencies
��< U
,
��U V

pageNumber
��W a
)
��a b
;
��b c
var
�� 
schools
�� 
=
�� 
api
�� 
.
��  
GetSchoolsByLeaIds
�� 0
(
��0 1$
localEducationAgencies
�� &
.
��& '
Items
��' ,
.
��, -
Select
��- 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;%
EducationOrganizationId
��; R
)
��R S
)
��S T
;
��T U
var
�� "
requiredApiDataExist
�� $
=
��% &
(
��' (
await
��( -"
_odsApiFacadeFactory
��. B
.
��B C
Create
��C I
(
��I J
)
��J K
)
��K L
.
��L M
DoesApiDataExist
��M ]
(
��] ^
)
��^ _
;
��_ `
var
�� 
model
�� 
=
�� 
new
�� +
LocalEducationAgencyViewModel
�� 9
{
�� 
Schools
�� 
=
�� 
schools
�� !
,
��! "$
LocalEducationAgencies
�� &
=
��' ($
localEducationAgencies
��) ?
,
��? @*
ShouldAllowMultipleDistricts
�� ,
=
��- .
true
��/ 3
,
��3 4
AddSchoolModel
�� 
=
��  
new
��! $
AddSchoolModel
��% 3
{
�� 
GradeLevelOptions
�� %
=
��& '
api
��( +
.
��+ ,
GetAllGradeLevels
��, =
(
��= >
)
��> ?
,
��? @
StateOptions
��  
=
��! "
api
��# &
.
��& '&
GetAllStateAbbreviations
��' ?
(
��? @
)
��@ A
,
��A B"
RequiredApiDataExist
�� (
=
��) *"
requiredApiDataExist
��+ ?
}
�� 
,
�� *
AddLocalEducationAgencyModel
�� ,
=
��- .
new
��/ 2*
AddLocalEducationAgencyModel
��3 O
{
�� 5
'LocalEducationAgencyCategoryTypeOptions
�� ;
=
��< =
api
��> A
.
��A B/
!GetLocalEducationAgencyCategories
��B c
(
��c d
)
��d e
,
��e f
StateOptions
��  
=
��! "
api
��# &
.
��& '&
GetAllStateAbbreviations
��' ?
(
��? @
)
��@ A
,
��A B"
RequiredApiDataExist
�� (
=
��) *"
requiredApiDataExist
��+ ?
}
�� 
}
�� 
;
�� 
return
�� 
PartialView
�� 
(
�� 
$str
�� 8
,
��8 9
model
��: ?
)
��? @
;
��@ A
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '+
PostSecondaryInstitutionsList
��( E
(
��E F
int
��F I

pageNumber
��J T
)
��T U
{
�� 	
var
�� 
api
�� 
=
�� 
await
�� "
_odsApiFacadeFactory
�� 0
.
��0 1
Create
��1 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
schools
�� 
=
�� 
api
�� 
.
�� 
GetAllPsiSchools
�� .
(
��. /
)
��/ 0
;
��0 1
var
�� '
postSecondaryInstitutions
�� )
=
��* +
await
�� 
Page
�� 
<
�� &
PostSecondaryInstitution
�� 3
>
��3 4
.
��4 5

FetchAsync
��5 ?
(
��? @*
GetPostSecondaryInstitutions
��@ \
,
��\ ]

pageNumber
��^ h
)
��h i
;
��i j
var
�� "
requiredApiDataExist
�� $
=
��% &
(
��' (
await
��( -"
_odsApiFacadeFactory
��. B
.
��B C
Create
��C I
(
��I J
)
��J K
)
��K L
.
��L M
DoesApiDataExist
��M ]
(
��] ^
)
��^ _
;
��_ `
var
�� 
model
�� 
=
�� 
new
�� /
!PostSecondaryInstitutionViewModel
�� =
{
�� 
Schools
�� 
=
�� 
schools
�� !
,
��! "'
PostSecondaryInstitutions
�� )
=
��* +'
postSecondaryInstitutions
��, E
,
��E F
AddPsiSchoolModel
�� !
=
��" #
new
��$ '
AddPsiSchoolModel
��( 9
{
�� 
GradeLevelOptions
�� %
=
��& '
api
��( +
.
��+ ,
GetAllGradeLevels
��, =
(
��= >
)
��> ?
,
��? @
StateOptions
��  
=
��! "
api
��# &
.
��& '&
GetAllStateAbbreviations
��' ?
(
��? @
)
��@ A
,
��A B&
FederalLocaleCodeOptions
�� ,
=
��- .
await
��/ 40
"CheckAndFillIfTpdmCommunityVersion
��5 W
(
��W X
api
��X [
.
��[ \#
GetFederalLocaleCodes
��\ q
)
��q r
,
��r s(
AccreditationStatusOptions
�� .
=
��/ 0
await
��1 60
"CheckAndFillIfTpdmCommunityVersion
��7 Y
(
��Y Z
api
��Z ]
.
��] ^+
GetAccreditationStatusOptions
��^ {
)
��{ |
,
��| }"
RequiredApiDataExist
�� (
=
��) *"
requiredApiDataExist
��+ ?
}
�� 
,
�� .
 AddPostSecondaryInstitutionModel
�� 0
=
��1 2
new
��3 6.
 AddPostSecondaryInstitutionModel
��7 W
{
�� 2
$PostSecondaryInstitutionLevelOptions
�� 8
=
��9 :&
BuildListWithEmptyOption
��; S
(
��S T
api
��T W
.
��W X/
!GetPostSecondaryInstitutionLevels
��X y
)
��y z
,
��z {1
#AdministrativeFundingControlOptions
�� 7
=
��8 9&
BuildListWithEmptyOption
��: R
(
��R S
api
��S V
.
��V W.
 GetAdministrativeFundingControls
��W w
)
��w x
,
��x y
StateOptions
��  
=
��! "
api
��# &
.
��& '&
GetAllStateAbbreviations
��' ?
(
��? @
)
��@ A
,
��A B"
RequiredApiDataExist
�� (
=
��) *"
requiredApiDataExist
��+ ?
}
�� 
}
�� 
;
�� 
return
�� 
PartialView
�� 
(
�� 
$str
�� ;
,
��; <
model
��= B
)
��B C
;
��C D
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
IReadOnlyList
�� (
<
��( )"
LocalEducationAgency
��) =
>
��= >
>
��> ?'
GetLocalEducationAgencies
��@ Y
(
��Y Z
int
��Z ]
offset
��^ d
,
��d e
int
��f i
limit
��j o
)
��o p
{
�� 	
var
�� 
api
�� 
=
�� 
await
�� "
_odsApiFacadeFactory
�� 0
.
��0 1
Create
��1 7
(
��7 8
)
��8 9
;
��9 :
var
�� $
localEducationAgencies
�� &
=
��' (
api
��) ,
.
��, --
GetLocalEducationAgenciesByPage
��- L
(
��L M
offset
��M S
,
��S T
limit
��U Z
)
��Z [
;
��[ \
return
�� $
localEducationAgencies
�� )
;
��) *
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
IReadOnlyList
�� (
<
��( )&
PostSecondaryInstitution
��) A
>
��A B
>
��B C*
GetPostSecondaryInstitutions
��D `
(
��` a
int
��a d
offset
��e k
,
��k l
int
��m p
limit
��q v
)
��v w
{
�� 	
var
�� 
api
�� 
=
�� 
await
�� "
_odsApiFacadeFactory
�� 0
.
��0 1
Create
��1 7
(
��7 8
)
��8 9
;
��9 :
var
�� '
postSecondaryInstitutions
�� )
=
��* +
api
��, /
.
��/ 00
"GetPostSecondaryInstitutionsByPage
��0 R
(
��R S
offset
��S Y
,
��Y Z
limit
��[ `
)
��` a
;
��a b
return
�� '
postSecondaryInstitutions
�� ,
;
��, -
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '(
DeleteLocalEducationAgency
��( B
(
��B C.
 DeleteEducationOrganizationModel
��C c
model
��d i
)
��i j
{
�� 	
var
�� 
deletionResult
�� 
=
��  
(
��! "
await
��" '"
_odsApiFacadeFactory
��( <
.
��< =
Create
��= C
(
��C D
)
��D E
)
��E F
.
��F G(
DeleteLocalEducationAgency
��G a
(
��a b
model
��b g
.
��g h
Id
��h j
)
��j k
;
��k l
return
�� 
deletionResult
�� !
.
��! "
Success
��" )
?
��* +
JsonSuccess
��, 7
(
��7 8
$str
��8 N
)
��N O
:
��P Q
	JsonError
��R [
(
��[ \
deletionResult
��\ j
.
��j k
ErrorMessage
��k w
)
��w x
;
��x y
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& ',
DeletePostSecondaryInstitution
��( F
(
��F G.
 DeleteEducationOrganizationModel
��G g
model
��h m
)
��m n
{
�� 	
var
�� 
deletionResult
�� 
=
��  
(
��! "
await
��" '"
_odsApiFacadeFactory
��( <
.
��< =
Create
��= C
(
��C D
)
��D E
)
��E F
.
��F G,
DeletePostSecondaryInstitution
��G e
(
��e f
model
��f k
.
��k l
Id
��l n
)
��n o
;
��o p
return
�� 
deletionResult
�� !
.
��! "
Success
��" )
?
��* +
JsonSuccess
��, 7
(
��7 8
$str
��8 \
)
��\ ]
:
��^ _
	JsonError
��` i
(
��i j
deletionResult
��j x
.
��x y
ErrorMessage��y �
)��� �
;��� �
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
DeleteSchool
��( 4
(
��4 5.
 DeleteEducationOrganizationModel
��5 U
model
��V [
)
��[ \
{
�� 	
var
�� 
deletionResult
�� 
=
��  
(
��! "
await
��" '"
_odsApiFacadeFactory
��( <
.
��< =
Create
��= C
(
��C D
)
��D E
)
��E F
.
��F G
DeleteSchool
��G S
(
��S T
model
��T Y
.
��Y Z
Id
��Z \
)
��\ ]
;
��] ^
return
�� 
deletionResult
�� !
.
��! "
Success
��" )
?
��* +
JsonSuccess
��, 7
(
��7 8
$str
��8 H
)
��H I
:
��J K
	JsonError
��L U
(
��U V
deletionResult
��V d
.
��d e
ErrorMessage
��e q
)
��q r
;
��r s
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
TpdmEnabled
��! ,
(
��, -
)
��- .
{
�� 	
var
�� 
versionDetails
�� 
=
��  
await
��! &%
GetTpdmExtensionDetails
��' >
(
��> ?
)
��? @
;
��@ A
return
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� (
(
��( )
versionDetails
��) 7
?
��7 8
.
��8 9
TpdmVersion
��9 D
)
��D E
;
��E F
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� "
TpdmExtensionDetails
�� /
>
��/ 0%
GetTpdmExtensionDetails
��1 H
(
��H I
)
��I J
{
�� 	
return
�� 
await
�� 
InMemoryCache
�� &
.
��& '
Instance
��' /
.
��/ 0
GetOrSet
��0 8
(
��8 9
$str
�� &
,
��& '
async
��( -
(
��. /
)
��/ 0
=>
��1 3
await
�� $
_inferExtensionDetails
�� /
.
��/ 0"
TpdmExtensionVersion
��0 D
(
��D E&
CloudOdsAdminAppSettings
�� 0
.
��0 1
Instance
��1 9
.
��9 :
ProductionApiUrl
��: J
)
��J K
)
��K L
;
��L M
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
SelectOptionModel
��  1
>
��1 2
>
��2 30
"CheckAndFillIfTpdmCommunityVersion
��4 V
(
��V W
Func
��W [
<
��[ \
List
��\ `
<
��` a
SelectOptionModel
��a r
>
��r s
>
��s t

optionList
��u 
)�� �
{
�� 	
var
�� 
details
�� 
=
�� 
await
�� %
GetTpdmExtensionDetails
��  7
(
��7 8
)
��8 9
;
��9 :
return
�� 
details
�� 
.
�� $
IsTpdmCommunityVersion
�� 1
?
��2 3&
BuildListWithEmptyOption
��4 L
(
��L M

optionList
��M W
)
��W X
:
��Y Z
null
��[ _
;
��_ `
}
�� 	
private
�� 
List
�� 
<
�� 
SelectOptionModel
�� &
>
��& '&
BuildListWithEmptyOption
��( @
(
��@ A
Func
��A E
<
��E F
List
��F J
<
��J K
SelectOptionModel
��K \
>
��\ ]
>
��] ^!
getSelectOptionList
��_ r
)
��r s
{
�� 	
var
�� 
selectOptionList
��  
=
��! "
new
��# &
List
��' +
<
��+ ,
SelectOptionModel
��, =
>
��= >
{
�� 
new
�� 
SelectOptionModel
�� %
{
�� 
DisplayText
�� 
=
��  !
$str
��" $
,
��$ %
Value
�� 
=
�� 
null
��  
}
�� 
}
�� 
;
�� 
selectOptionList
�� 
.
�� 
AddRange
�� %
(
��% &!
getSelectOptionList
��& 9
.
��9 :
Invoke
��: @
(
��@ A
)
��A B
)
��B C
;
��C D
return
�� 
selectOptionList
�� #
;
��# $
}
�� 	
private
�� 
ActionResult
�� %
ValidationFailureResult
�� 4
(
��4 5
string
��5 ;
modelStateKey
��< I
,
��I J
string
��K Q
errorMessage
��R ^
)
��^ _
{
�� 	

ModelState
�� 
.
�� 
AddModelError
�� $
(
��$ %
modelStateKey
��% 2
,
��2 3
errorMessage
��4 @
)
��@ A
;
��A B
return
�� 
new
�� 
ContentResult
�� $
{
�� 
Content
�� 
=
�� 
JsonConvert
�� %
.
��% &
SerializeObject
��& 5
(
��5 6

ModelState
�� 
,
�� 
new
�� $
JsonSerializerSettings
�� .
{
��/ 0#
ReferenceLoopHandling
��0 E
=
��F G#
ReferenceLoopHandling
��H ]
.
��] ^
Ignore
��^ d
}
��d e
)
��e f
,
��f g
ContentType
�� 
=
�� 
$str
�� 0
,
��0 1

StatusCode
�� 
=
�� 
$num
��  
}
�� 
;
�� 
}
�� 	
}
�� 
}�� �|
cC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\GlobalSettingsController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ '
BypassInstanceContextFilter  
]  !
[ 
PermissionRequired 
( 

Permission "
." # 
AccessGlobalSettings# 7
)7 8
]8 9
public 

class $
GlobalSettingsController )
:* +
ControllerBase, :
{   
private!! 
readonly!! 
AddVendorCommand!! )
_addVendorCommand!!* ;
;!!; <
private"" 
readonly"" $
ICloudOdsSettingsService"" 1$
_cloudOdsSettingsService""2 J
;""J K
private## 
readonly## 
DeleteVendorCommand## , 
_deleteVendorCommand##- A
;##A B
private$$ 
readonly$$ 
EditVendorCommand$$ *
_editVendorCommand$$+ =
;$$= >
private%% 
readonly%% 
IGetVendorByIdQuery%% ,
_getVendorByIdQuery%%- @
;%%@ A
private&& 
readonly&& 
IGetVendorsQuery&& )
_getVendorsQuery&&* :
;&&: ;
private'' 
readonly'' 
IMapper''  
_mapper''! (
;''( )
private(( 
readonly(( 
ITabDisplayService(( +
_tabDisplayService((, >
;((> ?
private)) 
readonly)) /
#IGetClaimSetsByApplicationNameQuery)) </
#_getClaimSetsByApplicationNameQuery))= `
;))` a
private** 
readonly** !
GetAdminAppUsersQuery** ."
_getAdminAppUsersQuery**/ E
;**E F
private++ 
readonly++ 
AppSettings++ $
_appSettings++% 1
;++1 2
public-- $
GlobalSettingsController-- '
(--' (
IMapper--( /
mapper--0 6
,.. 
IGetVendorsQuery.. 
getVendorsQuery.. .
,// 
AddVendorCommand// 
addVendorCommand// /
,00 
DeleteVendorCommand00 !
deleteVendorCommand00" 5
,11 
IGetVendorByIdQuery11 !
getVendorByIdQuery11" 4
,22 
EditVendorCommand22 
editVendorCommand22  1
,33 $
ICloudOdsSettingsService33 &#
cloudOdsSettingsService33' >
,44 
ITabDisplayService44  
tabDisplayService44! 2
,55 /
#IGetClaimSetsByApplicationNameQuery55 1.
"getClaimSetsByApplicationNameQuery552 T
,66 !
GetAdminAppUsersQuery66 #!
getAdminAppUsersQuery66$ 9
,77 
IOptions77 
<77 
AppSettings77 "
>77" #
appSettingsAccessor77$ 7
)777 8
{88 	
_mapper99 
=99 
mapper99 
;99 
_getVendorsQuery:: 
=:: 
getVendorsQuery:: .
;::. /
_addVendorCommand;; 
=;; 
addVendorCommand;;  0
;;;0 1 
_deleteVendorCommand<<  
=<<! "
deleteVendorCommand<<# 6
;<<6 7
_getVendorByIdQuery== 
===  !
getVendorByIdQuery==" 4
;==4 5
_editVendorCommand>> 
=>>  
editVendorCommand>>! 2
;>>2 3$
_cloudOdsSettingsService?? $
=??% &#
cloudOdsSettingsService??' >
;??> ?
_tabDisplayService@@ 
=@@  
tabDisplayService@@! 2
;@@2 3/
#_getClaimSetsByApplicationNameQueryAA /
=AA0 1.
"getClaimSetsByApplicationNameQueryAA2 T
;AAT U"
_getAdminAppUsersQueryBB "
=BB# $!
getAdminAppUsersQueryBB% :
;BB: ;
_appSettingsCC 
=CC 
appSettingsAccessorCC .
.CC. /
ValueCC/ 4
;CC4 5
}DD 	
publicFF 
ActionResultFF 
VendorsFF #
(FF# $
)FF$ %
{GG 	
varHH 
vendorsHH 
=HH 
_getVendorsQueryHH *
.II 
ExecuteII 
(II 
)II 
;II 
varKK 
modelKK 
=KK 
newKK 
GlobalSettingsModelKK /
{LL 
VendorListModelMM 
=MM  !
newMM" %
VendorsListModelMM& 6
{NN 
VendorsOO 
=OO 
_mapperOO %
.OO% &
MapOO& )
<OO) *
ListOO* .
<OO. /
VendorOverviewModelOO/ B
>OOB C
>OOC D
(OOD E
vendorsOOE L
)OOL M
}PP 
,PP )
GlobalSettingsTabEnumerationsQQ -
=QQ. /
_tabDisplayServiceRR &
.RR& ''
GetGlobalSettingsTabDisplayRR' B
(RRB C(
GlobalSettingsTabEnumerationSS 4
.SS4 5
VendorsSS5 <
)SS< =
}TT 
;TT 
returnVV 
ViewVV 
(VV 
modelVV 
)VV 
;VV 
}WW 	
publicYY 
ActionResultYY 
	ClaimSetsYY %
(YY% &
)YY& '
{ZZ 	
var[[ 
model[[ 
=[[ 
new[[ 
GlobalSettingsModel[[ /
{\\ 
ClaimSetEditorModel]] #
=]]$ %
new]]& )
ClaimSetEditorModel]]* =
{^^ 
	ClaimSets__ 
=__ /
#_getClaimSetsByApplicationNameQuery__  C
.__C D
Execute__D K
(__K L
CloudOdsAdminApp__L \
.__\ ]*
SecurityContextApplicationName__] {
)__{ |
}`` 
,`` )
GlobalSettingsTabEnumerationsaa -
=aa. /
_tabDisplayServicebb &
.bb& ''
GetGlobalSettingsTabDisplaybb' B
(bbB C(
GlobalSettingsTabEnumerationcc 4
.cc4 5
	ClaimSetscc5 >
)cc> ?
}dd 
;dd 
returnff 
Viewff 
(ff 
modelff 
)ff 
;ff 
}gg 	
publicii 
ActionResultii 
Usersii !
(ii! "
)ii" #
{jj 	
varkk 
userskk 
=kk "
_getAdminAppUsersQuerykk .
.kk. /
Executekk/ 6
(kk6 7
)kk7 8
;kk8 9
varmm 
modelmm 
=mm 
newmm 
GlobalSettingsModelmm /
{nn 
UserIndexModeloo 
=oo  
newoo! $
UserIndexModeloo% 3
{pp 
Usersqq 
=qq 
_mapperqq #
.qq# $
Mapqq$ '
<qq' (
Listqq( ,
<qq, -
	UserModelqq- 6
>qq6 7
>qq7 8
(qq8 9
usersqq9 >
)qq> ?
}rr 
,rr )
GlobalSettingsTabEnumerationsss -
=ss. /
_tabDisplayServicett &
.tt& ''
GetGlobalSettingsTabDisplaytt' B
(ttB C(
GlobalSettingsTabEnumerationuu 4
.uu4 5
Usersuu5 :
)uu: ;
}vv 
;vv 
returnxx 
Viewxx 
(xx 
modelxx 
)xx 
;xx 
}yy 	
[{{ 	
HttpPost{{	 
]{{ 
public|| 
ActionResult|| 
	AddVendor|| %
(||% &
AddVendorModel||& 4
model||5 :
)||: ;
{}} 	
_addVendorCommand~~ 
.~~ 
Execute~~ %
(~~% &
model~~& +
)~~+ ,
;~~, -
return  
RedirectToActionJson '
<' ($
GlobalSettingsController( @
>@ A
(A B
xB C
=>D F
xG H
.H I
VendorsI P
(P Q
)Q R
,R S
$strT o
)o p
;p q
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
DeleteVendor
�� (
(
��( )
DeleteVendorModel
��) :
model
��; @
)
��@ A
{
�� 	
try
�� 
{
�� "
_deleteVendorCommand
�� $
.
��$ %
Execute
��% ,
(
��, -
model
��- 2
.
��2 3
VendorId
��3 ;
)
��; <
;
��< =
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
�� 
{
�� 
return
�� 
	JsonError
��  
(
��  !
ex
��! #
.
��# $
Message
��$ +
)
��+ ,
;
��, -
}
�� 
return
�� "
RedirectToActionJson
�� '
<
��' (&
GlobalSettingsController
��( @
>
��@ A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
Vendors
��I P
(
��P Q
)
��Q R
,
��R S
$str
��T q
)
��q r
;
��r s
}
�� 	
public
�� 
ActionResult
�� 

EditVendor
�� &
(
��& '
int
��' *
id
��+ -
)
��- .
{
�� 	
var
�� 
vendor
�� 
=
�� !
_getVendorByIdQuery
�� ,
.
��, -
Execute
��- 4
(
��4 5
id
��5 7
)
��7 8
;
��8 9
var
�� 
model
�� 
=
�� 
_mapper
�� 
.
��  
Map
��  #
<
��# $
EditVendorModel
��$ 3
>
��3 4
(
��4 5
vendor
��5 ;
)
��; <
;
��< =
return
�� 
PartialView
�� 
(
�� 
$str
�� 0
,
��0 1
model
��2 7
)
��7 8
;
��8 9
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 

EditVendor
�� &
(
��& '
EditVendorModel
��' 6
model
��7 <
)
��< =
{
�� 	
try
�� 
{
��  
_editVendorCommand
�� "
.
��" #
Execute
��# *
(
��* +
model
��+ 0
)
��0 1
;
��1 2
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
	JsonError
��  
(
��  !
ex
��! #
.
��# $
Message
��$ +
)
��+ ,
;
��, -
}
�� 
return
�� "
RedirectToActionJson
�� '
<
��' (&
GlobalSettingsController
��( @
>
��@ A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
Vendors
��I P
(
��P Q
)
��Q R
,
��R S
$str
��T q
)
��q r
;
��r s
}
�� 	
public
�� 
ActionResult
��  
DefineApplications
�� .
(
��. /
)
��/ 0
{
�� 	
TempData
�� 
[
�� 
$str
�� +
]
��+ ,
=
��- .
true
��/ 3
;
��3 4
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- ;
)
��; <
;
��< =
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
AdvancedSettings
��( 8
(
��8 9
)
��9 :
{
�� 	
var
�� 
currentSettings
�� 
=
��  !
await
��" '&
_cloudOdsSettingsService
��( @
.
��@ A
GetSettings
��A L
(
��L M
_appSettings
��M Y
.
��Y Z 
DefaultOdsInstance
��Z l
)
��l m
;
��m n
var
�� 
model
�� 
=
�� 
new
�� !
GlobalSettingsModel
�� /
{
�� #
AdvancedSettingsModel
�� %
=
��& '
new
��( +#
AdvancedSettingsModel
��, A
{
�� )
BearerTokenTimeoutInMinutes
�� /
=
��0 1
currentSettings
��2 A
.
��A B)
BearerTokenTimeoutInMinutes
��B ]
}
�� 
,
�� +
GlobalSettingsTabEnumerations
�� -
=
��. / 
_tabDisplayService
�� &
.
��& ')
GetGlobalSettingsTabDisplay
��' B
(
��B C*
GlobalSettingsTabEnumeration
�� 4
.
��4 5
AdvancedSettings
��5 E
)
��E F
}
�� 
;
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '$
UpdateAdvancedSettings
��( >
(
��> ?!
GlobalSettingsModel
��? R
model
��S X
)
��X Y
{
�� 	
var
�� 
instanceSettings
��  
=
��! "
await
��# (&
_cloudOdsSettingsService
��) A
.
��A B
GetSettings
��B M
(
��M N
_appSettings
��N Z
.
��Z [ 
DefaultOdsInstance
��[ m
)
��m n
;
��n o
instanceSettings
�� 
.
�� )
BearerTokenTimeoutInMinutes
�� 8
=
��9 :
model
��; @
.
��@ A#
AdvancedSettingsModel
��A V
.
��V W)
BearerTokenTimeoutInMinutes
��W r
;
��r s
await
�� &
_cloudOdsSettingsService
�� *
.
��* +
UpdateSettings
��+ 9
(
��9 :
_appSettings
��: F
.
��F G 
DefaultOdsInstance
��G Y
,
��Y Z
instanceSettings
��[ k
)
��k l
;
��l m
return
�� "
RedirectToActionJson
�� '
<
��' (&
GlobalSettingsController
��( @
>
��@ A
(
��A B
x
�� 
=>
�� 
x
�� 
.
�� 
AdvancedSettings
�� '
(
��' (
)
��( )
,
��) *
$str
��+ J
)
��J K
;
��K L
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
UpdateLogSettings
��( 9
(
��9 :
int
��: =
logLevel
��> F
)
��F G
{
�� 	
var
�� 
parsedLogLevel
�� 
=
��  
LogLevel
��! )
.
��) *
	FromInt32
��* 3
(
��3 4
logLevel
��4 <
)
��< =
;
��= >
var
�� 
settings
�� 
=
�� 
await
��  &
_cloudOdsSettingsService
��! 9
.
��9 :
GetSettings
��: E
(
��E F
_appSettings
��F R
.
��R S 
DefaultOdsInstance
��S e
)
��e f
;
��f g
settings
�� 
.
�� 
LogLevel
�� 
=
�� 
parsedLogLevel
��  .
;
��. /
await
�� &
_cloudOdsSettingsService
�� *
.
��* +
UpdateSettings
��+ 9
(
��9 :
_appSettings
��: F
.
��F G 
DefaultOdsInstance
��G Y
,
��Y Z
settings
��[ c
)
��c d
;
��d e
return
�� 
JsonSuccess
�� 
(
�� 
$str
�� B
)
��B C
;
��C D
}
�� 	
}
�� 
}�� �%
YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\HomeController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ 
AllowAnonymous 
, '
BypassInstanceContextFilter 0
]0 1
public 

class 
HomeController 
:  !
ControllerBase" 0
{ 
private 
readonly %
IHomeScreenDisplayService 2%
_homeScreenDisplayService3 L
;L M
private 
readonly 
ILog 
_logger %
=& '

LogManager( 2
.2 3
	GetLogger3 <
(< =
typeof= C
(C D
HomeControllerD R
)R S
)S T
;T U
public 
HomeController 
( %
IHomeScreenDisplayService 7$
homeScreenDisplayService8 P
)P Q
{ 	%
_homeScreenDisplayService %
=& '$
homeScreenDisplayService( @
;@ A
} 	
public 
ActionResult 
Index !
(! "
bool" &
setupCompleted' 5
=6 7
false8 =
)= >
{ 	
var   
model   
=   
new   

IndexModel   &
{!! 
SetupJustCompleted"" "
=""# $
setupCompleted""% 3
,""3 4
HomeScreenDisplays## "
=### $%
_homeScreenDisplayService##% >
.##> ?!
GetHomeScreenDisplays##? T
(##T U
)##U V
}$$ 
;$$ 
return&& 
View&& 
(&& 
model&& 
)&& 
;&& 
}'' 	
public)) 
ActionResult)) 
	PostSetup)) %
())% &
bool))& *
setupCompleted))+ 9
=)): ;
false))< A
)))A B
{** 	
bool++ 
.++ 
TryParse++ 
(++ 
Request++ !
.++! "
Cookies++" )
[++) *
$str++* ;
]++; <
,++< =
out++> A
var++B E
isRestartRequired++F W
)++W X
;++X Y
Response,, 
.,, 
Cookies,, 
.,, 
Delete,, #
(,,# $
$str,,$ 5
),,5 6
;,,6 7
if.. 
(.. 
setupCompleted.. 
&&.. !
isRestartRequired.." 3
)..3 4
{// 
return00 
View00 
(00 
)00 
;00 
}11 
return33 
RedirectToAction33 #
(33# $
$str33$ +
,33+ ,
new33- 0
{331 2
setupCompleted333 A
}33B C
)33C D
;33D E
}44 	
public66 
ActionResult66 
Error66 !
(66! "
)66" #
{77 	
var88 #
exceptionHandlerFeature88 '
=88( )
HttpContext88* 5
.885 6
Features886 >
.88> ?
Get88? B
<88B C(
IExceptionHandlerPathFeature88C _
>88_ `
(88` a
)88a b
;88b c
var99 
	exception99 
=99 #
exceptionHandlerFeature99 3
?993 4
.994 5
Error995 :
??99; =
new99> A
	Exception99B K
(99K L
)99L M
;99M N
_logger;; 
.;; 
Error;; 
(;; 
	exception;; #
);;# $
;;;$ %
var== 

errorModel== 
=== 
new==  

ErrorModel==! +
(==+ ,
	exception==, 5
,==5 6
HttpContext==6 A
.==A B
User==B F
.==F G
Identity==G O
.==O P
IsAuthenticated==P _
)==_ `
;==` a
return?? 
HttpContext?? 
.?? 
Request?? &
.??& '
IsAjaxRequest??' 4
(??4 5
)??5 6
?@@ 
(@@ 
ActionResult@@ 
)@@  
PartialView@@! ,
(@@, -
$str@@- =
,@@= >

errorModel@@? I
)@@I J
:AA 
ViewAA 
(AA 

errorModelAA !
)AA! "
;AA" #
}BB 	
publicDD 
ActionResultDD 
UserUnauthorizedDD ,
(DD, -
)DD- .
=>DD/ 1
ViewDD2 6
(DD6 7
)DD7 8
;DD8 9
}EE 
}FF �r
]C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\IdentityController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ %
BypassSetupRequiredFilter 
, .
"BypassPasswordChangeRequiredFilter  B
,B C'
BypassInstanceContextFilterD _
]_ `
public 

class 
IdentityController #
:$ %
ControllerBase& 4
{ 
private 
readonly +
ApplicationConfigurationService 8%
_applicationConfiguration9 R
;R S
private 
readonly 
SignInManager &
<& '
AdminAppUser' 3
>3 4
_signInManager5 C
;C D
private 
readonly 
UserManager $
<$ %
AdminAppUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
RegisterCommand (
_registerCommand) 9
;9 :
private   
readonly   
EditUserRoleCommand   , 
_editUserRoleCommand  - A
;  A B
private!! 
readonly!! !
IGetOdsInstancesQuery!! .!
_getOdsInstancesQuery!!/ D
;!!D E
private"" 
readonly"" %
AdminAppIdentityDbContext"" 2
	_identity""3 <
;""< =
public$$ 
IdentityController$$ !
($$! "+
ApplicationConfigurationService$$" A$
applicationConfiguration$$B Z
,$$Z [
RegisterCommand$$\ k
registerCommand$$l {
,$${ | 
EditUserRoleCommand	$$} �!
editUserRoleCommand
$$� �
,
$$� �#
IGetOdsInstancesQuery
$$� �"
getOdsInstancesQuery
$$� �
,
$$� �
SignInManager%% 
<%% 
AdminAppUser%% &
>%%& '
signInManager%%( 5
,%%5 6
UserManager&& 
<&& 
AdminAppUser&& $
>&&$ %
userManager&&& 1
,&&1 2%
AdminAppIdentityDbContext'' %
identity''& .
)''. /
{(( 	%
_applicationConfiguration)) %
=))& '$
applicationConfiguration))( @
;))@ A
_registerCommand** 
=** 
registerCommand** .
;**. / 
_editUserRoleCommand++  
=++! "
editUserRoleCommand++# 6
;++6 7!
_getOdsInstancesQuery,, !
=,," # 
getOdsInstancesQuery,,$ 8
;,,8 9
_signInManager-- 
=-- 
signInManager-- *
;--* +
_userManager.. 
=.. 
userManager.. &
;..& '
	_identity// 
=// 
identity//  
;//  !
}00 	
[22 	
AllowAnonymous22	 
]22 
public33 
async33 
Task33 
<33 
ActionResult33 &
>33& '
Login33( -
(33- .
string33. 4
	returnUrl335 >
)33> ?
{44 	
	returnUrl55 
??=55 
Url55 
.55 
Content55 %
(55% &
$str55& *
)55* +
;55+ ,
await88 
HttpContext88 
.88 
SignOutAsync88 *
(88* +
IdentityConstants88+ <
.88< =
ExternalScheme88= K
)88K L
;88L M
ViewBag:: 
.:: 
	ReturnUrl:: 
=:: 
	returnUrl::  )
;::) *
return<< 
View<< 
(<< 
new<< 
LoginViewModel<< *
{== !
AllowUserRegistration>> %
=>>& '%
_applicationConfiguration>>( A
.>>A B!
AllowUserRegistration>>B W
(>>W X
)>>X Y
}?? 
)?? 
;?? 
}@@ 	
[BB 	
HttpPostBB	 
]BB 
[CC 	
AllowAnonymousCC	 
]CC 
publicDD 
asyncDD 
TaskDD 
<DD 
ActionResultDD &
>DD& '
LoginDD( -
(DD- .
LoginViewModelDD. <
modelDD= B
,DDB C
stringDDD J
	returnUrlDDK T
)DDT U
{EE 	
	returnUrlFF 
??=FF 
UrlFF 
.FF 
ContentFF %
(FF% &
$strFF& *
)FF* +
;FF+ ,
ifHH 
(HH 
!HH 

ModelStateHH 
.HH 
IsValidHH #
)HH# $
returnII 
ViewII 
(II 
modelII !
)II! "
;II" #
varKK 
resultKK 
=KK 
awaitKK 
_signInManagerKK -
.KK- .
PasswordSignInAsyncKK. A
(KKA B
modelKKB G
.KKG H
EmailKKH M
,KKM N
modelKKO T
.KKT U
PasswordKKU ]
,KK] ^
modelKK_ d
.KKd e

RememberMeKKe o
,KKo p
lockoutOnFailure	KKq �
:
KK� �
true
KK� �
)
KK� �
;
KK� �
ifMM 
(MM 
resultMM 
.MM 
	SucceededMM  
)MM  !
{NN 
varOO 
userOO 
=OO 
awaitOO  
	_identityOO! *
.OO* +
UsersOO+ 0
.OO0 1 
SingleOrDefaultAsyncOO1 E
(OOE F
xOOF G
=>OOH J
xOOK L
.OOL M
UserNameOOM U
==OOV X
modelOOY ^
.OO^ _
EmailOO_ d
)OOd e
;OOe f
returnQQ 
RedirectToLocalQQ &
(QQ& '
	returnUrlQQ' 0
)QQ0 1
;QQ1 2
}RR 
ifSS 
(SS 
resultSS 
.SS 
RequiresTwoFactorSS (
)SS( )
{TT 
throwUU 
newUU !
NotSupportedExceptionUU /
(UU/ 0
$strUU0 ]
)UU] ^
;UU^ _
}VV 
ifWW 
(WW 
resultWW 
.WW 
IsLockedOutWW "
)WW" #
{XX 
returnYY 
ViewYY 
(YY 
$strYY %
)YY% &
;YY& '
}ZZ 
else[[ 
{\\ 

ModelState]] 
.]] 
AddModelError]] (
(]]( )
$str]]) +
,]]+ ,
$str]]- E
)]]E F
;]]F G
return^^ 
View^^ 
(^^ 
model^^ !
)^^! "
;^^" #
}__ 
}`` 	
[bb 	
AllowAnonymousbb	 
]bb 
publiccc 
ActionResultcc 
Registercc $
(cc$ %
)cc% &
{dd 	
ifee 
(ee 
!ee %
_applicationConfigurationee *
.ee* +!
AllowUserRegistrationee+ @
(ee@ A
)eeA B
)eeB C
returnff 
RedirectToActionff '
(ff' (
$strff( /
)ff/ 0
;ff0 1
returnhh 
Viewhh 
(hh 
)hh 
;hh 
}ii 	
[kk 	
HttpPostkk	 
]kk 
[ll 	
AllowAnonymousll	 
]ll 
publicmm 
asyncmm 
Taskmm 
<mm 
ActionResultmm &
>mm& '
Registermm( 0
(mm0 1
RegisterViewModelmm1 B
modelmmC H
)mmH I
{nn 	
ifoo 
(oo 
!oo %
_applicationConfigurationoo *
.oo* +!
AllowUserRegistrationoo+ @
(oo@ A
)ooA B
)ooB C
returnpp 
RedirectToActionpp '
(pp' (
$strpp( /
)pp/ 0
;pp0 1
ifrr 
(rr 

ModelStaterr 
.rr 
IsValidrr "
)rr" #
{ss 
vartt 
(tt 
adminAppUsertt !
,tt! "
resulttt# )
)tt) *
=tt+ ,
awaittt- 2
_registerCommandtt3 C
.ttC D
ExecutettD K
(ttK L
modelttL Q
,ttQ R
_userManagerttS _
)tt_ `
;tt` a
ifvv 
(vv 
resultvv 
.vv 
	Succeededvv $
)vv$ %
{ww  
_editUserRoleCommandxx (
.xx( )
Executexx) 0
(xx0 1
newxx1 4
EditUserRoleModelxx5 F
{yy 
UserIdzz 
=zz  
adminAppUserzz! -
.zz- .
Idzz. 0
,zz0 1
RoleId{{ 
={{  
Role{{! %
.{{% &

SuperAdmin{{& 0
.{{0 1
Value{{1 6
.{{6 7
ToString{{7 ?
({{? @
){{@ A
}|| 
)|| 
;|| 
await}} 
_signInManager}} (
.}}( )
SignInAsync}}) 4
(}}4 5
adminAppUser}}5 A
,}}A B
isPersistent}}C O
:}}O P
false}}Q V
)}}V W
;}}W X
return 
RedirectToAction +
(+ ,
$str, 3
,3 4
$str5 ;
); <
;< =
}
�� 
	AddErrors
�� 
(
�� 
result
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
ActionResult
�� 
ChangePassword
�� *
(
��* +
)
��+ ,
{
�� 	
ViewBag
�� 
.
�� 
PasswordChanged
�� #
=
��$ %
TempData
��& .
[
��. /
$str
��/ @
]
��@ A
;
��A B
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
ChangePassword
��( 6
(
��6 7%
ChangePasswordViewModel
��7 N
model
��O T
)
��T U
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
return
�� 
View
�� 
(
�� 
model
�� !
)
��! "
;
��" #
var
�� 
user
�� 
=
�� 
await
�� 
_userManager
�� )
.
��) *
GetUserAsync
��* 6
(
��6 7
User
��7 ;
)
��; <
;
��< =
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
return
�� 
NotFound
�� 
(
��  
$"
��  "
$str
��" ?
{
��? @
_userManager
��@ L
.
��L M
	GetUserId
��M V
(
��V W
User
��W [
)
��[ \
}
��\ ]
$str
��] _
"
��_ `
)
��` a
;
��a b
var
�� 
result
�� 
=
�� 
await
�� 
_userManager
�� +
.
��+ ,!
ChangePasswordAsync
��, ?
(
��? @
user
��@ D
,
��D E
model
��F K
.
��K L
OldPassword
��L W
,
��W X
model
��Y ^
.
��^ _
NewPassword
��_ j
)
��j k
;
��k l
if
�� 
(
�� 
result
�� 
.
�� 
	Succeeded
��  
)
��  !
{
�� 
user
�� 
.
�� #
RequirePasswordChange
�� *
=
��+ ,
false
��- 2
;
��2 3
await
�� 
_userManager
�� "
.
��" #
UpdateAsync
��# .
(
��. /
user
��/ 3
)
��3 4
;
��4 5
await
�� 
_signInManager
�� $
.
��$ % 
RefreshSignInAsync
��% 7
(
��7 8
user
��8 <
)
��< =
;
��= >
TempData
�� 
[
�� 
$str
�� *
]
��* +
=
��, -
true
��. 2
;
��2 3
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 8
)
��8 9
;
��9 :
}
�� 
	AddErrors
�� 
(
�� 
result
�� 
)
�� 
;
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
>
��& '
LogOut
��( .
(
��. /
)
��/ 0
{
�� 	
await
�� 
_signInManager
��  
.
��  !
SignOutAsync
��! -
(
��- .
)
��. /
;
��/ 0
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 3
)
��3 4
;
��4 5
}
�� 	
private
�� 
void
�� 
	AddErrors
�� 
(
�� 
IdentityResult
�� -
result
��. 4
)
��4 5
{
�� 	
foreach
�� 
(
�� 
var
�� 
error
�� 
in
�� !
result
��" (
.
��( )
Errors
��) /
)
��/ 0

ModelState
�� 
.
�� 
AddModelError
�� (
(
��( )
$str
��) +
,
��+ ,
error
��- 2
.
��2 3
Description
��3 >
)
��> ?
;
��? @
}
�� 	
private
�� 
ActionResult
�� 
RedirectToLocal
�� ,
(
��, -
string
��- 3
	returnUrl
��4 =
)
��= >
{
�� 	
if
�� 
(
�� 
Url
�� 
.
�� 

IsLocalUrl
�� 
(
�� 
	returnUrl
�� (
)
��( )
)
��) *
return
�� 
Redirect
�� 
(
��  
	returnUrl
��  )
)
��) *
;
��* +
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 3
)
��3 4
;
��4 5
}
�� 	
}
�� 
}�� �&
aC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\OdsInstancesController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ '
BypassInstanceContextFilter  
]  !
public 

class "
OdsInstancesController '
:( )
ControllerBase* 8
{ 
private 
readonly !
IGetOdsInstancesQuery .!
_getOdsInstancesQuery/ D
;D E
private 
readonly 
AdminAppUserContext ,
_userContext- 9
;9 :
private 
readonly %
GetCurrentSchoolYearQuery 2!
_getCurrentSchoolYear3 H
;H I
private 
readonly -
!IOdsInstanceFirstTimeSetupService :-
!_odsInstanceFirstTimeSetupService; \
;\ ]
public "
OdsInstancesController %
(% &!
IGetOdsInstancesQuery ! 
getOdsInstancesQuery" 6
, 
AdminAppUserContext !
userContext" -
, %
GetCurrentSchoolYearQuery ' 
getCurrentSchoolYear( <
,   -
!IOdsInstanceFirstTimeSetupService   /,
 odsInstanceFirstTimeSetupService  0 P
)  P Q
{!! 	!
_getOdsInstancesQuery"" !
=""" # 
getOdsInstancesQuery""$ 8
;""8 9
_userContext## 
=## 
userContext## &
;##& '!
_getCurrentSchoolYear$$ !
=$$" # 
getCurrentSchoolYear$$$ 8
;$$8 9-
!_odsInstanceFirstTimeSetupService%% -
=%%. /,
 odsInstanceFirstTimeSetupService%%0 P
;%%P Q
}&& 	
public(( 

ViewResult(( 
Index(( 
(((  
)((  !
{)) 	
var** 
currentUserId** 
=** 
_userContext**  ,
.**, -
User**- 1
.**1 2
Id**2 4
;**4 5
var++ 
	instances++ 
=++ !
_getOdsInstancesQuery++ 1
.++1 2
Execute++2 9
(++9 :
)++: ;
;++; <
var-- 
model-- 
=-- 
new-- 

IndexModel-- &
{.. 
UserContext// 
=// 
_userContext// *
,//* +
OdsInstances00 
=00 
	instances11 
.11 
Select11 $
(11$ %
x22 
=>22 
new22  
OdsInstanceModel22! 1
{33 
Id44 
=44  
x44! "
.44" #
OdsInstanceId44# 0
,440 1
Name55  
=55! "
x55# $
.55$ %
Name55% )
,55) *
DatabaseName66 (
=66) *
x66+ ,
.66, -
Name66- 1
,661 2
Description77 '
=77( )
x77* +
.77+ ,
Name77, 0
,770 1!
SchoolYearDescription88 1
=882 3!
_getCurrentSchoolYear99  5
.::$ %
Execute::% ,
(::, -
)::- .
?;;$ %
.;;% &!
SchoolYearDescription;;& ;
??;;< >
$str;;? H
}<< 
)<< 
.<< 
ToList<< !
(<<! "
)<<" #
}== 
;== 
return?? 
View?? 
(?? 
model?? 
)?? 
;?? 
}@@ 	
publicBB 
asyncBB 
TaskBB 
<BB 
ActionResultBB &
>BB& '
ActivateOdsInstanceBB( ;
(BB; <
stringBB< B

instanceIdBBC M
)BBM N
{CC 	
ResponseDD 
.DD 
CookiesDD 
.DD 
AppendDD #
(DD# $
$strDD$ .
,DD. /

instanceIdDD0 :
,DD: ;
newDD< ?
CookieOptionsDD@ M
(DDM N
)DDN O
)DDO P
;DDP Q
varEE 
existingOdsInstanceEE #
=EE$ %!
_getOdsInstancesQueryEE& ;
.EE; <
ExecuteEE< C
(EEC D
intEED G
.EEG H
ParseEEH M
(EEM N

instanceIdEEN X
)EEX Y
)EEY Z
;EEZ [
awaitFF -
!_odsInstanceFirstTimeSetupServiceFF 3
.FF3 4
CompleteSetupFF4 A
(FFA B
existingOdsInstanceFFB U
,FFU V1
%CloudOdsAdminAppClaimSetConfigurationFFW |
.FF| }
Default	FF} �
)
FF� �
;
FF� �
returnHH 
RedirectToActionHH #
(HH# $
$strHH$ +
,HH+ ,
$strHH- :
)HH: ;
;HH; <
}II 	
}JJ 
}KK �0
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\OdsInstanceSettingsController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
public 

class )
OdsInstanceSettingsController .
:/ 0
ControllerBase1 ?
{ 
private 
static 
readonly 
ILog  $
_logger% ,
=- .

LogManager/ 9
.9 :
	GetLogger: C
(C D
typeofD J
(J K)
OdsInstanceSettingsControllerK h
)h i
)i j
;j k
private 
readonly $
ICloudOdsSettingsService 1$
_cloudOdsSettingsService2 J
;J K
private 
readonly 
ITabDisplayService +
_tabDisplayService, >
;> ?
private 
readonly 
InstanceContext (
_instanceContext) 9
;9 :
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
private 
readonly "
IInferExtensionDetails /"
_inferExtensionDetails0 F
;F G
private   
readonly   
IInferOdsApiVersion   ,
_inferOdsApiVersion  - @
;  @ A
public"" )
OdsInstanceSettingsController"" ,
("", -$
ICloudOdsSettingsService## %#
cloudOdsSettingsService##& =
,$$ 
ITabDisplayService$$  
tabDisplayService$$! 2
,%% 
InstanceContext%% 
instanceContext%% -
,&& 
IOptions&& 
<&& 
AppSettings&& "
>&&" #
appSettingsAccessor&&$ 7
,'' "
IInferExtensionDetails'' $!
inferExtensionDetails''% :
,(( 
IInferOdsApiVersion(( !
inferOdsApiVersion((" 4
))) 
{** 	$
_cloudOdsSettingsService++ $
=++% &#
cloudOdsSettingsService++' >
;++> ?
_tabDisplayService,, 
=,,  
tabDisplayService,,! 2
;,,2 3
_instanceContext-- 
=-- 
instanceContext-- .
;--. /
_appSettings.. 
=.. 
appSettingsAccessor.. .
.... /
Value../ 4
;..4 5"
_inferExtensionDetails// "
=//# $!
inferExtensionDetails//% :
;//: ;
_inferOdsApiVersion00 
=00  !
inferOdsApiVersion00" 4
;004 5
}11 	
public33 
async33 
Task33 
<33 
ActionResult33 &
>33& '
Logging33( /
(33/ 0
)330 1
{44 	
var55 
settings55 
=55 
await55  $
_cloudOdsSettingsService55! 9
.559 :
GetSettings55: E
(55E F
_appSettings55F R
.55R S
DefaultOdsInstance55S e
)55e f
;55f g
var77 
model77 
=77 
new77 $
OdsInstanceSettingsModel77 4
{88 
LogSettingsModel99  
=99! "
new99# &
LogSettingsModel99' 7
{:: 
LogLevel;; 
=;; 
settings;; '
.;;' (
LogLevel;;( 0
}<< 
,<< .
"OdsInstanceSettingsTabEnumerations== 2
===3 4
_tabDisplayService>> &
.>>& ',
 GetOdsInstanceSettingsTabDisplay>>' G
(>>G H-
!OdsInstanceSettingsTabEnumeration>>H i
.>>i j
Logging>>j q
)>>q r
,>>r s
OdsInstance?? 
=?? 
_instanceContext?? .
}@@ 
;@@ 
returnBB 
ViewBB 
(BB 
modelBB 
)BB 
;BB 
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
ActionResultEE &
>EE& '
OdsVersionMetadataEE( :
(EE: ;
)EE; <
{FF 	
varGG 
modelGG 
=GG 
newGG '
OdsVersionMetadataViewModelGG 7
(GG7 8
)GG8 9
;GG9 :
tryII 
{JJ 
modelKK 
.KK 
OdsApiVersionKK #
=KK$ %
awaitKK& +
InMemoryCacheKK, 9
.KK9 :
InstanceKK: B
.LL 
GetOrSetLL 
(LL 
$strLL -
,LL- .
asyncLL/ 4
(LL5 6
)LL6 7
=>LL8 :
awaitLL; @
_inferOdsApiVersionLLA T
.LLT U
VersionLLU \
(LL\ ]$
CloudOdsAdminAppSettingsLL] u
.LLu v
InstanceLLv ~
.LL~ 
ProductionApiUrl	LL �
)
LL� �
)
LL� �
;
LL� �
varNN 
tpdmVersionDetailsNN &
=NN' (
awaitNN) .
InMemoryCacheNN/ <
.NN< =
InstanceNN= E
.NNE F
GetOrSetNNF N
(NNN O
$strOO *
,OO* +
(OO, -
)OO- .
=>OO/ 1"
_inferExtensionDetailsPP .
.PP. / 
TpdmExtensionVersionPP/ C
(PPC D$
CloudOdsAdminAppSettingsQQ 4
.QQ4 5
InstanceQQ5 =
.QQ= >
ProductionApiUrlQQ> N
)QQN O
)QQO P
;QQP Q
modelSS 
.SS 
TpdmVersionSS !
=SS" #
tpdmVersionDetailsSS$ 6
.SS6 7
TpdmVersionSS7 B
;SSB C
}TT 
catchUU 
(UU 
	ExceptionUU 
	exceptionUU &
)UU& '
{VV 
_loggerWW 
.WW 
ErrorWW 
(WW 
$str	WW �
,
WW� �
	exception
WW� �
)
WW� �
;
WW� �
}XX 
returnZZ 
PartialViewZZ 
(ZZ 
modelZZ $
)ZZ$ %
;ZZ% &
}[[ 	
}\\ 
}]] � 
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\OpenIdConnectController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ %
BypassSetupRequiredFilter 
, '
BypassInstanceContextFilter  ;
]; <
public 

class #
OpenIdConnectController (
:) *
ControllerBase+ 9
{ 
private 
readonly 
IdentitySettings )
_identitySettings* ;
;; <
public #
OpenIdConnectController &
(& '
IOptions' /
</ 0
IdentitySettings0 @
>@ A
identitySettingsB R
)R S
{ 	
_identitySettings 
= 
identitySettings  0
.0 1
Value1 6
;6 7
} 	
[ 	
HttpGet	 
] 
[ 	
AllowAnonymous	 
] 
public   
IActionResult   
Login   "
(  " #
string  # )
	returnUrl  * 3
)  3 4
{!! 	
	returnUrl"" 
??="" 
Url"" 
."" 
Content"" %
(""% &
$str""& *
)""* +
;""+ ,
try$$ 
{%% 
if&& 
(&& 
HttpContext&& 
.&&  
User&&  $
.&&$ %
Identity&&% -
!=&&. 0
null&&1 5
&&&&6 8
!&&9 :
HttpContext&&: E
.&&E F
User&&F J
.&&J K
Identity&&K S
.&&S T
IsAuthenticated&&T c
)&&c d
{'' 
return(( 
new(( 
ChallengeResult(( .
(((. /
_identitySettings)) )
.))) *
OpenIdSettings))* 8
.))8 9 
AuthenticationScheme))9 M
,))M N
new))O R$
AuthenticationProperties))S k
{** 
RedirectUri++ '
=++( )
	returnUrl++* 3
},, 
),, 
;,, 
}-- 
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
$"22 
$str22 i
{22i j
	exception22j s
.22s t
Message22t {
}22{ |
"22| }
)22} ~
{33 

StatusCode44 
=44  
HttpStatusCode44! /
.44/ 0
InternalServerError440 C
}55 
;55 
}66 
return88 
RedirectToAction88 #
(88# $
$str88$ +
,88+ ,
$str88- 3
)883 4
;884 5
}99 	
[;; 	
HttpGet;;	 
];; 
public<< 
IActionResult<< 
ChangePassword<< +
(<<+ ,
)<<, -
{== 	
return>> 
Redirect>> 
(>> 
_identitySettings>> -
.>>- .
OpenIdSettings>>. <
.>>< =
UserProfileUri>>= K
)>>K L
;>>L M
}?? 	
[AA 	
HttpPostAA	 
]AA 
[BB 	
AllowAnonymousBB	 
]BB 
publicCC 
TaskCC 
<CC 
IActionResultCC !
>CC! "
LogOutCC# )
(CC) *
)CC* +
{DD 	
returnEE 
TaskEE 
.EE 

FromResultEE "
<EE" #
IActionResultEE# 0
>EE0 1
(EE1 2
newEE2 5
SignOutResultEE6 C
(EEC D
newEED G
[EEG H
]EEH I
{FF (
CookieAuthenticationDefaultsFF -
.FF- . 
AuthenticationSchemeFF. B
,FFB C
_identitySettingsFFD U
.FFU V
OpenIdSettingsFFV d
.FFd e 
AuthenticationSchemeFFe y
}FFy z
)FFz {
)FF{ |
;FF| }
}GG 	
}HH 
}II �
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\SchoolYearsController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ '
BypassInstanceContextFilter  
]  !
public 

class !
SchoolYearsController &
:' (
ControllerBase) 7
{ 
private 
readonly 
GetSchoolYearsQuery ,
_getSchoolYears- <
;< =
private 
readonly %
GetCurrentSchoolYearQuery 2!
_getCurrentSchoolYear3 H
;H I
private 
readonly (
ISetCurrentSchoolYearCommand 5!
_setCurrentSchoolYear6 K
;K L
public !
SchoolYearsController $
($ %
GetSchoolYearsQuery 
getSchoolYears  .
,. /%
GetCurrentSchoolYearQuery % 
getCurrentSchoolYear& :
,: ;(
ISetCurrentSchoolYearCommand ( 
setCurrentSchoolYear) =
)= >
{ 	
_getSchoolYears 
= 
getSchoolYears ,
;, -!
_getCurrentSchoolYear !
=" # 
getCurrentSchoolYear$ 8
;8 9!
_setCurrentSchoolYear !
=" # 
setCurrentSchoolYear$ 8
;8 9
} 	
public!! 
ActionResult!! 
Edit!!  
(!!  !
string!!! '
instanceName!!( 4
)!!4 5
{"" 	
var## 
currentSchoolYear## !
=##" #!
_getCurrentSchoolYear##$ 9
.##9 :
Execute##: A
(##A B
)##B C
?##C D
.##D E

SchoolYear##E O
;##O P
var$$ 
schoolYears$$ 
=$$ 
_getSchoolYears$$ -
.$$- .
Execute$$. 5
($$5 6
)$$6 7
;$$7 8
string&& 
warning&& 
=&& 
null&& !
;&&! "
return(( 
PartialView(( 
((( 
new)) 
EditSchoolYearModel)) '
{** 
Warning++ 
=++ 
warning++ %
,++% &
InstanceName,,  
=,,! "
instanceName,,# /
,,,/ 0

SchoolYear-- 
=--  
currentSchoolYear--! 2
,--2 3
SchoolYears.. 
=..  !
schoolYears.." -
.// 
ToSelectListItems// *
(//* +
$str00 0
,000 1
x11 
=>11  
x11! "
.11" #

SchoolYear11# -
.11- .
ToString11. 6
(116 7
)117 8
,118 9
x22 
=>22  
x22! "
.22" #!
SchoolYearDescription22# 8
)228 9
}33 
)33 
;33 
}44 	
[66 	
HttpPost66	 
]66 
public77 
ActionResult77 
Edit77  
(77  !
EditSchoolYearModel77! 4
model775 :
)77: ;
{88 	!
_setCurrentSchoolYear99 !
.99! "
Execute99" )
(99) *
model99* /
.99/ 0

SchoolYear990 :
.99: ;
Value99; @
)99@ A
;99A B
return;; 
JsonSuccess;; 
(;; 
$str;; 2
);;2 3
;;;3 4
}<< 	
}== 
}>> �2
ZC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\SetupController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ %
BypassSetupRequiredFilter 
, '
BypassInstanceContextFilter  ;
]; <
public 

class 
SetupController  
:! "
ControllerBase# 1
{ 
private 
readonly 
ILog 
_logger %
=& '

LogManager( 2
.2 3
	GetLogger3 <
(< =
typeof= C
(C D
SetupControllerD S
)S T
)T U
;U V
private 
readonly -
!ICompleteOdsFirstTimeSetupCommand :-
!_completeOdsFirstTimeSetupCommand; \
;\ ]
private 
readonly +
ApplicationConfigurationService 8,
 _applicationConfigurationService9 Y
;Y Z
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
SetupController 
( -
!ICompleteOdsFirstTimeSetupCommand @,
 completeOdsFirstTimeSetupCommandA a
,   +
ApplicationConfigurationService   -+
applicationConfigurationService  . M
,!! 
IOptions!! 
<!! 
AppSettings!! "
>!!" #
appSettingsAccessor!!$ 7
)!!7 8
{"" 	-
!_completeOdsFirstTimeSetupCommand## -
=##. /,
 completeOdsFirstTimeSetupCommand##0 P
;##P Q,
 _applicationConfigurationService$$ ,
=$$- .+
applicationConfigurationService$$/ N
;$$N O
_appSettings%% 
=%% 
appSettingsAccessor%% .
.%%. /
Value%%/ 4
;%%4 5
}&& 	
[(( 	
HttpPost((	 
](( 
public)) 
async)) 
Task)) 
<)) 

JsonResult)) $
>))$ %"
CompleteFirstTimeSetup))& <
())< =
)))= >
{** 	
_logger++ 
.++ 
Info++ 
(++ 
$str++ 9
)++9 :
;++: ;
return,, 
await,, 
RunSetup,, !
(,,! "
async,," '
(,,( )
),,) *
=>,,+ -
{-- 
var.. 
restartRequired.. #
=..$ %
await..& +-
!_completeOdsFirstTimeSetupCommand.., M
...M N
Execute..N U
(..U V1
%CloudOdsAdminAppClaimSetConfiguration..V {
...{ |
Default	..| �
)
..� �
;
..� �
Response00 
.00 
Cookies00  
.00  !
Append00! '
(00' (
$str00( 9
,009 :
restartRequired00; J
.00J K
ToString00K S
(00S T
)00T U
)00U V
;00V W
}11 
)11 
;11 
}22 	
public44 
ActionResult44 
PostUpdateSetup44 +
(44+ ,
)44, -
{55 	
return66 
View66 
(66 
)66 
;66 
}77 	
private99 
async99 
Task99 
<99 

JsonResult99 %
>99% &
RunSetup99' /
(99/ 0
Func990 4
<994 5
Task995 9
>999 :
setupAction99; F
)99F G
{:: 	
try;; 
{<< 
_logger== 
.== 
Info== 
(== 
$str== 6
)==6 7
;==7 8
await>> 
setupAction>> !
(>>! "
)>>" #
;>># $,
 _applicationConfigurationService?? 0
.??0 1&
UpdateFirstTimeSetUpStatus??1 K
(??K L
true??L P
)??P Q
;??Q R
_logger@@ 
.@@ 
Info@@ 
(@@ 
$str@@ 6
)@@6 7
;@@7 8
returnAA 
SetupSucessAA "
(AA" #
)AA# $
;AA$ %
}BB 
catchCC 
(CC 
	ExceptionCC 
eCC 
)CC 
{DD 
_loggerEE 
.EE 
ErrorEE 
(EE 
$strEE ,
,EE, -
eEE. /
)EE/ 0
;EE0 1
returnFF 
SetupFailureFF #
(FF# $
eFF$ %
)FF% &
;FF& '
}GG 
}HH 	
privateJJ 

JsonResultJJ 
SetupFailureJJ '
(JJ' (
	ExceptionJJ( 1
eJJ2 3
)JJ3 4
{KK 	
ResponseLL 
.LL 

StatusCodeLL 
=LL  !
(LL" #
intLL# &
)LL& '
HttpStatusCodeLL' 5
.LL5 6
InternalServerErrorLL6 I
;LLI J
returnNN 
JsonNN 
(NN 
newNN 
{NN 
successNN %
=NN& '
falseNN( -
,NN- .
messageNN/ 6
=NN7 8
$"NN9 ;
$strNN; U
{NNU V
eNNV W
.NNW X
MessageNNX _
}NN_ `
"NN` a
,NNa b
isTransientErrorNNc s
=NNt u
IsTransientError	NNv �
(
NN� �
e
NN� �
)
NN� �
}
NN� �
)
NN� �
;
NN� �
}OO 	
privateQQ 

JsonResultQQ 
SetupSucessQQ &
(QQ& '
)QQ' (
{RR 	
ResponseSS 
.SS 

StatusCodeSS 
=SS  !
(SS" #
intSS# &
)SS& '
HttpStatusCodeSS' 5
.SS5 6
OKSS6 8
;SS8 9
returnTT 
JsonTT 
(TT 
newTT 
{TT 
successTT %
=TT& '
trueTT( ,
,TT, -
messageTT. 5
=TT6 7
$strTT8 H
}TTI J
)TTJ K
;TTK L
}UU 	
privateWW 
boolWW 
IsTransientErrorWW %
(WW% &
	ExceptionWW& /
eWW0 1
)WW1 2
{XX 	
returnYY 
eYY 
isYY 
SqlExceptionYY $
;YY$ %
}ZZ 	
}[[ 
}\\ �
qC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\SingleInstanceCurrentYearViewComponent.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
public 

class 2
&SingleInstanceCurrentYearViewComponent 7
:8 9
ViewComponent: G
{ 
public 
class 
Model 
{ 	
public 
string 
InstanceName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string !
SchoolYearDescription /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 	
private 
readonly 
InstanceContext (
_instanceContext) 9
;9 :
private 
readonly %
GetCurrentSchoolYearQuery 2!
_getCurrentSchoolYear3 H
;H I
public 2
&SingleInstanceCurrentYearViewComponent 5
(5 6
InstanceContext 
instanceContext +
,+ ,%
GetCurrentSchoolYearQuery % 
getCurrentSchoolYear& :
): ;
{ 	
_instanceContext 
= 
instanceContext .
;. /!
_getCurrentSchoolYear !
=" # 
getCurrentSchoolYear$ 8
;8 9
} 	
public    
IViewComponentResult   #
Invoke  $ *
(  * +
)  + ,
{!! 	
var"" 

schoolYear"" 
="" !
_getCurrentSchoolYear"" 2
.""2 3
Execute""3 :
("": ;
)""; <
;""< =
return$$ 
View$$ 
($$ 
new%% 
Model%% 
{&& 
InstanceName''  
=''! "
_instanceContext''# 3
.''3 4
Name''4 8
,''8 9!
SchoolYearDescription(( )
=((* +

schoolYear((, 6
?((6 7
.((7 8!
SchoolYearDescription((8 M
})) 
))) 
;)) 
}** 	
}++ 
},, �x
YC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Controllers\UserController.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Controllers  +
{ 
[ '
BypassInstanceContextFilter  
]  !
[ 
PermissionRequired 
( 

Permission "
." # 
AccessGlobalSettings# 7
)7 8
]8 9
public 

class 
UserController 
:  !
ControllerBase" 0
{ 
private 
readonly 
SignInManager &
<& '
AdminAppUser' 3
>3 4
SignInManager5 B
;B C
private 
readonly 
UserManager $
<$ %
AdminAppUser% 1
>1 2
UserManager3 >
;> ?
private 
readonly 
AddUserCommand '
_addUserCommand( 7
;7 8
private 
readonly 
EditUserCommand (
_editUserCommand) 9
;9 :
private 
readonly 
DeleteUserCommand *
_deleteUserCommand+ =
;= >
private   
readonly   $
GetAdminAppUserByIdQuery   1%
_getAdminAppUserByIdQuery  2 K
;  K L
private!! 
readonly!! )
EditOdsInstanceForUserCommand!! 6*
_editOdsInstanceForUserCommand!!7 U
;!!U V
private"" 
readonly"" 
EditUserRoleCommand"" , 
_editUserRoleCommand""- A
;""A B
private## 
readonly## 
GetRoleForUserQuery## , 
_getRoleForUserQuery##- A
;##A B
private$$ 
readonly$$ !
IGetOdsInstancesQuery$$ .!
_getOdsInstancesQuery$$/ D
;$$D E
private%% 
readonly%% 
ITabDisplayService%% +
_tabDisplayService%%, >
;%%> ?
public'' 
UserController'' 
('' 
AddUserCommand'' ,
addUserCommand''- ;
,(( 
EditUserCommand(( 
editUserCommand(( -
,)) 
DeleteUserCommand)) 
deleteUserCommand))  1
,** $
GetAdminAppUserByIdQuery** &$
getAdminAppUserByIdQuery**' ?
,++ )
EditOdsInstanceForUserCommand++ +)
editOdsInstanceForUserCommand++, I
,,, 
EditUserRoleCommand,, !
editUserRoleCommand,," 5
,-- 
GetRoleForUserQuery-- !
getRoleForUserQuery--" 5
,.. !
IGetOdsInstancesQuery.. # 
getOdsInstancesQuery..$ 8
,// 
ITabDisplayService//  
tabDisplayService//! 2
,00 
SignInManager00 
<00 
AdminAppUser00 (
>00( )
signInManager00* 7
,11 
UserManager11 
<11 
AdminAppUser11 &
>11& '
userManager11( 3
)22 
{33 	
_addUserCommand44 
=44 
addUserCommand44 ,
;44, -
_editUserCommand55 
=55 
editUserCommand55 .
;55. /
_deleteUserCommand66 
=66  
deleteUserCommand66! 2
;662 3%
_getAdminAppUserByIdQuery77 %
=77& '$
getAdminAppUserByIdQuery77( @
;77@ A*
_editOdsInstanceForUserCommand88 *
=88+ ,)
editOdsInstanceForUserCommand88- J
;88J K 
_editUserRoleCommand99  
=99! "
editUserRoleCommand99# 6
;996 7 
_getRoleForUserQuery::  
=::! "
getRoleForUserQuery::# 6
;::6 7!
_getOdsInstancesQuery;; !
=;;" # 
getOdsInstancesQuery;;$ 8
;;;8 9
_tabDisplayService<< 
=<<  
tabDisplayService<<! 2
;<<2 3
SignInManager>> 
=>> 
signInManager>> )
;>>) *
UserManager?? 
=?? 
userManager?? %
;??% &
}@@ 	
publicBB 
ActionResultBB 
AddUserBB #
(BB# $
)BB$ %
{CC 	
returnDD 
ViewDD 
(DD 
$strDD !
,DD! "
newDD# &
AddUserModelDD' 3
{EE )
GlobalSettingsTabEnumerationsFF -
=FF. /2
&GetGlobalSettingsTabsWithUsersSelectedFF0 V
(FFV W
)FFW X
}GG 
)GG 
;GG 
}HH 	
[JJ 	
HttpPostJJ	 
]JJ 
publicKK 
asyncKK 
TaskKK 
<KK 
ActionResultKK &
>KK& '
AddUserKK( /
(KK/ 0
AddUserModelKK0 <
modelKK= B
)KKB C
{LL 	
ifMM 
(MM 
!MM 

ModelStateMM 
.MM 
IsValidMM #
)MM# $
{NN 
returnOO 
AddUserOO 
(OO 
)OO  
;OO  !
}PP 
varRR 
(RR 
userIdRR 
,RR 
resultRR 
)RR  
=RR! "
awaitRR# (
_addUserCommandRR) 8
.RR8 9
ExecuteRR9 @
(RR@ A
modelRRA F
,RRF G
UserManagerRRH S
)RRS T
;RRT U
ifSS 
(SS 
!SS 
resultSS 
.SS 
	SucceededSS !
)SS! "
{TT 
modelUU 
.UU )
GlobalSettingsTabEnumerationsUU 3
=UU4 52
&GetGlobalSettingsTabsWithUsersSelectedUU6 \
(UU\ ]
)UU] ^
;UU^ _
	AddErrorsVV 
(VV 
resultVV  
)VV  !
;VV! "
returnWW 
ViewWW 
(WW 
modelWW !
)WW! "
;WW" #
}XX  
_editUserRoleCommandYY  
.YY  !
ExecuteYY! (
(YY( )
newYY) ,
EditUserRoleModelYY- >
{ZZ 
UserId[[ 
=[[ 
userId[[ 
,[[  
RoleId\\ 
=\\ 
Role\\ 
.\\ 
Admin\\ #
.\\# $
Value\\$ )
.\\) *
ToString\\* 2
(\\2 3
)\\3 4
}]] 
)]] 
;]] 
SuccessToastMessage__ 
(__  
$str__  q
)__q r
;__r s
returnaa 
RedirectToActionaa #
(aa# $
$straa$ +
,aa+ ,
$straa- =
)aa= >
;aa> ?
}bb 	
publicdd 
ActionResultdd 
EditUserdd $
(dd$ %
stringdd% +
userIddd, 2
)dd2 3
{ee 	
varff 
existingUserff 
=ff %
_getAdminAppUserByIdQueryff 8
.ff8 9
Executeff9 @
(ff@ A
userIdffA G
)ffG H
;ffH I
returnhh 
PartialViewhh 
(hh 
$strhh /
,hh/ 0
newhh1 4
EditUserModelhh5 B
{ii 
UserIdjj 
=jj 
userIdjj 
,jj  
Emailkk 
=kk 
existingUserkk $
.kk$ %
Emailkk% *
,kk* +)
GlobalSettingsTabEnumerationsll -
=ll. /2
&GetGlobalSettingsTabsWithUsersSelectedll0 V
(llV W
)llW X
}mm 
)mm 
;mm 
}nn 	
[pp 	
HttpPostpp	 
]pp 
publicqq 
asyncqq 
Taskqq 
<qq 
ActionResultqq &
>qq& '
EditUserqq( 0
(qq0 1
EditUserModelqq1 >
modelqq? D
)qqD E
{rr 	
ifss 
(ss 
!ss 

ModelStatess 
.ss 
IsValidss #
)ss# $
{tt 
returnuu 
EditUseruu 
(uu  
modeluu  %
.uu% &
UserIduu& ,
)uu, -
;uu- .
}vv 
varxx 
resultxx 
=xx 
awaitxx 
_editUserCommandxx /
.xx/ 0
Executexx0 7
(xx7 8
modelxx8 =
,xx= >
UserManagerxx? J
)xxJ K
;xxK L
ifyy 
(yy 
!yy 
resultyy 
.yy 
	Succeededyy !
)yy! "
{zz 
	AddErrors{{ 
({{ 
result{{  
){{  !
;{{! "
return|| 
EditUser|| 
(||  
model||  %
.||% &
UserId||& ,
)||, -
;||- .
}}} 
var 
loggedInUserId 
=  
User! %
.% &
FindFirstValue& 4
(4 5

ClaimTypes5 ?
.? @
NameIdentifier@ N
)N O
;O P
if
�� 
(
�� 
model
�� 
.
�� 
UserId
�� 
==
�� 
loggedInUserId
��  .
)
��. /
{
�� 
var
�� 
user
�� 
=
�� '
_getAdminAppUserByIdQuery
�� 4
.
��4 5
Execute
��5 <
(
��< =
model
��= B
.
��B C
UserId
��C I
)
��I J
;
��J K
if
�� 
(
�� 
user
�� 
!=
�� 
null
��  
)
��  !
{
�� 
await
�� 
SignInManager
�� '
.
��' (
SignInAsync
��( 3
(
��3 4
user
��4 8
,
��8 9
isPersistent
��: F
:
��F G
false
��H M
)
��M N
;
��N O
}
�� 
}
�� 
return
�� "
RedirectToActionJson
�� '
<
��' (&
GlobalSettingsController
��( @
>
��@ A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
Users
��I N
(
��N O
)
��O P
,
��P Q
$str
��R n
)
��n o
;
��o p
}
�� 	
public
�� 
ActionResult
�� 
EditUserRole
�� (
(
��( )
string
��) /
userId
��0 6
)
��6 7
{
�� 	
var
�� 
existingUser
�� 
=
�� '
_getAdminAppUserByIdQuery
�� 8
.
��8 9
Execute
��9 @
(
��@ A
userId
��A G
)
��G H
;
��H I
var
�� 
currentRole
�� 
=
�� "
_getRoleForUserQuery
�� 2
.
��2 3
Execute
��3 :
(
��: ;
userId
��; A
)
��A B
;
��B C
return
�� 
PartialView
�� 
(
�� 
$str
�� 3
,
��3 4
new
��5 8
EditUserRoleModel
��9 J
{
�� 
UserId
�� 
=
�� 
userId
�� 
,
��  
Email
�� 
=
�� 
existingUser
�� $
.
��$ %
Email
��% *
,
��* +
RoleId
�� 
=
�� 
currentRole
�� $
.
��$ %
Value
��% *
.
��* +
ToString
��+ 3
(
��3 4
)
��4 5
,
��5 6+
GlobalSettingsTabEnumerations
�� -
=
��. /4
&GetGlobalSettingsTabsWithUsersSelected
��0 V
(
��V W
)
��W X
}
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 
EditUserRole
�� (
(
��( )
EditUserRoleModel
��) :
model
��; @
)
��@ A
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
EditUserRole
�� #
(
��# $
model
��$ )
)
��) *
;
��* +
}
�� "
_editUserRoleCommand
��  
.
��  !
Execute
��! (
(
��( )
model
��) .
)
��. /
;
��/ 0
return
�� "
RedirectToActionJson
�� '
<
��' (&
GlobalSettingsController
��( @
>
��@ A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
Users
��I N
(
��N O
)
��O P
,
��P Q
$str
��R o
)
��o p
;
��p q
}
�� 	
public
�� 
ActionResult
�� 

DeleteUser
�� &
(
��& '
string
��' -
userId
��. 4
)
��4 5
{
�� 	
var
�� 
existingUser
�� 
=
�� '
_getAdminAppUserByIdQuery
�� 8
.
��8 9
Execute
��9 @
(
��@ A
userId
��A G
)
��G H
;
��H I
return
�� 
PartialView
�� 
(
�� 
$str
�� 1
,
��1 2
new
��3 6
DeleteUserModel
��7 F
{
�� 
Email
�� 
=
�� 
existingUser
�� $
.
��$ %
Email
��% *
,
��* +
UserId
�� 
=
�� 
userId
�� 
}
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
ActionResult
�� 

DeleteUser
�� &
(
��& '
DeleteUserModel
��' 6
model
��7 <
)
��< =
{
�� 	 
_deleteUserCommand
�� 
.
�� 
Execute
�� &
(
��& '
model
��' ,
)
��, -
;
��- .
return
�� "
RedirectToActionJson
�� '
<
��' (&
GlobalSettingsController
��( @
>
��@ A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
Users
��I N
(
��N O
)
��O P
,
��P Q
$str
��R n
)
��n o
;
��o p
}
�� 	
private
�� 
void
�� 
	AddErrors
�� 
(
�� 
IdentityResult
�� -
result
��. 4
)
��4 5
{
�� 	
foreach
�� 
(
�� 
var
�� 
error
�� 
in
�� !
result
��" (
.
��( )
Errors
��) /
)
��/ 0
{
�� 

ModelState
�� 
.
�� 
AddModelError
�� (
(
��( )
$str
��) +
,
��+ ,
error
��- 2
.
��2 3
Description
��3 >
)
��> ?
;
��? @
}
�� 
}
�� 	
private
�� 
List
�� 
<
�� 

TabDisplay
�� 
<
��  *
GlobalSettingsTabEnumeration
��  <
>
��< =
>
��= >4
&GetGlobalSettingsTabsWithUsersSelected
��? e
(
��e f
)
��f g
{
�� 	
return
��  
_tabDisplayService
�� %
.
��% &)
GetGlobalSettingsTabDisplay
��& A
(
��A B*
GlobalSettingsTabEnumeration
�� ,
.
��, -
Users
��- 2
)
��2 3
;
��3 4
}
�� 	
}
�� 
}�� �#
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\DisplayService\OnPremTabDisplayService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (
DisplayService( 6
{ 
public 

class #
OnPremTabDisplayService (
:) *!
BaseTabDisplayService+ @
,@ A
ITabDisplayServiceB T
{ 
private 
readonly 
IdentitySettings )
_identitySettings* ;
;; <
public #
OnPremTabDisplayService &
(& '
IOptions' /
</ 0
IdentitySettings0 @
>@ A
identitySettingsB R
)R S
{ 	
_identitySettings 
= 
identitySettings  0
.0 1
Value1 6
;6 7
} 	
public 
override 
List 
< 

TabDisplay '
<' ((
GlobalSettingsTabEnumeration( D
>D E
>E F'
GetGlobalSettingsTabDisplay '
(' ((
GlobalSettingsTabEnumeration( D
selectedTabE P
)P Q
{ 	
var 
globalSettingsTabs "
=# $
base% )
.) *'
GetGlobalSettingsTabDisplay* E
(E F
selectedTabF Q
)Q R
;R S
var 
disabledTabs 
= 
new "
List# '
<' ((
GlobalSettingsTabEnumeration( D
>D E
{ (
GlobalSettingsTabEnumeration   ,
.  , -
AdvancedSettings  - =
}!! 
;!! 
if## 
(## 
_identitySettings## !
.##! "
Type##" &
==##' )%
IdentitySettingsConstants##* C
.##C D
OpenIdIdentityType##D V
)##V W
{$$ 
disabledTabs%% 
.%% 
Add%%  
(%%  !(
GlobalSettingsTabEnumeration%%! =
.%%= >
Users%%> C
)%%C D
;%%D E
}&& 
var(( 
tabsToDisable(( 
=(( 
globalSettingsTabs((  2
.((2 3
Where((3 8
(((8 9
x((9 :
=>((; =
disabledTabs)) 
.)) 
Contains)) %
())% &
x))& '
.))' (
Tab))( +
)))+ ,
))), -
;))- .
tabsToDisable,, 
.,, 
ForEach,, !
(,,! "
tab,," %
=>,,& (
{-- 
tab.. 
... 
	IsEnabled.. 
=.. 
false..  %
;..% &
tab// 
.// 
	IsVisible// 
=// 
false//  %
;//% &
}00 
)00 
;00 
return22 
globalSettingsTabs22 %
;22% &
}33 	
public55 
override55 
List55 
<55 

TabDisplay55 '
<55' (-
!OdsInstanceSettingsTabEnumeration55( I
>55I J
>55J K,
 GetOdsInstanceSettingsTabDisplay55L l
(55l m-
!OdsInstanceSettingsTabEnumeration66 -
selectedTab66. 9
)669 :
{77 	
var88 
instanceSettings88  
=88! "
base88# '
.88' (,
 GetOdsInstanceSettingsTabDisplay88( H
(88H I
selectedTab88I T
)88T U
;88U V
var:: 
tabsToDisable:: 
=:: 
instanceSettings::  0
.::0 1
Where::1 6
(::6 7
x::7 8
=>::9 ;
x;; 
.;; 
Tab;; 
==;; -
!OdsInstanceSettingsTabEnumeration;; :
.;;: ;
Logging;;; B
);;B C
.;;C D
ToList;;D J
(;;J K
);;K L
;;;L M
tabsToDisable== 
.== 
ForEach== !
(==! "
tab==" %
=>==& (
{>> 
tab?? 
.?? 
	IsEnabled?? 
=?? 
false??  %
;??% &
tab@@ 
.@@ 
	IsVisible@@ 
=@@ 
false@@  %
;@@% &
}AA 
)AA 
;AA 
returnCC 
instanceSettingsCC #
;CC# $
}DD 	
}EE 
}FF �
jC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\HomeScreen\HomeScreenDisplayService.cs
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
 
Web

 
.

  
Display

  '
.

' (

HomeScreen

( 2
{ 
public 

class $
HomeScreenDisplayService )
:* +%
IHomeScreenDisplayService, E
{ 
private 
readonly 
AdminAppUserContext ,
_userContext- 9
;9 :
public $
HomeScreenDisplayService '
(' (
AdminAppUserContext( ;
userContext< G
)G H
{ 	
_userContext 
= 
userContext &
;& '
} 	
public 
List 
< !
HomeScreenEnumeration )
>) *!
GetHomeScreenDisplays+ @
(@ A
)A B
{ 	
var !
homeScreenDisplayList %
=& '
new( +
List, 0
<0 1!
HomeScreenEnumeration1 F
>F G
(G H
)H I
;I J
if 
( 
_userContext 
. 
Has  
(  !

Permission! +
.+ , 
AccessGlobalSettings, @
)@ A
)A B
{ !
homeScreenDisplayList %
.% &
Add& )
() *!
HomeScreenEnumeration* ?
.? @
Global@ F
)F G
;G H
} !
homeScreenDisplayList !
.! "
Add" %
(% &!
HomeScreenEnumeration& ;
.; <
OdsInstances< H
)H I
;I J
return !
homeScreenDisplayList (
;( )
}   	
}!! 
}"" �
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\HomeScreen\HomeScreenEnumeration.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (

HomeScreen( 2
{		 
public

 

sealed

 
class

 !
HomeScreenEnumeration

 -
:

. /
Enumeration

0 ;
<

; <!
HomeScreenEnumeration

< Q
>

Q R
{ 
private !
HomeScreenEnumeration %
(% &
int& )
value* /
,/ 0
string1 7
displayName8 C
)C D
:E F
baseG K
(K L
valueL Q
,Q R
displayNameS ^
)^ _
{ 	
} 	
public 
static 
readonly !
HomeScreenEnumeration 4
Settings5 =
=> ?
new@ C!
HomeScreenEnumerationD Y
(Y Z
$numZ [
,[ \
$str] g
)g h
;h i
public 
static 
readonly !
HomeScreenEnumeration 4
OdsInstances5 A
=B C
newD G!
HomeScreenEnumerationH ]
(] ^
$num^ _
,_ `
$stra p
)p q
;q r
public 
static 
readonly !
HomeScreenEnumeration 4
Global5 ;
=< =
new> A!
HomeScreenEnumerationB W
(W X
$numX Y
,Y Z
$str[ c
)c d
;d e
} 
} �
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\HomeScreen\IHomeScreenDisplayService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (

HomeScreen( 2
{		 
public

 

	interface

 %
IHomeScreenDisplayService

 .
{ 
List 
< !
HomeScreenEnumeration "
>" #!
GetHomeScreenDisplays$ 9
(9 :
): ;
;; <
} 
} �L
VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\Pagination\Page.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (

Pagination( 2
{ 
public 

class 
Page 
< 
T 
> 
{ 
private 
readonly 
Func 
< 
int !
,! "
int# &
,& '
Task( ,
<, -
IReadOnlyList- :
<: ;
T; <
>< =
>= >
>> ?
GetApiRecordsAsync@ R
;R S
private 
readonly 
Func 
< 
int !
,! "
int# &
,& '
IReadOnlyList( 5
<5 6
T6 7
>7 8
>8 9
GetApiRecords: G
;G H
public 
static 
readonly 
int "
DefaultPageSize# 2
=3 4
$num5 7
;7 8
private 
Page 
( 
Func 
< 
int 
, 
int "
," #
Task$ (
<( )
IReadOnlyList) 6
<6 7
T7 8
>8 9
>9 :
>: ;
getApiRecordsAsync< N
)N O
{ 	
GetApiRecordsAsync 
=  
getApiRecordsAsync! 3
;3 4
} 	
private 
Page 
( 
Func 
< 
int 
, 
int "
," #
IReadOnlyList$ 1
<1 2
T2 3
>3 4
>4 5
getApiRecords6 C
)C D
{ 	
GetApiRecords 
= 
getApiRecords )
;) *
} 	
public 
static 
async 
Task  
<  !
	PagedList! *
<* +
T+ ,
>, -
>- .

FetchAsync/ 9
(9 :
Func: >
<> ?
int? B
,B C
intD G
,G H
TaskI M
<M N
IReadOnlyListN [
<[ \
T\ ]
>] ^
>^ _
>_ `
getApiRecordsa n
,n o
intp s

pageNumbert ~
)~ 
=>
� �
await
� �

FetchAsync
� �
(
� �
getApiRecords
� �
,
� �

pageNumber
� �
,
� �
DefaultPageSize
� �
)
� �
;
� �
public   
static   
async   
Task    
<    !
	PagedList  ! *
<  * +
T  + ,
>  , -
>  - .

FetchAsync  / 9
(  9 :
Func  : >
<  > ?
int  ? B
,  B C
int  D G
,  G H
Task  I M
<  M N
IReadOnlyList  N [
<  [ \
T  \ ]
>  ] ^
>  ^ _
>  _ `
getApiRecords  a n
,  n o
int  p s

pageNumber  t ~
,  ~ 
int
  � �
pageSize
  � �
)
  � �
{!! 	
var"" 
service"" 
="" 
new"" 
Page"" "
<""" #
T""# $
>""$ %
(""% &
getApiRecords""& 3
)""3 4
;""4 5
return$$ 
await$$ 
service$$  
.$$  !
PagedListAsync$$! /
($$/ 0

pageNumber$$0 :
,$$: ;
pageSize$$< D
)$$D E
;$$E F
}%% 	
private'' 
async'' 
Task'' 
<'' 
	PagedList'' $
<''$ %
T''% &
>''& '
>''' (
PagedListAsync'') 7
(''7 8
int''8 ;

pageNumber''< F
,''F G
int''H K
pageSize''L T
)''T U
{(( 	
if)) 
()) 
pageSize)) 
>=)) 
$num)) 
)))  
{** 
throw++ 
new++ 
ArgumentException++ +
(+++ ,
$str	++, �
)
++� �
;
++� �
},, 
var.. 
humanPageNumber.. 
=..  !

pageNumber.." ,
==..- /
$num..0 1
?..2 3
$num..4 5
:..6 7

pageNumber..8 B
;..B C
var00 
recordsToOffset00 
=00  !
(00" #
humanPageNumber00# 2
-003 4
$num005 6
)006 7
*008 9
pageSize00: B
;00B C
var22 
records22 
=22 
await22 
GetApiRecordsAsync22  2
(222 3
recordsToOffset223 B
,22B C
pageSize22D L
+22M N
$num22O P
)22P Q
;22Q R
return44 
new44 
	PagedList44  
<44  !
T44! "
>44" #
{55 

PageNumber66 
=66 
humanPageNumber66 ,
,66, -
NextPageHasResults77 "
=77# $
records77% ,
.77, -
Count77- 2
(772 3
)773 4
>775 6
pageSize777 ?
,77? @
Items88 
=88 
records88 
.88  
Take88  $
(88$ %
pageSize88% -
)88- .
.88. /
ToList88/ 5
(885 6
)886 7
}99 
;99 
}:: 	
public<< 
static<< 
	PagedList<< 
<<<  
T<<  !
><<! "
Fetch<<# (
(<<( )
Func<<) -
<<<- .
int<<. 1
,<<1 2
int<<3 6
,<<6 7
IReadOnlyList<<8 E
<<<E F
T<<F G
><<G H
><<H I
getApiRecords<<J W
,<<W X
int<<Y \

pageNumber<<] g
)<<g h
{== 	
return>> 
Fetch>> 
(>> 
getApiRecords>> &
,>>& '

pageNumber>>( 2
,>>2 3
DefaultPageSize>>4 C
)>>C D
;>>D E
}?? 	
publicAA 
staticAA 
	PagedListAA 
<AA  
TAA  !
>AA! "
FetchAA# (
(AA( )
FuncAA) -
<AA- .
intAA. 1
,AA1 2
intAA3 6
,AA6 7
IReadOnlyListAA8 E
<AAE F
TAAF G
>AAG H
>AAH I
getApiRecordsAAJ W
,AAW X
intAAY \

pageNumberAA] g
,AAg h
intAAi l
pageSizeAAm u
)AAu v
{BB 	
varCC 
serviceCC 
=CC 
newCC 
PageCC "
<CC" #
TCC# $
>CC$ %
(CC% &
getApiRecordsCC& 3
)CC3 4
;CC4 5
returnEE 
serviceEE 
.EE 
	PagedListEE $
(EE$ %

pageNumberEE% /
,EE/ 0
pageSizeEE1 9
)EE9 :
;EE: ;
}FF 	
privateHH 
	PagedListHH 
<HH 
THH 
>HH 
	PagedListHH &
(HH& '
intHH' *

pageNumberHH+ 5
,HH5 6
intHH7 :
pageSizeHH; C
)HHC D
{II 	
ifJJ 
(JJ 
pageSizeJJ 
>=JJ 
$numJJ 
)JJ  
{KK 
throwLL 
newLL 
ArgumentExceptionLL +
(LL+ ,
$str	LL, �
)
LL� �
;
LL� �
}MM 
varOO 
humanPageNumberOO 
=OO  !

pageNumberOO" ,
==OO- /
$numOO0 1
?OO2 3
$numOO4 5
:OO6 7

pageNumberOO8 B
;OOB C
varQQ 
recordsToOffsetQQ 
=QQ  !
(QQ" #
humanPageNumberQQ# 2
-QQ3 4
$numQQ5 6
)QQ6 7
*QQ8 9
pageSizeQQ: B
;QQB C
varSS 
recordsSS 
=SS 
GetApiRecordsSS '
(SS' (
recordsToOffsetSS( 7
,SS7 8
pageSizeSS9 A
+SSB C
$numSSD E
)SSE F
;SSF G
returnUU 
newUU 
	PagedListUU  
<UU  !
TUU! "
>UU" #
{VV 

PageNumberWW 
=WW 
humanPageNumberWW ,
,WW, -
NextPageHasResultsXX "
=XX# $
recordsXX% ,
.XX, -
CountXX- 2
(XX2 3
)XX3 4
>XX5 6
pageSizeXX7 ?
,XX? @
ItemsYY 
=YY 
recordsYY 
.YY  
TakeYY  $
(YY$ %
pageSizeYY% -
)YY- .
.YY. /
ToListYY/ 5
(YY5 6
)YY6 7
}ZZ 
;ZZ 
}[[ 	
}\\ 
public^^ 

class^^ 
	PagedList^^ 
<^^ 
T^^ 
>^^ 
{__ 
public`` 
int`` 

PageNumber`` 
{`` 
get``  #
;``# $
set``% (
;``( )
}``* +
publicaa 
boolaa 
NextPageHasResultsaa &
{aa' (
getaa) ,
;aa, -
setaa. 1
;aa1 2
}aa3 4
publicbb 
IReadOnlyListbb 
<bb 
Tbb 
>bb 
Itemsbb  %
{bb& '
getbb( +
;bb+ ,
setbb- 0
;bb0 1
}bb2 3
}cc 
}dd �
_C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\RadioButton\IRadioButton.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (
RadioButton( 3
{ 
public 

	interface 
IRadioButton !
{		 
string

 
HelpTooltip

 
{

 
get

  
;

  !
}

" #
} 
} �
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\RadioButton\RadioButtonDisplay.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (
RadioButton( 3
{ 
public 

class 
RadioButtonDisplay #
<# $
T$ %
>% &
where' ,
T- .
:. /
IRadioButton0 <
{		 
public

 
bool

 
	IsEnabled

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
T 
RadioButton 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} �-
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\TabEnumeration\BaseTabDisplayService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (
TabEnumeration( 6
{		 
public

 

abstract

 
class

 !
BaseTabDisplayService

 /
{ 
public 
virtual 
List 
< 

TabDisplay &
<& '(
GlobalSettingsTabEnumeration' C
>C D
>D E'
GetGlobalSettingsTabDisplayF a
(a b(
GlobalSettingsTabEnumerationb ~
selectedTab	 �
)
� �
{ 	
var 
tabDisplayList 
=  
new! $
List% )
<) *

TabDisplay* 4
<4 5(
GlobalSettingsTabEnumeration5 Q
>Q R
>R S
{ 
new 

TabDisplay 
< (
GlobalSettingsTabEnumeration ;
>; <
{ 
	IsEnabled 
= 
true  $
,$ %
	IsVisible 
= 
true  $
,$ %
Tab 
= (
GlobalSettingsTabEnumeration 6
.6 7
Vendors7 >
} 
, 
new 

TabDisplay 
< (
GlobalSettingsTabEnumeration ;
>; <
{ 
	IsEnabled 
= 
true  $
,$ %
	IsVisible 
= 
true  $
,$ %
Tab 
= (
GlobalSettingsTabEnumeration 6
.6 7
AdvancedSettings7 G
} 
, 
new 

TabDisplay 
< (
GlobalSettingsTabEnumeration ;
>; <
{ 
	IsEnabled   
=   
true    $
,  $ %
	IsVisible!! 
=!! 
true!!  $
,!!$ %
Tab"" 
="" (
GlobalSettingsTabEnumeration"" 6
.""6 7
	ClaimSets""7 @
}## 
,## 
new%% 

TabDisplay%% 
<%% (
GlobalSettingsTabEnumeration%% ;
>%%; <
{&& 
	IsEnabled'' 
='' 
true''  $
,''$ %
	IsVisible(( 
=(( 
true((  $
,(($ %
Tab)) 
=)) (
GlobalSettingsTabEnumeration)) 6
.))6 7
Users))7 <
}** 
}++ 
;++ 
tabDisplayList-- 
.-- 
Find-- 
(--  
a--  !
=>--" $
a--% &
.--& '
Tab--' *
==--+ -
selectedTab--. 9
)--9 :
.--: ;

IsSelected--; E
=--F G
true--H L
;--L M
return// 
tabDisplayList// !
;//! "
}00 	
public22 
virtual22 
List22 
<22 

TabDisplay22 &
<22& '-
!OdsInstanceSettingsTabEnumeration22' H
>22H I
>22I J,
 GetOdsInstanceSettingsTabDisplay22K k
(22k l.
!OdsInstanceSettingsTabEnumeration	22l �
selectedTab
22� �
)
22� �
{33 	
var44 
tabDisplayList44 
=44  
new44! $
List44% )
<44) *

TabDisplay44* 4
<444 5-
!OdsInstanceSettingsTabEnumeration445 V
>44V W
>44W X
{55 
new66 

TabDisplay66 
<66 -
!OdsInstanceSettingsTabEnumeration66 @
>66@ A
{77 
	IsEnabled88 
=88 
true88  $
,88$ %
	IsVisible99 
=99 
true99  $
,99$ %
Tab:: 
=:: -
!OdsInstanceSettingsTabEnumeration:: ;
.::; <
Applications::< H
};; 
,;; 
new== 

TabDisplay== 
<== -
!OdsInstanceSettingsTabEnumeration== @
>==@ A
{>> 
	IsEnabled?? 
=?? 
true??  $
,??$ %
	IsVisible@@ 
=@@ 
true@@  $
,@@$ %
TabAA 
=AA -
!OdsInstanceSettingsTabEnumerationAA ;
.AA; <
DescriptorsAA< G
}BB 
,BB 
newDD 

TabDisplayDD 
<DD -
!OdsInstanceSettingsTabEnumerationDD @
>DD@ A
{EE 
	IsEnabledFF 
=FF 
trueFF  $
,FF$ %
	IsVisibleGG 
=GG 
trueGG  $
,GG$ %
TabHH 
=HH -
!OdsInstanceSettingsTabEnumerationHH ;
.HH; <
LoggingHH< C
}II 
,II 
newKK 

TabDisplayKK 
<KK -
!OdsInstanceSettingsTabEnumerationKK @
>KK@ A
{LL 
	IsEnabledMM 
=MM 
trueMM  $
,MM$ %
	IsVisibleNN 
=NN 
trueNN  $
,NN$ %
TabOO 
=OO -
!OdsInstanceSettingsTabEnumerationOO ;
.OO; <"
EducationOrganizationsOO< R
}PP 
}RR 
;RR 
tabDisplayListTT 
.TT 
FindTT 
(TT  
aTT  !
=>TT" $
aTT% &
.TT& '
TabTT' *
==TT+ -
selectedTabTT. 9
)TT9 :
.TT: ;

IsSelectedTT; E
=TTF G
trueTTH L
;TTL M
returnVV 
tabDisplayListVV !
;VV! "
}WW 	
}XX 
}YY �
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\TabEnumeration\GlobalSettingsTabEnumeration.cs
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
 
Web

 
.

  
Display

  '
.

' (
TabEnumeration

( 6
{ 
public 

sealed 
class (
GlobalSettingsTabEnumeration 4
:5 6
Enumeration7 B
<B C(
GlobalSettingsTabEnumerationC _
>_ `
,` a
ITabEnumerationb q
{ 
public 
string 
ControllerName $
=>% '
RouteHelpers( 4
.4 5
GetControllerName5 F
<F G$
GlobalSettingsControllerG _
>_ `
(` a
)a b
;b c
public 
string 

ActionName  
{! "
get# &
;& '
}( )
private (
GlobalSettingsTabEnumeration ,
(, -
int- 0
value1 6
,6 7
string8 >
displayName? J
,J K
stringL R

actionNameS ]
)] ^
:_ `
basea e
(e f
valuef k
,k l
displayNamem x
)x y
{ 	

ActionName 
= 

actionName #
;# $
} 	
public 
static 
readonly (
GlobalSettingsTabEnumeration ;
Vendors< C
=D E
newF I(
GlobalSettingsTabEnumerationJ f
(f g
$numg h
,h i
$strj s
,s t
RouteHelpers	u �
.
� �
GetActionName
� �
<
� �&
GlobalSettingsController
� �
>
� �
(
� �
x
� �
=>
� �
x
� �
.
� �
Vendors
� �
(
� �
)
� �
)
� �
)
� �
;
� �
public 
static 
readonly (
GlobalSettingsTabEnumeration ;
AdvancedSettings< L
=M N
newO R(
GlobalSettingsTabEnumerationS o
(o p
$nump q
,q r
$str	s �
,
� �
RouteHelpers
� �
.
� �
GetActionName
� �
<
� �&
GlobalSettingsController
� �
>
� �
(
� �
x
� �
=>
� �
x
� �
.
� �
AdvancedSettings
� �
(
� �
)
� �
)
� �
)
� �
;
� �
public 
static 
readonly (
GlobalSettingsTabEnumeration ;
	ClaimSets< E
=F G
newH K(
GlobalSettingsTabEnumerationL h
(h i
$numi j
,j k
$strl x
,x y
RouteHelpers	z �
.
� �
GetActionName
� �
<
� �&
GlobalSettingsController
� �
>
� �
(
� �
x
� �
=>
� �
x
� �
.
� �
	ClaimSets
� �
(
� �
)
� �
)
� �
)
� �
;
� �
public 
static 
readonly (
GlobalSettingsTabEnumeration ;
Users< A
=B C
newD G(
GlobalSettingsTabEnumerationH d
(d e
$nume f
,f g
$strh o
,o p
RouteHelpersq }
.} ~
GetActionName	~ �
<
� �&
GlobalSettingsController
� �
>
� �
(
� �
x
� �
=>
� �
x
� �
.
� �
Users
� �
(
� �
)
� �
)
� �
)
� �
;
� �
} 
} �
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\TabEnumeration\ITabDisplayService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (
TabEnumeration( 6
{		 
public

 

	interface

 
ITabDisplayService

 '
{ 
List 
< 

TabDisplay 
< (
GlobalSettingsTabEnumeration 4
>4 5
>5 6'
GetGlobalSettingsTabDisplay7 R
(R S(
GlobalSettingsTabEnumerationS o
selectedTabp {
){ |
;| }
List 
< 

TabDisplay 
< -
!OdsInstanceSettingsTabEnumeration 9
>9 :
>: ;,
 GetOdsInstanceSettingsTabDisplay< \
(\ ]-
!OdsInstanceSettingsTabEnumeration] ~
selectedTab	 �
)
� �
;
� �
} 
} �
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\TabEnumeration\ITabEnumeration.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (
TabEnumeration( 6
{ 
public 

	interface 
ITabEnumeration $
{		 
string

 
ControllerName

 
{

 
get

  #
;

# $
}

% &
string 

ActionName 
{ 
get 
;  
}! "
} 
} �&
wC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\TabEnumeration\OdsInstanceSettingsTabEnumeration.cs
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
 
Web

 
.

  
Display

  '
.

' (
TabEnumeration

( 6
{ 
public 

sealed 
class -
!OdsInstanceSettingsTabEnumeration 9
:: ;
Enumeration< G
<G H-
!OdsInstanceSettingsTabEnumerationH i
>i j
,j k
ITabEnumerationl {
{ 
public 
string 
ControllerName $
{% &
get' *
;* +
}, -
public 
string 

ActionName  
{! "
get# &
;& '
}( )
private -
!OdsInstanceSettingsTabEnumeration 1
(1 2
int2 5
value6 ;
,; <
string= C
displayNameD O
,O P
stringQ W
controllerNameX f
,f g
stringh n

actionNameo y
)y z
:{ |
base	} �
(
� �
value
� �
,
� �
displayName
� �
)
� �
{ 	
ControllerName 
= 
controllerName +
;+ ,

ActionName 
= 

actionName #
;# $
} 	
public 
static 
readonly -
!OdsInstanceSettingsTabEnumeration @
ApplicationsA M
=N O
newP S-
!OdsInstanceSettingsTabEnumerationT u
(u v
$numv w
,w x
$str	y �
,
� �
RouteHelpers
� �
.
� �
GetControllerName
� �
<
� �#
ApplicationController
� �
>
� �
(
� �
)
� �
,
� �
RouteHelpers
� �
.
� �
GetActionName
� �
<
� �#
ApplicationController
� �
>
� �
(
� �
x
� �
=>
� �
x
� �
.
� �
Index
� �
(
� �
)
� �
)
� �
)
� �
;
� �
public 
static 
readonly -
!OdsInstanceSettingsTabEnumeration @
DescriptorsA L
=M N
newO R-
!OdsInstanceSettingsTabEnumerationS t
(t u
$numu v
,v w
$str	x �
,
� �
RouteHelpers
� �
.
� �
GetControllerName
� �
<
� �#
DescriptorsController
� �
>
� �
(
� �
)
� �
,
� �
RouteHelpers
� �
.
� �
GetActionName
� �
<
� �#
DescriptorsController
� �
>
� �
(
� �
x
� �
=>
� �
x
� �
.
� �
Index
� �
(
� �
)
� �
)
� �
)
� �
;
� �
public 
static 
readonly -
!OdsInstanceSettingsTabEnumeration @
LoggingA H
=I J
newK N-
!OdsInstanceSettingsTabEnumerationO p
(p q
$numq r
,r s
$strt }
,} ~
RouteHelpers	 �
.
� �
GetControllerName
� �
<
� �+
OdsInstanceSettingsController
� �
>
� �
(
� �
)
� �
,
� �
RouteHelpers
� �
.
� �
GetActionName
� �
<
� �+
OdsInstanceSettingsController
� �
>
� �
(
� �
x
� �
=>
� �
x
� �
.
� �
Logging
� �
(
� �
)
� �
)
� �
)
� �
;
� �
public 
static 
readonly -
!OdsInstanceSettingsTabEnumeration @"
EducationOrganizationsA W
=X Y
newZ ]-
!OdsInstanceSettingsTabEnumeration^ 
(	 �
$num
� �
,
� �
$str
� �
,
� �
RouteHelpers
� �
.
� �
GetControllerName
� �
<
� �.
 EducationOrganizationsController
� �
>
� �
(
� �
)
� �
,
� �
RouteHelpers
� �
.
� �
GetActionName
� �
<
� �.
 EducationOrganizationsController
� �
>
� �
(
� �
x
� �
=>
� �
x
� �
.
� �$
LocalEducationAgencies
� �
(
� �
)
� �
)
� �
)
� �
;
� �
} 
} �	
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Display\TabEnumeration\TabDisplay.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Display  '
.' (
TabEnumeration( 6
{ 
public 

class 

TabDisplay 
< 
T 
> 
where $
T% &
:& '
ITabEnumeration( 7
{		 
public

 
bool

 
	IsEnabled

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
bool 
	IsVisible 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 

IsSelected 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
T 
Tab 
{ 
get 
; 
set 
;  
}! "
} 
} �
[C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\AdminModelExtensions.cs
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
 
Web

 
.

  
Helpers

  '
{ 
public 

static 
class  
AdminModelExtensions ,
{ 
public 
static 
string 
ContactName (
(( )
this) -
Vendor. 4
vendor5 ;
); <
{ 	
return 
vendor 
? 
. 
Users  
?  !
.! "
FirstOrDefault" 0
(0 1
)1 2
?2 3
.3 4
FullName4 <
;< =
} 	
public 
static 
string 
ContactEmail )
() *
this* .
Vendor/ 5
vendor6 <
)< =
{ 	
return 
vendor 
? 
. 
Users  
?  !
.! "
FirstOrDefault" 0
(0 1
)1 2
?2 3
.3 4
Email4 9
;9 :
} 	
public 
static 
string 
ProfileName (
(( )
this) -
Application. 9
application: E
)E F
{ 	
return 
application 
? 
.  
Profiles  (
?( )
.) *
FirstOrDefault* 8
(8 9
)9 :
?: ;
.; <
ProfileName< G
;G H
} 	
} 
} �

\C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\AjaxRequestExtensions.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Helpers		  '
{

 
public 

static 
class !
AjaxRequestExtensions -
{ 
public 
static 
bool 
IsAjaxRequest (
(( )
this) -
HttpRequest. 9
request: A
)A B
{ 	
return 
string 
. 
Equals  
(  !
request! (
.( )
Query) .
[. /
$str/ A
]A B
,B C
$strD T
,T U
StringComparisonV f
.f g
Ordinalg n
)n o
||p r
string 
. 
Equals  
(  !
request! (
.( )
Headers) 0
[0 1
$str1 C
]C D
,D E
$strF V
,V W
StringComparisonX h
.h i
Ordinali p
)p q
;q r
} 	
} 
} �
[C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\AutoMapperExtensions.cs
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
 
Web

 
.

  
Helpers

  '
{ 
public 

static 
class  
AutoMapperExtensions ,
{ 
private 
static 
string %
EducationOrganizationsKey 7
=8 9
$str: R
;R S
public 
static 
List 
< &
EducationOrganizationModel 5
>5 6%
GetEducationOrganizations7 P
(P Q
thisQ U
ResolutionContextV g
resolutionContexth y
)y z
{ 	
if 
( 
resolutionContext !
.! "
Items" '
.' (
ContainsKey( 3
(3 4%
EducationOrganizationsKey4 M
)M N
)N O
{ 
var 
edOrgs 
= 
resolutionContext .
.. /
Items/ 4
[4 5%
EducationOrganizationsKey5 N
]N O
asP R
ListS W
<W X&
EducationOrganizationModelX r
>r s
;s t
return 
edOrgs 
??  
new! $
List% )
<) *&
EducationOrganizationModel* D
>D E
(E F
)F G
;G H
} 
return 
new 
List 
< &
EducationOrganizationModel 6
>6 7
(7 8
)8 9
;9 :
} 	
public 
static $
IMappingOperationOptions .&
WithEducationOrganizations/ I
(I J
thisJ N$
IMappingOperationOptionsO g#
mappingOperationOptionsh 
,	 �
List
� �
<
� �(
EducationOrganizationModel
� �
>
� �#
educationOrganization
� �
)
� �
{ 	#
mappingOperationOptions #
.# $
Items$ )
[) *%
EducationOrganizationsKey* C
]C D
=E F!
educationOrganizationG \
??] _
new` c
Listd h
<h i'
EducationOrganizationModel	i �
>
� �
(
� �
)
� �
;
� �
return #
mappingOperationOptions *
;* +
} 	
}   
}!! �
_C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\ClaimsIdentityExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Helpers  '
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
 $
ClaimsIdentityExtensions

 0
{ 
public 
static 
string 
GetSignedInUserName 0
(0 1
this1 5
ClaimsIdentity6 D
claimsIdentityE S
)S T
{ 	
var 
usernameParts 
= 
claimsIdentity  .
.. /
	FindFirst/ 8
(8 9

ClaimTypes9 C
.C D
NameD H
)H I
.I J
ValueJ O
.O P
SplitP U
(U V
$charV Y
)Y Z
;Z [
return 
usernameParts  
[  !
usernameParts! .
.. /
Length/ 5
-6 7
$num8 9
]9 :
;: ;
} 	
public 
static 
string 
GetTenantId (
(( )
this) -
ClaimsIdentity. <
claimsIdentity= K
)K L
{ 	
return 
claimsIdentity !
.! "
	FindFirst" +
(+ ,
$str, c
)c d
.d e
Valuee j
;j k
} 	
} 
} �
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\ClaimsPrincipalExtensions.cs
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
 
Web

 
.

  
Helpers

  '
{ 
public 

static 
class %
ClaimsPrincipalExtensions 1
{ 
public 
static 
string 
GetSignedInUserId .
(. /
this/ 3
ClaimsPrincipal4 C
claimsPrincipalD S
)S T
{ 	
return 
claimsPrincipal "
." #
	FindFirst# ,
(, -

ClaimTypes- 7
.7 8
NameIdentifier8 F
)F G
.G H
ValueH M
;M N
} 	
public 
static 
string 
GetSignedInUserName 0
(0 1
this1 5
ClaimsPrincipal6 E
claimsPrincipalF U
)U V
{ 	
return 
claimsPrincipal "
." #
	FindFirst# ,
(, -

ClaimTypes- 7
.7 8
Name8 <
)< =
.= >
Value> C
.C D
SplitD I
(I J
$charJ M
)M N
[N O
claimsPrincipalO ^
.^ _
	FindFirst_ h
(h i

ClaimTypesi s
.s t
Namet x
)x y
.y z
Valuez 
.	 �
Split
� �
(
� �
$char
� �
)
� �
.
� �
Length
� �
-
� �
$num
� �
]
� �
;
� �
} 	
public 
static 
string 
GetTenantId (
(( )
this) -
ClaimsPrincipal. =
claimsPrincipal> M
)M N
{ 	
return 
claimsPrincipal "
." #
	FindFirst# ,
(, -
$str- d
)d e
.e f
Valuef k
;k l
} 	
public 
static 
IEnumerable !
<! "
string" (
>( )
GetTenantIds* 6
(6 7
this7 ;
ClaimsPrincipal< K
claimsPrincipalL [
)[ \
{ 	
return 
claimsPrincipal "
." #
FindAll# *
(* +
$str+ b
)b c
.c d
Selectd j
(j k
ck l
=>m o
cp q
.q r
Valuer w
)w x
;x y
}   	
}!! 
}"" �
XC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\ExpressionHelpers.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Helpers		  '
{

 
public 

static 
class 
ExpressionHelpers )
{ 
public 
static 

Expression  
<  !
Func! %
<% &
TModel& ,
,, -
TToProperty. 9
>9 :
>: ;
Cast< @
<@ A
TModelA G
,G H
TFromPropertyI V
,V W
TToPropertyX c
>c d
(d e
thise i

Expressionj t
<t u
Funcu y
<y z
TModel	z �
,
� �
TFromProperty
� �
>
� �
>
� �

expression
� �
)
� �
{ 	

Expression 
	converted  
=! "

Expression# -
.- .
Convert. 5
(5 6

expression6 @
.@ A
BodyA E
,E F
typeofG M
(M N
TToPropertyN Y
)Y Z
)Z [
;[ \
return 

Expression 
. 
Lambda $
<$ %
Func% )
<) *
TModel* 0
,0 1
TToProperty2 =
>= >
>> ?
(? @
	converted@ I
,I J

expressionK U
.U V

ParametersV `
)` a
;a b
} 	
} 
} ��
[C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\HtmlHelperExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Helpers  '
{ 
public 

static 
class  
HtmlHelperExtensions ,
{   
private!! 
static!! 
readonly!! 
ILog!!  $
_logger!!% ,
=!!- .

LogManager!!/ 9
.!!9 :
	GetLogger!!: C
(!!C D
typeof!!D J
(!!J K 
HtmlHelperExtensions!!K _
)!!_ `
)!!` a
;!!a b
private## 
static## 
readonly## !
HtmlConventionLibrary##  5!
HtmlConventionLibrary##6 K
=##L M)
OdsAdminHtmlConventionLibrary##N k
.##k l(
CreateHtmlConventionLibrary	##l �
(
##� �
)
##� �
;
##� �
private%% 
static%% 
IElementGenerator%% (
<%%( )
T%%) *
>%%* +
GetGenerator%%, 8
<%%8 9
T%%9 :
>%%: ;
(%%; <
T%%< =
model%%> C
)%%C D
where%%E J
T%%K L
:%%M N
class%%O T
{&& 	
return'' 
ElementGenerator'' #
<''# $
T''$ %
>''% &
.''& '
For''' *
(''* +!
HtmlConventionLibrary''+ @
,''@ A
null''B F
,''F G
model''H M
)''M N
;''N O
}(( 	
public** 
static** 
HtmlTag** 
Input** #
<**# $
T**$ %
>**% &
(**& '
this**' +
IHtmlHelper**, 7
<**7 8
T**8 9
>**9 :
helper**; A
,**A B

Expression**C M
<**M N
Func**N R
<**R S
T**S T
,**T U
object**V \
>**\ ]
>**] ^

expression**_ i
)**i j
where**k p
T**q r
:**s t
class**u z
{++ 	
var,, 
	generator,, 
=,, 
GetGenerator,, (
(,,( )
helper,,) /
.,,/ 0
ViewData,,0 8
.,,8 9
Model,,9 >
),,> ?
;,,? @
return-- 
	generator-- 
.-- 
InputFor-- %
(--% &

expression--& 0
)--0 1
;--1 2
}.. 	
public00 
static00 
HtmlTag00 
FileInputBlock00 ,
<00, -
T00- .
>00. /
(00/ 0
this000 4
IHtmlHelper005 @
<00@ A
T00A B
>00B C
helper00D J
,00J K

Expression00L V
<00V W
Func00W [
<00[ \
T00\ ]
,00] ^
object00_ e
>00e f
>00f g

expression00h r
)00r s
where00t y
T00z {
:00| }
class	00~ �
{11 	
var22 
accept22 
=22 
Property22 !
.22! "
From22" &
(22& '

expression22' 1
)221 2
.222 3
GetCustomAttributes223 F
<22F G
AcceptAttribute22G V
>22V W
(22W X
)22X Y
.22Y Z
SingleOrDefault22Z i
(22i j
)22j k
;22k l
Action44 
<44 
HtmlTag44 
>44 
action44 "
=44# $
input44% *
=>44+ -
{55 
input66 
.66 
Attr66 
(66 
$str66 !
,66! "
$str66# )
)66) *
;66* +
input77 
.77 
AddClass77 
(77 
$str77 -
)77- .
;77. /
if88 
(88 
accept88 
!=88 
null88 "
)88" #
input99 
.99 
Attr99 
(99 
$str99 '
,99' (
accept99) /
.99/ 0
FileTypeSpecifier990 A
)99A B
;99B C
}:: 
;:: 
return<< 
helper<< 
.<< 

InputBlock<< $
(<<$ %

expression<<% /
,<</ 0
null<<1 5
,<<5 6
null<<7 ;
,<<; <
action<<= C
)<<C D
;<<D E
}== 	
public?? 
static?? 
HtmlTag?? 
Label?? #
<??# $
T??$ %
>??% &
(??& '
this??' +
IHtmlHelper??, 7
<??7 8
T??8 9
>??9 :
helper??; A
,??A B

Expression??C M
<??M N
Func??N R
<??R S
T??S T
,??T U
object??V \
>??\ ]
>??] ^

expression??_ i
)??i j
where??k p
T??q r
:??s t
class??u z
{@@ 	
varAA 
	generatorAA 
=AA 
GetGeneratorAA (
(AA( )
helperAA) /
.AA/ 0
ViewDataAA0 8
.AA8 9
ModelAA9 >
)AA> ?
;AA? @
returnBB 
	generatorBB 
.BB 
LabelForBB %
(BB% &

expressionBB& 0
)BB0 1
;BB1 2
}CC 	
publicEE 
staticEE 
HtmlTagEE 
ToolTipEE %
<EE% &
TEE& '
>EE' (
(EE( )
thisEE) -
IHtmlHelperEE. 9
<EE9 :
TEE: ;
>EE; <
helperEE= C
,EEC D
stringEEE K
helpTooltipTextEEL [
)EE[ \
{FF 	
varGG 
helpTooltipGG 
=GG 
newGG !
HtmlTagGG" )
(GG) *
$strGG* 0
)GG0 1
;GG1 2
ifHH 
(HH 
!HH 
stringHH 
.HH 
IsNullOrEmptyHH %
(HH% &
helpTooltipTextHH& 5
)HH5 6
)HH6 7
{II 
helpTooltipJJ 
.KK 
AttrKK 
(KK 
$strKK !
,KK! "
helpTooltipTextKK# 2
)KK2 3
.LL 
DataLL 
(LL 
$strLL "
,LL" #
$strLL$ -
)LL- .
.MM 

AddClassesMM 
(MM  
$strMM  $
,MM$ %
$strMM& <
,MM< =
$strMM> J
)MMJ K
;MMK L
}NN 
helpTooltipOO 
=OO 
helpTooltipOO %
.OO% &
WrapWithOO& .
(OO. /
newOO/ 2
HtmlTagOO3 :
(OO: ;
$strOO; A
)OOA B
.OOB C

AddClassesOOC M
(OOM N
$strOON Y
,OOY Z
$strOO[ f
)OOf g
)OOg h
;OOh i
returnQQ 
helpTooltipQQ 
;QQ 
}RR 	
privateTT 
staticTT 
HtmlTagTT 
	FormBlockTT (
(TT( )
HtmlTagTT) 0
labelTT1 6
,TT6 7
HtmlTagTT8 ?
inputTT@ E
,TTE F
HtmlTagTTG N
toolTipTTO V
)TTV W
{UU 	
varVV 
formRowVV 
=VV 
newVV 
DivTagVV $
(VV$ %
)VV% &
.VV& '

AddClassesVV' 1
(VV1 2
$strVV2 7
,VV7 8
$strVV9 E
)VVE F
;VVF G
formRowWW 
.WW 
AppendWW 
(WW 
labelWW  
)WW  !
;WW! "
formRowXX 
.XX 
AppendXX 
(XX 
inputXX  
)XX  !
;XX! "
formRowYY 
.YY 
AppendYY 
(YY 
toolTipYY "
)YY" #
;YY# $
var[[ 
wrapper[[ 
=[[ 
new[[ 
DivTag[[ $
([[$ %
)[[% &
.[[& '
AddClass[[' /
([[/ 0
$str[[0 A
)[[A B
;[[B C
wrapper\\ 
.\\ 
Append\\ 
(\\ 
formRow\\ "
)\\" #
;\\# $
return^^ 
wrapper^^ 
;^^ 
}__ 	
publicaa 
staticaa 
HtmlTagaa  
NumberOnlyInputBlockaa 2
<aa2 3
Taa3 4
>aa4 5
(aa5 6
thisaa6 :
IHtmlHelperaa; F
<aaF G
TaaG H
>aaH I
helperaaJ P
,aaP Q

ExpressionaaR \
<aa\ ]
Funcaa] a
<aaa b
Taab c
,aac d
objectaae k
>aak l
>aal m

expressionaan x
,aax y
string	aaz �
placeholderText
aa� �
=
aa� �
null
aa� �
,
aa� �
string
aa� �
helpTooltipText
aa� �
=
aa� �
null
aa� �
,
aa� �
string
aa� �
customLabelText
aa� �
=
aa� �
null
aa� �
,
aa� �
int
aa� �
maxValue
aa� �
=
aa� �
int
aa� �
.
aa� �
MaxValue
aa� �
,
aa� �
int
aa� �
minValue
aa� �
=
aa� �
$num
aa� �
)
aa� �
where
aa� �
T
aa� �
:
aa� �
class
aa� �
{bb 	
voidcc 
Actioncc 
(cc 
HtmlTagcc 
inputcc  %
)cc% &
{dd 
inputee 
.ee 
Attree 
(ee 
$stree !
,ee! "
$stree# +
)ee+ ,
;ee, -
inputff 
.ff 
Attrff 
(ff 
$strff  
,ff  !
maxValueff" *
)ff* +
;ff+ ,
inputgg 
.gg 
Attrgg 
(gg 
$strgg  
,gg  !
minValuegg" *
)gg* +
;gg+ ,
inputhh 
.hh 
AddClasshh 
(hh 
$strhh -
)hh- .
;hh. /
}ii 
returnkk 
helperkk 
.kk 

InputBlockkk $
(kk$ %

expressionkk% /
,kk/ 0
placeholderTextkk1 @
,kk@ A
helpTooltipTextkkB Q
,kkQ R
ActionkkS Y
,kkY Z
customLabelTextkk[ j
)kkj k
;kkk l
}ll 	
publicnn 
staticnn 
HtmlTagnn 

InputBlocknn (
<nn( )
Tnn) *
>nn* +
(nn+ ,
thisnn, 0
IHtmlHelpernn1 <
<nn< =
Tnn= >
>nn> ?
helpernn@ F
,nnF G

ExpressionnnH R
<nnR S
FuncnnS W
<nnW X
TnnX Y
,nnY Z
objectnn[ a
>nna b
>nnb c

expressionnnd n
,nnn o
stringnnp v
placeholderText	nnw �
=
nn� �
null
nn� �
,
nn� �
string
nn� �
helpTooltipText
nn� �
=
nn� �
null
nn� �
,
nn� �
Action
nn� �
<
nn� �
HtmlTag
nn� �
>
nn� �
inputModifier
nn� �
=
nn� �
null
nn� �
,
nn� �
string
nn� �
customLabelText
nn� �
=
nn� �
null
nn� �
)
nn� �
where
nn� �
T
nn� �
:
nn� �
class
nn� �
{oo 	
Preconditionspp 
.pp 
ThrowIfNullpp %
(pp% &
helperpp& ,
,pp, -
nameofpp. 4
(pp4 5
helperpp5 ;
)pp; <
)pp< =
;pp= >
Preconditionsqq 
.qq 
ThrowIfNullqq %
(qq% &

expressionqq& 0
,qq0 1
nameofqq2 8
(qq8 9

expressionqq9 C
)qqC D
)qqD E
;qqE F
varss 
labelss 
=ss 
helperss 
.ss 
Labelss $
(ss$ %

expressionss% /
)ss/ 0
;ss0 1
iftt 
(tt 
customLabelTexttt 
!=tt  "
nulltt# '
)tt' (
{uu 
labelvv 
.vv 
Textvv 
(vv 
customLabelTextvv *
)vv* +
;vv+ ,
}ww 
labelxx 
=xx 
labelxx 
.xx 
WrapWithxx "
(xx" #
newxx# &
DivTagxx' -
(xx- .
)xx. /
.xx/ 0

AddClassesxx0 :
(xx: ;
$strxx; E
,xxE F
$strxxG S
)xxS T
)xxT U
;xxU V
varzz 
inputzz 
=zz 
helperzz 
.zz 
Inputzz $
(zz$ %

expressionzz% /
)zz/ 0
;zz0 1
if{{ 
({{ 
!{{ 
string{{ 
.{{ 
IsNullOrEmpty{{ %
({{% &
placeholderText{{& 5
){{5 6
){{6 7
{|| 
input}} 
.}} 
AddPlaceholder}} $
(}}$ %
placeholderText}}% 4
)}}4 5
;}}5 6
}~~ 
inputModifier 
? 
. 
Invoke !
(! "
input" '
)' (
;( )
var
�� 

isCheckbox
�� 
=
�� 

expression
�� '
?
��' (
.
��( )

ToAccessor
��) 3
(
��3 4
)
��4 5
?
��5 6
.
��6 7
PropertyType
��7 C
==
��D F
typeof
��G M
(
��M N
bool
��N R
)
��R S
;
��S T
input
�� 
=
�� 
input
�� 
.
�� 
WrapWith
�� "
(
��" #
new
��# &
DivTag
��' -
(
��- .
)
��. /
.
��/ 0

AddClasses
��0 :
(
��: ;
$str
��; E
,
��E F

isCheckbox
��G Q
?
��R S
$str
��T _
:
��` a
$str
��b o
)
��o p
)
��p q
;
��q r
var
�� 
helpTooltip
�� 
=
�� 
helper
�� $
.
��$ %
ToolTip
��% ,
(
��, -
helpTooltipText
��- <
)
��< =
;
��= >
helpTooltip
�� 
=
�� 
helpTooltip
�� %
.
��% &

AddClasses
��& 0
(
��0 1
$str
��1 ;
)
��; <
;
��< =
return
�� 
	FormBlock
�� 
(
�� 
label
�� "
,
��" #
input
��$ )
,
��) *
helpTooltip
��+ 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
static
�� 
HtmlTag
��  
InputTextAreaBlock
�� 0
<
��0 1
T
��1 2
>
��2 3
(
��3 4
this
��4 8
IHtmlHelper
��9 D
<
��D E
T
��E F
>
��F G
helper
��H N
,
��N O

Expression
��P Z
<
��Z [
Func
��[ _
<
��_ `
T
��` a
,
��a b
object
��c i
>
��i j
>
��j k

expression
��l v
,
��v w
string
��x ~
value�� �
=��� �
null��� �
,��� �
string��� �
placeholderText��� �
=��� �
null��� �
,��� �
string��� �
helpText��� �
=��� �
null��� �
,��� �
Action��� �
<��� �
HtmlTag��� �
>��� �
inputModifier��� �
=��� �
null��� �
,��� �
string��� �
customLabelText��� �
=��� �
null��� �
)��� �
where��� �
T��� �
:��� �
class��� �
{
�� 	
Preconditions
�� 
.
�� 
ThrowIfNull
�� %
(
��% &
helper
��& ,
,
��, -
nameof
��. 4
(
��4 5
helper
��5 ;
)
��; <
)
��< =
;
��= >
Preconditions
�� 
.
�� 
ThrowIfNull
�� %
(
��% &

expression
��& 0
,
��0 1
nameof
��2 8
(
��8 9

expression
��9 C
)
��C D
)
��D E
;
��E F
var
�� 
label
�� 
=
�� 
helper
�� 
.
�� 
Label
�� $
(
��$ %

expression
��% /
)
��/ 0
;
��0 1
if
�� 
(
�� 
customLabelText
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
label
�� 
.
�� 
Text
�� 
(
�� 
customLabelText
�� *
)
��* +
;
��+ ,
}
�� 
label
�� 
=
�� 
label
�� 
.
�� 
WrapWith
�� "
(
��" #
new
��# &
DivTag
��' -
(
��- .
)
��. /
.
��/ 0

AddClasses
��0 :
(
��: ;
$str
��; E
,
��E F
$str
��G S
)
��S T
)
��T U
;
��U V
var
�� $
expressionPropertyName
�� &
=
��' (
Property
��) 1
.
��1 2
From
��2 6
(
��6 7

expression
��7 A
)
��A B
.
��B C
Name
��C G
;
��G H
var
�� 
textAreaInput
�� 
=
�� 
new
��  #
HtmlTag
��$ +
(
��+ ,
$str
��, 6
)
��6 7
.
�� 
Id
�� 
(
�� $
expressionPropertyName
�� *
)
��* +
.
�� 
Name
�� 
(
�� $
expressionPropertyName
�� ,
)
��, -
.
�� 
AddClass
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
value
��& +
)
��+ ,
)
��, -
{
�� 
textAreaInput
�� 
.
�� 

AppendText
�� (
(
��( )
value
��) .
)
��. /
;
��/ 0
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
placeholderText
��& 5
)
��5 6
)
��6 7
{
�� 
textAreaInput
�� 
.
�� 
AddPlaceholder
�� ,
(
��, -
placeholderText
��- <
)
��< =
;
��= >
}
�� 
inputModifier
�� 
?
�� 
.
�� 
Invoke
�� !
(
��! "
textAreaInput
��" /
)
��/ 0
;
��0 1
textAreaInput
�� 
=
�� 
textAreaInput
�� )
.
��) *
WrapWith
��* 2
(
��2 3
new
��3 6
DivTag
��7 =
(
��= >
)
��> ?
.
��? @

AddClasses
��@ J
(
��J K
$str
��K U
,
��U V
$str
��W b
)
��b c
)
��c d
;
��d e
textAreaInput
�� 
.
�� 
Append
��  
(
��  !
new
��! $
HtmlTag
��% ,
(
��, -
$str
��- 4
)
��4 5
.
��5 6

AppendText
��6 @
(
��@ A
helpText
��A I
)
��I J
.
��J K
AddClass
��K S
(
��S T
$str
��T `
)
��` a
)
��a b
;
��b c
return
�� 
	FormBlock
�� 
(
�� 
label
�� "
,
��" #
textAreaInput
��$ 1
,
��1 2
HtmlTag
��3 :
.
��: ;
Empty
��; @
(
��@ A
)
��A B
)
��B C
;
��C D
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 

SelectList
�� (
<
��( )
T
��) *
,
��* +
TR
��, .
>
��. /
(
��/ 0
this
��0 4
IHtmlHelper
��5 @
<
��@ A
T
��A B
>
��B C
helper
��D J
,
��J K

Expression
��L V
<
��V W
Func
��W [
<
��[ \
T
��\ ]
,
��] ^
TR
��_ a
>
��a b
>
��b c

expression
��d n
,
��n o
bool
��p t!
includeBlankOption��u �
=��� �
false��� �
)��� �
where
�� 
T
�� 
:
�� 
class
�� 
where
�� 
TR
�� 
:
�� 
Enumeration
�� "
<
��" #
TR
��# %
>
��% &
{
�� 	
var
�� 
getAllMethod
�� 
=
�� 
typeof
�� %
(
��& '
TR
��' )
)
��) *
.
��* +
	GetMethod
��+ 4
(
��4 5
$str
��5 =
,
��= >
BindingFlags
��? K
.
��K L
Public
��L R
|
��S T
BindingFlags
��U a
.
��a b
Static
��b h
|
��i j
BindingFlags
��k w
.
��w x
FlattenHierarchy��x �
)��� �
;��� �
var
�� 
enumerationValues
�� !
=
��" #
(
��$ %
IEnumerable
��% 0
<
��0 1
TR
��1 3
>
��3 4
)
��4 5
getAllMethod
��5 A
.
��A B
Invoke
��B H
(
��H I
null
��I M
,
��M N
null
��O S
)
��S T
;
��T U
var
�� 
model
�� 
=
�� 
helper
�� 
.
�� 
ViewData
�� '
.
��' (
Model
��( -
;
��- .
var
�� 
expressionValue
�� 
=
��  !

expression
��" ,
.
��, -
Compile
��- 4
(
��4 5
)
��5 6
.
��6 7
Invoke
��7 =
(
��= >
model
��> C
)
��C D
;
��D E
var
�� !
convertedExpression
�� #
=
��$ %

expression
��& 0
.
��0 1
Cast
��1 5
<
��5 6
T
��6 7
,
��7 8
TR
��9 ;
,
��; <
object
��= C
>
��C D
(
��D E
)
��E F
;
��F G
return
�� 
helper
�� 
.
�� 

SelectList
�� $
(
��$ %!
convertedExpression
��% 8
,
��8 9
enumerationValues
��: K
,
��K L
i
��M N
=>
��O Q
new
��R U
SelectListItem
��V d
{
��e f
Text
��g k
=
��l m
i
��n o
.
��o p
DisplayName
��p {
,
��{ |
Value��} �
=��� �
i��� �
.��� �
Value��� �
.��� �
ToString��� �
(��� �
)��� �
,��� �
Selected��� �
=��� �
i��� �
==��� �
expressionValue��� �
}��� �
,��� �"
includeBlankOption��� �
)��� �
;��� �
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 

SelectList
�� (
<
��( )
T
��) *
,
��* +
TR
��, .
>
��. /
(
��/ 0
this
��0 4
IHtmlHelper
��5 @
<
��@ A
T
��A B
>
��B C
helper
��D J
,
��J K

Expression
��L V
<
��V W
Func
��W [
<
��[ \
T
��\ ]
,
��] ^
object
��_ e
>
��e f
>
��f g

expression
��h r
,
��r s
IEnumerable
��t 
<�� �
TR��� �
>��� �
options��� �
,��� �
Func��� �
<��� �
TR��� �
,��� �
SelectListItem��� �
>��� �%
selectListItemBuilder��� �
,��� �
bool��� �"
includeBlankOption��� �
=��� �
false��� �
)��� �
where��� �
T��� �
:��� �
class��� �
{
�� 	
var
�� 
input
�� 
=
�� 
helper
�� 
.
�� 
Input
�� $
(
��$ %

expression
��% /
)
��/ 0
.
��0 1
TagName
��1 8
(
��8 9
$str
��9 A
)
��A B
.
��B C

RemoveAttr
��C M
(
��M N
$str
��N U
)
��U V
;
��V W
if
�� 
(
��  
includeBlankOption
�� "
)
��" #
{
�� 
var
�� !
blankSelectListItem
�� '
=
��( )
new
��* -
SelectListItem
��. <
{
�� 
Text
�� 
=
�� 
$str
�� 
,
�� 
Value
�� 
=
�� 
$str
�� 
}
�� 
;
�� $
AppendSelectListOption
�� &
(
��& '!
blankSelectListItem
��' :
,
��: ;
input
��< A
)
��A B
;
��B C
}
�� 
foreach
�� 
(
�� 
var
�� 
selectListItem
�� '
in
��( *
options
��+ 2
.
��2 3
Select
��3 9
(
��9 :#
selectListItemBuilder
��: O
)
��O P
)
��P Q
{
�� $
AppendSelectListOption
�� &
(
��& '
selectListItem
��' 5
,
��5 6
input
��7 <
)
��< =
;
��= >
}
�� 
return
�� 
input
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� $
AppendSelectListOption
�� 2
(
��2 3
SelectListItem
��3 A
selectListItem
��B P
,
��P Q
HtmlTag
��R Y
	selectTag
��Z c
)
��c d
{
�� 	
var
�� 
	optionTag
�� 
=
�� 
new
�� 
HtmlTag
��  '
(
��' (
$str
��( 0
)
��0 1
.
��1 2
Attr
��2 6
(
��6 7
$str
��7 >
,
��> ?
selectListItem
��@ N
.
��N O
Value
��O T
)
��T U
.
��U V
Text
��V Z
(
��Z [
selectListItem
��[ i
.
��i j
Text
��j n
)
��n o
;
��o p
if
�� 
(
�� 
selectListItem
�� 
.
�� 
Selected
�� '
)
��' (
{
�� 
	optionTag
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 5
)
��5 6
;
��6 7
}
�� 
	selectTag
�� 
.
�� 
Append
�� 
(
�� 
	optionTag
�� &
)
��& '
;
��' (
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
SelectListBlock
�� -
<
��- .
T
��. /
>
��/ 0
(
��0 1
this
��1 5
IHtmlHelper
��6 A
<
��A B
T
��B C
>
��C D
helper
��E K
,
��K L

Expression
�� 
<
�� 
Func
�� 
<
�� 
T
�� 
,
�� 
object
�� %
>
��% &
>
��& '

expression
��( 2
,
��2 3
IReadOnlyList
��4 A
<
��A B
SelectListItem
��B P
>
��P Q
options
��R Y
)
��Y Z
where
�� 
T
�� 
:
�� 
class
�� 
{
�� 	
var
�� 
model
�� 
=
�� 
helper
�� 
.
�� 
ViewData
�� '
.
��' (
Model
��( -
;
��- .
var
�� 
value
�� 
=
�� 

expression
�� "
.
��" #
Compile
��# *
(
��* +
)
��+ ,
(
��, -
model
��- 2
)
��2 3
;
��3 4
var
�� 
valueLiteral
�� 
=
�� 
value
�� $
?
��$ %
.
��% &
ToString
��& .
(
��. /
)
��/ 0
;
��0 1
return
�� 
helper
�� 
.
�� 
SelectListBlock
�� )
(
��) *

expression
�� 
,
�� 
options
�� #
,
��# $
x
��% &
=>
��' )
new
��* -
SelectListItem
��. <
{
�� 
Disabled
�� 
=
�� 
x
��  
.
��  !
Disabled
��! )
,
��) *
Group
�� 
=
�� 
x
�� 
.
�� 
Group
�� #
,
��# $
Selected
�� 
=
�� 
x
��  
.
��  !
Selected
��! )
||
��* ,
valueLiteral
��- 9
==
��: <
x
��= >
.
��> ?
Value
��? D
,
��D E
Text
�� 
=
�� 
x
�� 
.
�� 
Text
�� !
,
��! "
Value
�� 
=
�� 
x
�� 
.
�� 
Value
�� #
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
SelectListBlock
�� -
<
��- .
T
��. /
,
��/ 0
TR
��1 3
>
��3 4
(
��4 5
this
��5 9
IHtmlHelper
��: E
<
��E F
T
��F G
>
��G H
helper
��I O
,
��O P

Expression
��Q [
<
��[ \
Func
��\ `
<
��` a
T
��a b
,
��b c
object
��d j
>
��j k
>
��k l

expression
��m w
,
��w x
IEnumerable��y �
<��� �
TR��� �
>��� �
options��� �
,��� �
Func��� �
<��� �
TR��� �
,��� �
SelectListItem��� �
>��� �%
selectListItemBuilder��� �
,��� �
string��� �
helpTooltipText��� �
=��� �
null��� �
,��� �
bool��� �"
includeBlankOption��� �
=��� �
false��� �
)��� �
where��� �
T��� �
:��� �
class��� �
{
�� 	
var
�� 

selectList
�� 
=
�� 

SelectList
�� '
(
��' (
helper
��( .
,
��. /

expression
��0 :
,
��: ;
options
��< C
,
��C D#
selectListItemBuilder
��E Z
,
��Z [ 
includeBlankOption
��\ n
)
��n o
;
��o p
return
�� 
helper
�� 
.
�� 
SelectListBlock
�� )
(
��) *

expression
��* 4
,
��4 5

selectList
��6 @
,
��@ A
helpTooltipText
��B Q
,
��Q R 
includeBlankOption
��S e
)
��e f
;
��f g
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
SelectListBlock
�� -
<
��- .
T
��. /
,
��/ 0
TR
��1 3
>
��3 4
(
��4 5
this
��5 9
IHtmlHelper
��: E
<
��E F
T
��F G
>
��G H
helper
��I O
,
��O P

Expression
��Q [
<
��[ \
Func
��\ `
<
��` a
T
��a b
,
��b c
TR
��d f
>
��f g
>
��g h

expression
��i s
,
��s t
string
��u {
helpTooltipText��| �
=��� �
null��� �
,��� �
bool��� �"
includeBlankOption��� �
=��� �
false��� �
)��� �
where
�� 
T
�� 
:
�� 
class
�� 
where
�� 
TR
�� 
:
�� 
Enumeration
�� !
<
��! "
TR
��" $
>
��$ %
{
�� 	
var
�� 

selectList
�� 
=
�� 

SelectList
�� '
(
��' (
helper
��( .
,
��. /

expression
��0 :
,
��: ; 
includeBlankOption
��< N
)
��N O
;
��O P
var
�� !
convertedExpression
�� #
=
��$ %

expression
��& 0
.
��0 1
Cast
��1 5
<
��5 6
T
��6 7
,
��7 8
TR
��9 ;
,
��; <
object
��= C
>
��C D
(
��D E
)
��E F
;
��F G
return
�� 
helper
�� 
.
�� 
SelectListBlock
�� )
(
��) *!
convertedExpression
��* =
,
��= >

selectList
��? I
,
��I J
helpTooltipText
��K Z
,
��Z [ 
includeBlankOption
��\ n
)
��n o
;
��o p
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
SelectListBlock
�� -
<
��- .
T
��. /
>
��/ 0
(
��0 1
this
��1 5
IHtmlHelper
��6 A
<
��A B
T
��B C
>
��C D
helper
��E K
,
��K L

Expression
��M W
<
��W X
Func
��X \
<
��\ ]
T
��] ^
,
��^ _
object
��` f
>
��f g
>
��g h

expression
��i s
,
��s t
HtmlTag
��u |

selectList��} �
,��� �
string��� �
helpTooltipText��� �
=��� �
null��� �
,��� �
bool��� �"
includeBlankOption��� �
=��� �
false��� �
)��� �
where
�� 
T
�� 
:
�� 
class
�� 
{
�� 	
var
�� 
label
�� 
=
�� 
helper
�� 
.
�� 
Label
�� $
(
��$ %

expression
��% /
)
��/ 0
;
��0 1
label
�� 
=
�� 
label
�� 
.
�� 
WrapWith
�� "
(
��" #
new
��# &
DivTag
��' -
(
��- .
)
��. /
.
��/ 0

AddClasses
��0 :
(
��: ;
$str
��; E
,
��E F
$str
��G S
)
��S T
)
��T U
;
��U V
var
�� 
input
�� 
=
�� 

selectList
�� "
;
��" #
input
�� 
=
�� 
input
�� 
.
�� 
WrapWith
�� "
(
��" #
new
��# &
DivTag
��' -
(
��- .
)
��. /
.
��/ 0

AddClasses
��0 :
(
��: ;
$str
��; E
,
��E F
$str
��G R
)
��R S
)
��S T
;
��T U
var
�� 
helpTooltip
�� 
=
�� 
helper
�� $
.
��$ %
ToolTip
��% ,
(
��, -
helpTooltipText
��- <
)
��< =
;
��= >
helpTooltip
�� 
=
�� 
helpTooltip
�� %
.
��% &

AddClasses
��& 0
(
��0 1
$str
��1 ;
)
��; <
;
��< =
return
�� 
	FormBlock
�� 
(
�� 
label
�� "
,
��" #
input
��$ )
,
��) *
helpTooltip
��+ 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
MultiSelectList
�� -
<
��- .
T
��. /
,
��/ 0
TR
��1 3
>
��3 4
(
��4 5
this
��5 9
IHtmlHelper
��: E
<
��E F
T
��F G
>
��G H
helper
��I O
,
��O P

Expression
��Q [
<
��[ \
Func
��\ `
<
��` a
T
��a b
,
��b c
object
��d j
>
��j k
>
��k l

expression
��m w
,
��w x
IEnumerable
�� 
<
�� 
TR
�� 
>
�� 
options
�� #
,
��# $
Func
�� 
<
�� 
TR
�� 
,
�� 
SelectListItem
�� #
>
��# $#
selectListItemBuilder
��% :
)
��: ;
where
��< A
T
��B C
:
��D E
class
��F K
{
�� 	
var
�� 
input
�� 
=
�� 
helper
�� 
.
�� 

SelectList
�� )
(
��) *

expression
��* 4
,
��4 5
options
��6 =
,
��= >#
selectListItemBuilder
��? T
)
��T U
;
��U V
input
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� !
,
��! "
$str
��# -
)
��- .
;
��. /
return
�� 
input
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
HtmlTag
�� "
MultiSelectListBlock
�� 2
<
��2 3
T
��3 4
,
��4 5
TR
��6 8
>
��8 9
(
��9 :
this
��: >
IHtmlHelper
��? J
<
��J K
T
��K L
>
��L M
helper
��N T
,
��T U

Expression
�� 
<
�� 
Func
�� 
<
�� 
T
�� 
,
�� 
object
�� %
>
��% &
>
��& '

expression
��( 2
,
��2 3
IEnumerable
�� 
<
�� 
TR
�� 
>
�� 
options
�� #
,
��# $
Func
�� 
<
�� 
TR
�� 
,
�� 
SelectListItem
�� #
>
��# $#
selectListItemBuilder
��% :
,
��: ;
string
�� 
helpTooltipText
�� "
=
��# $
null
��% )
)
�� 	
where
�� 
T
�� 
:
�� 
class
�� 
{
�� 	
var
�� 
label
�� 
=
�� 
helper
�� 
.
�� 
Label
�� $
(
��$ %

expression
��% /
)
��/ 0
;
��0 1
label
�� 
=
�� 
label
�� 
.
�� 
WrapWith
�� "
(
��" #
new
��# &
DivTag
��' -
(
��- .
)
��. /
.
��/ 0

AddClasses
��0 :
(
��: ;
$str
��; E
,
��E F
$str
��G S
)
��S T
)
��T U
;
��U V
var
�� 
input
�� 
=
�� 
helper
�� 
.
�� 
MultiSelectList
�� .
(
��. /

expression
��/ 9
,
��9 :
options
��; B
,
��B C#
selectListItemBuilder
��D Y
)
��Y Z
;
��Z [
input
�� 
=
�� 
input
�� 
.
�� 
WrapWith
�� "
(
��" #
new
��# &
DivTag
��' -
(
��- .
)
��. /
.
��/ 0

AddClasses
��0 :
(
��: ;
$str
��; E
,
��E F
$str
��G R
)
��R S
)
��S T
;
��T U
var
�� 
helpTooltip
�� 
=
�� 
helper
�� $
.
��$ %
ToolTip
��% ,
(
��, -
helpTooltipText
��- <
)
��< =
;
��= >
helpTooltip
�� 
=
�� 
helpTooltip
�� %
.
��% &

AddClasses
��& 0
(
��0 1
$str
��1 ;
)
��; <
;
��< =
return
�� 
	FormBlock
�� 
(
�� 
label
�� "
,
��" #
input
��$ )
,
��) *
helpTooltip
��+ 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
ModalFormButtons
�� .
<
��. /
T
��/ 0
>
��0 1
(
��1 2
this
��2 6
IHtmlHelper
��7 B
<
��B C
T
��C D
>
��D E
helper
��F L
,
��L M
string
��N T
confirmButtonText
��U f
=
��g h
$str
��i w
,
��w x
string
��y 
updateTargetId��� �
=��� �
$str��� �
)��� �
{
�� 	
var
�� 
cancelButton
�� 
=
�� 
helper
�� %
.
��% &
CancelModalButton
��& 7
(
��7 8
)
��8 9
;
��9 :
var
�� 

saveButton
�� 
=
�� 
helper
�� #
.
��# $
SaveModalButton
��$ 3
(
��3 4
confirmButtonText
��4 E
,
��E F
updateTargetId
��G U
)
��U V
;
��V W
return
�� 
cancelButton
�� 
.
��  
After
��  %
(
��% &

saveButton
��& 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
Button
�� $
<
��$ %
T
��% &
>
��& '
(
��' (
this
��( ,
IHtmlHelper
��- 8
<
��8 9
T
��9 :
>
��: ;
helper
��< B
,
��B C
string
��D J

buttonText
��K U
)
��U V
{
�� 	
var
�� 
button
�� 
=
�� 
new
�� 
HtmlTag
�� $
(
��$ %
$str
��% -
)
��- .
.
�� 
Text
�� 
(
�� 

buttonText
��  
)
��  !
.
�� 

AddClasses
�� 
(
�� 
$str
�� !
,
��! "
$str
��# 0
,
��0 1
$str
��2 7
)
��7 8
;
��8 9
return
�� 
button
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 

SaveButton
�� (
<
��( )
T
��) *
>
��* +
(
��+ ,
this
��, 0
IHtmlHelper
��1 <
<
��< =
T
��= >
>
��> ?
helper
��@ F
,
��F G
string
��H N

buttonText
��O Y
=
��Z [
$str
��\ j
,
��j k
string
��l r
updateTargetId��s �
=��� �
$str��� �
)��� �
{
�� 	
var
�� 

saveButton
�� 
=
�� 
helper
�� #
.
��# $
Button
��$ *
(
��* +

buttonText
��+ 5
)
��5 6
.
�� 
Attr
�� 
(
�� 
$str
�� 
,
�� 
$str
�� &
)
��& '
;
��' (
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
updateTargetId
��& 4
)
��4 5
)
��5 6
{
�� 

saveButton
�� 
=
�� 

saveButton
�� '
.
��' (
Data
��( ,
(
��, -
$str
��- ?
,
��? @
updateTargetId
��A O
)
��O P
;
��P Q
}
�� 
return
�� 

saveButton
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
SaveModalButton
�� -
<
��- .
T
��. /
>
��/ 0
(
��0 1
this
��1 5
IHtmlHelper
��6 A
<
��A B
T
��B C
>
��C D
helper
��E K
,
��K L
string
��M S

buttonText
��T ^
=
��_ `
$str
��a o
,
��o p
string
��q w
updateTargetId��x �
=��� �
$str��� �
)��� �
{
�� 	
return
�� 
helper
�� 
.
�� 

SaveButton
�� $
(
��$ %

buttonText
��% /
,
��/ 0
updateTargetId
��1 ?
)
��? @
.
��@ A
Data
��A E
(
��E F
$str
��F O
,
��O P
$str
��Q W
)
��W X
;
��X Y
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
CancelButton
�� *
<
��* +
T
��+ ,
>
��, -
(
��- .
this
��. 2
IHtmlHelper
��3 >
<
��> ?
T
��? @
>
��@ A
helper
��B H
,
��H I
string
��J P

buttonText
��Q [
=
��\ ]
$str
��^ f
)
��f g
{
�� 	
return
�� 
new
�� 
HtmlTag
�� 
(
�� 
$str
�� '
)
��' (
.
�� 
Text
�� 
(
�� 

buttonText
��  
)
��  !
.
�� 

AddClasses
�� 
(
�� 
$str
�� !
,
��! "
$str
��# 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
CancelModalButton
�� /
<
��/ 0
T
��0 1
>
��1 2
(
��2 3
this
��3 7
IHtmlHelper
��8 C
<
��C D
T
��D E
>
��E F
helper
��G M
,
��M N
string
��O U

buttonText
��V `
=
��a b
$str
��c k
)
��k l
{
�� 	
return
�� 
helper
�� 
.
�� 
CancelButton
�� &
(
��& '

buttonText
��' 1
)
��1 2
.
��2 3
Data
��3 7
(
��7 8
$str
��8 A
,
��A B
$str
��C J
)
��J K
;
��K L
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
ValidationBlock
�� -
<
��- .
T
��. /
>
��/ 0
(
��0 1
this
��1 5
IHtmlHelper
��6 A
<
��A B
T
��B C
>
��C D
helper
��E K
)
��K L
{
�� 	
return
�� 
new
�� 
DivTag
�� 
(
�� 
)
�� 
.
��  

AddClasses
��  *
(
��* +
$str
��+ >
,
��> ?
$str
��@ G
,
��G H
$str
��I W
,
��W X
$str
��Y a
)
��a b
;
��b c
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
NavTabs
�� %
<
��% &
T
��& '
>
��' (
(
��( )
this
��) -
IHtmlHelper
��. 9
helper
��: @
,
��@ A

IUrlHelper
��B L
	urlHelper
��M V
,
��V W
List
��X \
<
��\ ]

TabDisplay
��] g
<
��g h
T
��h i
>
��i j
>
��j k
tabs
��l p
,
��p q
object
��r x 
commonRouteValues��y �
=��� �
null��� �
)��� �
where��� �
T��� �
:��� �
Enumeration��� �
<��� �
T��� �
>��� �
,��� �
ITabEnumeration��� �
{
�� 	
var
�� 
tabTag
�� 
=
�� 
new
�� 
HtmlTag
�� $
(
��$ %
$str
��% )
)
��) *
.
��* +

AddClasses
��+ 5
(
��5 6
$str
��6 ;
,
��; <
$str
��= G
)
��G H
;
��H I
BuildNavEntries
�� 
(
�� 
	urlHelper
�� %
,
��% &
tabs
��' +
,
��+ ,
tabTag
��- 3
,
��3 4
commonRouteValues
��5 F
)
��F G
;
��G H
return
�� 
tabTag
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
NavPills
�� &
<
��& '
T
��' (
>
��( )
(
��) *
this
��* .
IHtmlHelper
��/ :
helper
��; A
,
��A B

IUrlHelper
��C M
	urlHelper
��N W
,
��W X
List
��Y ]
<
��] ^

TabDisplay
��^ h
<
��h i
T
��i j
>
��j k
>
��k l
tabs
��m q
,
��q r
object
��s y 
commonRouteValues��z �
=��� �
null��� �
)��� �
where��� �
T��� �
:��� �
Enumeration��� �
<��� �
T��� �
>��� �
,��� �
ITabEnumeration��� �
{
�� 	
var
�� 
tabTag
�� 
=
�� 
new
�� 
HtmlTag
�� $
(
��$ %
$str
��% )
)
��) *
.
��* +

AddClasses
��+ 5
(
��5 6
$str
��6 ;
,
��; <
$str
��= H
,
��H I
$str
��J \
)
��\ ]
;
��] ^
BuildNavEntries
�� 
(
�� 
	urlHelper
�� %
,
��% &
tabs
��' +
,
��+ ,
tabTag
��- 3
,
��3 4
commonRouteValues
��5 F
)
��F G
;
��G H
return
�� 
tabTag
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� 
BuildNavEntries
�� +
<
��+ ,
T
��, -
>
��- .
(
��. /

IUrlHelper
��/ 9
	urlHelper
��: C
,
��C D
List
��E I
<
��I J

TabDisplay
��J T
<
��T U
T
��U V
>
��V W
>
��W X
tabs
��Y ]
,
��] ^
HtmlTag
��_ f
tabTag
��g m
,
��m n
object
��o u 
commonRouteValues��v �
)��� �
where��� �
T��� �
:��� �
Enumeration��� �
<��� �
T��� �
>��� �
,��� �
ITabEnumeration��� �
{
�� 	
foreach
�� 
(
�� 
var
�� 
tab
�� 
in
�� 
tabs
��  $
.
��$ %
OrderBy
��% ,
(
��, -
a
��- .
=>
��/ 1
a
��2 3
.
��3 4
Tab
��4 7
.
��7 8
Value
��8 =
)
��= >
)
��> ?
{
�� 
var
�� 
listItem
�� 
=
�� 
new
�� "
HtmlTag
��# *
(
��* +
$str
��+ /
)
��/ 0
;
��0 1
if
�� 
(
�� 
!
�� 
tab
�� 
.
�� 
	IsEnabled
�� "
)
��" #
{
�� 
listItem
�� 
.
�� 
AddClass
�� %
(
��% &
$str
��& 0
)
��0 1
;
��1 2
}
�� 
if
�� 
(
�� 
!
�� 
tab
�� 
.
�� 
	IsVisible
�� "
)
��" #
{
�� 
listItem
�� 
.
�� 
AddClass
�� %
(
��% &
$str
��& .
)
��. /
;
��/ 0
}
�� 
if
�� 
(
�� 
tab
�� 
.
�� 

IsSelected
�� "
)
��" #
{
�� 
listItem
�� 
.
�� 
AddClass
�� %
(
��% &
$str
��& .
)
��. /
;
��/ 0
listItem
�� 
.
�� 
Append
�� #
(
��# $
new
��$ '
HtmlTag
��( /
(
��/ 0
$str
��0 3
)
��3 4
.
��4 5
Attr
��5 9
(
��9 :
$str
��: @
,
��@ A
$str
��B E
)
��E F
.
��F G
Text
��G K
(
��K L
tab
��L O
.
��O P
Tab
��P S
.
��S T
DisplayName
��T _
)
��_ `
)
��` a
;
��a b
}
�� 
else
�� 
{
�� 
var
�� 
url
�� 
=
�� 
	urlHelper
�� '
.
��' (
Action
��( .
(
��. /
tab
��/ 2
.
��2 3
Tab
��3 6
.
��6 7

ActionName
��7 A
,
��A B
tab
��C F
.
��F G
Tab
��G J
.
��J K
ControllerName
��K Y
,
��Y Z
commonRouteValues
��[ l
)
��l m
;
��m n
listItem
�� 
.
�� 
Append
�� #
(
��# $
new
��$ '
HtmlTag
��( /
(
��/ 0
$str
��0 3
)
��3 4
.
��4 5
Attr
��5 9
(
��9 :
$str
��: @
,
��@ A
url
��B E
)
��E F
.
��F G
Text
��G K
(
��K L
tab
��L O
.
��O P
Tab
��P S
.
��S T
DisplayName
��T _
)
��_ `
)
��` a
;
��a b
}
�� 
tabTag
�� 
.
�� 
Append
�� 
(
�� 
listItem
�� &
)
��& '
;
��' (
}
�� 
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
InlineRadioButton
�� /
<
��/ 0
T
��0 1
,
��1 2
TEnumeration
��3 ?
>
��? @
(
��@ A
this
��A E
IHtmlHelper
��F Q
<
��Q R
T
��R S
>
��S T
helper
��U [
,
��[ \

Expression
��] g
<
��g h
Func
��h l
<
��l m
T
��m n
,
��n o
object
��p v
>
��v w
>
��w x

expression��y �
,��� �
TEnumeration��� �
option��� �
,��� �
string��� �
helpTooltipText��� �
=��� �
null��� �
,��� �
string��� �
id��� �
=��� �
null��� �
,��� �
bool��� �
enabled��� �
=��� �
true��� �
)��� �
where
�� 
T
�� 
:
�� 
class
�� 
where
�� 
TEnumeration
�� 
:
�� 
Enumeration
��  +
<
��+ ,
TEnumeration
��, 8
>
��8 9
{
�� 	
var
�� 
model
�� 
=
�� 
helper
�� 
.
�� 
ViewData
�� '
.
��' (
Model
��( -
;
��- .
var
�� 
value
�� 
=
�� 
model
�� 
==
��  
null
��! %
?
��& '
default
��( /
(
��/ 0
TEnumeration
��0 <
)
��< =
:
��> ?

expression
��@ J
.
��J K
Compile
��K R
(
��R S
)
��S T
(
��T U
model
��U Z
)
��Z [
;
��[ \
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
id
�� 
=
�� 
Guid
�� 
.
�� 
NewGuid
�� !
(
��! "
)
��" #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
;
��. /
}
�� 
var
�� 
input
�� 
=
�� 
helper
�� 
.
�� 
Input
�� $
(
��$ %

expression
��% /
)
��/ 0
.
�� 
Attr
�� 
(
�� 
$str
�� 
,
�� 
$str
�� %
)
��% &
.
�� 
Attr
�� 
(
�� 
$str
�� 
,
�� 
option
�� %
.
��% &
Value
��& +
)
��+ ,
.
�� 
AddClass
�� 
(
�� 
$str
�� (
)
��( )
.
�� 
Id
�� 
(
�� 
id
�� 
)
�� 
;
�� 
if
�� 
(
�� 
option
�� 
==
�� 
value
�� 
)
��  
{
�� 
input
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� $
,
��$ %
$str
��& /
)
��/ 0
;
��0 1
}
�� 
if
�� 
(
�� 
!
�� 
enabled
�� 
)
�� 
{
�� 
input
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� %
,
��% &
$str
��' -
)
��- .
;
��. /
}
�� 
var
�� 
label
�� 
=
�� 
new
�� 
HtmlTag
�� #
(
��# $
$str
��$ +
)
��+ ,
.
�� 
AddClass
�� 
(
�� 
$str
�� .
)
��. /
.
�� 
Text
�� 
(
�� 
option
�� 
.
�� 
DisplayName
�� (
)
��( )
.
�� 
Attr
�� 
(
�� 
$str
�� 
,
�� 
id
�� 
)
��  
;
��  !
input
�� 
.
�� 
Append
�� 
(
�� 
label
�� 
)
�� 
;
��  
if
�� 
(
�� 
!
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� *
(
��* +
helpTooltipText
��+ :
)
��: ;
)
��; <
{
�� 
var
�� 
helpTooltip
�� 
=
��  !
helper
��" (
.
��( )
ToolTip
��) 0
(
��0 1
helpTooltipText
��1 @
)
��@ A
;
��A B
input
�� 
.
�� 
Append
�� 
(
�� 
helpTooltip
�� (
)
��( )
;
��) *
}
�� 
var
�� 
inputContainer
�� 
=
��  
new
��! $
HtmlTag
��% ,
(
��, -
$str
��- 3
)
��3 4
.
�� 
AddClass
�� 
(
�� 
$str
�� 2
)
��2 3
;
��3 4
return
�� 
input
�� 
.
�� 
WrapWith
�� !
(
��! "
inputContainer
��" 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
static
�� 
HtmlTag
�� %
InlineCustomRadioButton
�� 5
<
��5 6
T
��6 7
,
��7 8
TEnumeration
��9 E
>
��E F
(
��F G
this
��G K
IHtmlHelper
��L W
<
��W X
T
��X Y
>
��Y Z
helper
��[ a
,
��a b

Expression
��c m
<
��m n
Func
��n r
<
��r s
T
��s t
,
��t u
object
��v |
>
��| }
>
��} ~

expression�� �
,��� �"
RadioButtonDisplay��� �
<��� �
TEnumeration��� �
>��� �
option��� �
,��� �
string��� �
id��� �
=��� �
null��� �
)��� �
where
�� 
T
�� 
:
�� 
class
�� 
where
�� 
TEnumeration
�� 
:
��  
Enumeration
��! ,
<
��, -
TEnumeration
��- 9
>
��9 :
,
��: ;
IRadioButton
��< H
{
�� 	
var
�� 
model
�� 
=
�� 
helper
�� 
.
�� 
ViewData
�� '
.
��' (
Model
��( -
;
��- .
var
�� 
value
�� 
=
�� 
model
�� 
==
��  
null
��! %
?
��& '
default
��( /
(
��/ 0
TEnumeration
��0 <
)
��< =
:
��> ?

expression
��@ J
.
��J K
Compile
��K R
(
��R S
)
��S T
(
��T U
model
��U Z
)
��Z [
;
��[ \
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
)
�� 
{
�� 
id
�� 
=
�� 
Guid
�� 
.
�� 
NewGuid
�� !
(
��! "
)
��" #
.
��# $
ToString
��$ ,
(
��, -
)
��- .
;
��. /
}
�� 
var
�� 
input
�� 
=
�� 
helper
�� 
.
�� 
Input
�� $
(
��$ %

expression
��% /
)
��/ 0
.
�� 
Attr
�� 
(
�� 
$str
�� 
,
�� 
$str
�� %
)
��% &
.
�� 
Attr
�� 
(
�� 
$str
�� 
,
�� 
option
�� %
.
��% &
RadioButton
��& 1
.
��1 2
Value
��2 7
)
��7 8
.
�� 
AddClass
�� 
(
�� 
$str
�� (
)
��( )
.
�� 
Id
�� 
(
�� 
id
�� 
)
�� 
;
�� 
if
�� 
(
�� 
option
�� 
==
�� 
value
�� 
)
��  
{
�� 
input
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� $
,
��$ %
$str
��& /
)
��/ 0
;
��0 1
}
�� 
if
�� 
(
�� 
!
�� 
option
�� 
.
�� 
	IsEnabled
�� !
)
��! "
{
�� 
input
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� %
,
��% &
$str
��' -
)
��- .
;
��. /
}
�� 
var
�� 
label
�� 
=
�� 
new
�� 
HtmlTag
�� #
(
��# $
$str
��$ +
)
��+ ,
.
�� 
AddClass
�� 
(
�� 
$str
�� .
)
��. /
.
�� 
Text
�� 
(
�� 
option
�� 
.
�� 
RadioButton
�� (
.
��( )
DisplayName
��) 4
)
��4 5
.
�� 
Attr
�� 
(
�� 
$str
�� 
,
�� 
id
�� 
)
��  
;
��  !
input
�� 
.
�� 
Append
�� 
(
�� 
label
�� 
)
�� 
;
��  
if
�� 
(
�� 
!
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� *
(
��* +
option
��+ 1
.
��1 2
RadioButton
��2 =
.
��= >
HelpTooltip
��> I
)
��I J
)
��J K
{
�� 
var
�� 
helpTooltip
�� 
=
��  !
helper
��" (
.
��( )
ToolTip
��) 0
(
��0 1
option
��1 7
.
��7 8
RadioButton
��8 C
.
��C D
HelpTooltip
��D O
)
��O P
;
��P Q
input
�� 
.
�� 
Append
�� 
(
�� 
helpTooltip
�� (
)
��( )
;
��) *
}
�� 
var
�� 
inputContainer
�� 
=
��  
new
��! $
HtmlTag
��% ,
(
��, -
$str
��- 3
)
��3 4
.
�� 
AddClass
�� 
(
�� 
$str
�� 2
)
��2 3
;
��3 4
return
�� 
input
�� 
.
�� 
WrapWith
�� !
(
��! "
inputContainer
��" 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 

ActionAjax
�� (
(
��( )
this
��) -
IHtmlHelper
��. 9
helper
��: @
,
��@ A
string
��B H
url
��I L
,
��L M
int
��N Q
	minHeight
��R [
,
��[ \
string
��] c
placeholderText
��d s
)
��s t
{
�� 	
var
�� 
placeholderTag
�� 
=
��  
new
��! $
DivTag
��% +
(
��+ ,
)
��, -
;
��- .
placeholderTag
�� 
.
�� 
Append
�� !
(
��! "
new
��" %
HtmlTag
��& -
(
��- .
$str
��. 2
)
��2 3
.
��3 4
Text
��4 8
(
��8 9
placeholderText
��9 H
)
��H I
)
��I J
;
��J K
var
�� 

spinnerTag
�� 
=
�� 
new
��  
DivTag
��! '
(
��' (
)
��( )
;
��) *

spinnerTag
�� 
.
�� 
Append
�� 
(
�� 
new
�� !
HtmlTag
��" )
(
��) *
$str
��* -
)
��- .
.
��. /

AddClasses
��/ 9
(
��9 :
$str
��: >
,
��> ?
$str
��@ L
,
��L M
$str
��N X
,
��X Y
$str
��Z a
)
��a b
)
��b c
;
��c d
var
��  
contentLoadingArea
�� "
=
��# $
new
��% (
DivTag
��) /
(
��/ 0
)
��0 1
.
��1 2
Data
��2 6
(
��6 7
$str
��7 C
,
��C D
url
��E H
)
��H I
.
��I J
AddClass
��J R
(
��R S
$str
��S f
)
��f g
;
��g h
if
�� 
(
�� 
	minHeight
�� 
>
�� 
$num
�� 
)
�� 
{
��  
contentLoadingArea
�� "
.
��" #
Attr
��# '
(
��' (
$str
��( /
,
��/ 0
$"
��1 3
$str
��3 ?
{
��? @
	minHeight
��@ I
}
��I J
$str
��J L
"
��L M
)
��M N
;
��N O
}
��  
contentLoadingArea
�� 
.
�� 
Append
�� %
(
��% &
placeholderTag
��& 4
)
��4 5
;
��5 6 
contentLoadingArea
�� 
.
�� 
Append
�� %
(
��% &

spinnerTag
��& 0
)
��0 1
;
��1 2
return
��  
contentLoadingArea
�� %
;
��% &
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
AjaxPostButton
�� ,
<
��, -
T
��- .
>
��. /
(
��/ 0
this
��0 4
IHtmlHelper
��5 @
<
��@ A
T
��A B
>
��B C
helper
��D J
,
��J K
string
��L R
url
��S V
,
��V W
string
��X ^

buttonText
��_ i
)
��i j
{
�� 	
var
�� 
ajaxPostLink
�� 
=
�� 
new
�� "
HtmlTag
��# *
(
��* +
$str
��+ .
,
��. /
tag
��0 3
=>
��4 6
{
�� 
tag
�� 
.
�� 

AddClasses
�� 
(
�� 
$str
�� $
,
��$ %
$str
��& 3
,
��3 4
$str
��5 :
,
��: ;
$str
��< I
)
��I J
;
��J K
tag
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� 
,
��  
url
��! $
)
��$ %
;
��% &
tag
�� 
.
�� 
Text
�� 
(
�� 

buttonText
�� #
)
��# $
;
��$ %
}
�� 
)
�� 
;
�� 
return
�� 
ajaxPostLink
�� 
;
��  
}
�� 	
public
�� 
static
�� 

HtmlString
��   
ApplicationVersion
��! 3
(
��3 4
this
��4 8
IHtmlHelper
��9 D
helper
��E K
)
��K L
{
�� 	
var
��  
informationVersion
�� "
=
��# $
InMemoryCache
��% 2
.
��2 3
Instance
��3 ;
.
�� 
GetOrSet
�� 
(
�� 
$str
�� .
,
��. /
(
�� 
)
�� 
=>
�� 
Assembly
�� "
.
��" #"
GetExecutingAssembly
��# 7
(
��7 8
)
��8 9
.
��9 : 
GetCustomAttribute
��: L
<
��L M3
%AssemblyInformationalVersionAttribute
��M r
>
��r s
(
��s t
)
��t u
?
��u v
.
��v w#
InformationalVersion��w �
)��� �
;��� �
return
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� (
(
��( ) 
informationVersion
��) ;
)
��; <
?
��= >
new
��? B

HtmlString
��C M
(
��M N
$"
��N P
$str
��P i
{
��i j 
informationVersion
��j |
}
��| }
$str��} �
"��� �
)��� �
:��� �
new��� �

HtmlString��� �
(��� �
$str��� �
)��� �
;��� �
}
�� 	
public
�� 
static
�� 
HtmlTag
�� 
CheckBoxSquare
�� ,
<
��, -
T
��- .
>
��. /
(
��/ 0
this
��0 4
IHtmlHelper
��5 @
<
��@ A
T
��A B
>
��B C
helper
��D J
,
��J K
bool
��L P

expression
��Q [
,
��[ \
string
��] c
action
��d j
)
��j k
where
��l q
T
��r s
:
��t u
class
��v {
{
�� 	
var
�� 
label
�� 
=
�� 
new
�� 
HtmlTag
�� #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
var
�� 
input
�� 
=
�� 
new
�� 
HtmlTag
�� #
(
��# $
$str
��$ +
)
��+ ,
.
��, -
Attr
��- 1
(
��1 2
$str
��2 8
,
��8 9
$str
��: D
)
��D E
.
��E F
Attr
��F J
(
��J K
$str
��K U
,
��U V
$str
��V `
)
��` a
.
��a b
Attr
��b f
(
��f g
$str
��g p
,
��p q
true
��r v
)
��v w
.
��w x

AddClasses��x �
(��� �
$str��� �
,��� �
$"��� �
{��� �
action��� �
}��� �
$str��� �
"��� �
)��� �
;��� �
const
�� 
string
�� 
icon
�� 
=
�� 
$str
��  J
;
��J K
if
�� 
(
�� 

expression
�� 
)
�� 
label
�� 
.
�� 
Append
�� 
(
�� 
input
�� "
)
��" #
.
��# $

AppendHtml
��$ .
(
��. /
icon
��/ 3
)
��3 4
;
��4 5
return
�� 
label
�� 
;
�� 
}
�� 	
public
�� 
static
�� 

HtmlString
��  
PagingControl
��! .
<
��. /
TModel
��/ 5
,
��5 6
T
��7 8
>
��8 9
(
��9 :
this
��: >
IHtmlHelper
��? J
<
��J K
TModel
��K Q
>
��Q R
helper
��S Y
,
��Y Z
string
��[ a
url
��b e
,
��e f
	PagedList
��g p
<
��p q
T
��q r
>
��r s
pagedContent��t �
)��� �
{
�� 	
var
�� 

pageNumber
�� 
=
�� 
pagedContent
�� )
.
��) *

PageNumber
��* 4
;
��4 5
var
�� 
previousUrl
�� 
=
�� 
QueryHelpers
�� *
.
��* +
AddQueryString
��+ 9
(
��9 :
url
��: =
,
��= >
$str
��? K
,
��K L
(
��M N

pageNumber
��N X
-
��Y Z
$num
��[ \
)
��\ ]
.
��] ^
ToString
��^ f
(
��f g
)
��g h
)
��h i
;
��i j
var
�� 
nextUrl
�� 
=
�� 
QueryHelpers
�� &
.
��& '
AddQueryString
��' 5
(
��5 6
url
��6 9
,
��9 :
$str
��; G
,
��G H
(
��I J

pageNumber
��J T
+
��U V
$num
��W X
)
��X Y
.
��Y Z
ToString
��Z b
(
��b c
)
��c d
)
��d e
;
��e f
var
�� 
previousLink
�� 
=
�� 
PreviousButton
�� -
(
��- .
previousUrl
��. 9
,
��9 :
pagedContent
��; G
)
��G H
;
��H I
var
�� 
nextLink
�� 
=
�� 

NextButton
�� %
(
��% &
nextUrl
��& -
,
��- .
pagedContent
��/ ;
)
��; <
;
��< =
var
�� 
pageNumberItem
�� 
=
��  

PageNumber
��! +
(
��+ ,
pagedContent
��, 8
,
��8 9
previousLink
��: F
,
��F G
nextLink
��H P
)
��P Q
;
��Q R
var
�� 
contentWrapper
�� 
=
��  
new
��! $
HtmlTag
��% ,
(
��, -
$str
��- 1
)
��1 2
;
��2 3
contentWrapper
�� 
.
�� 
AddClass
�� #
(
��# $
$str
��$ 0
)
��0 1
;
��1 2
if
�� 
(
�� 
previousLink
�� 
!=
�� 
null
��  $
)
��$ %
contentWrapper
��& 4
.
��4 5
Append
��5 ;
(
��; <
previousLink
��< H
)
��H I
;
��I J
if
�� 
(
�� 
pageNumberItem
�� 
!=
�� !
null
��" &
)
��& '
contentWrapper
��( 6
.
��6 7
Append
��7 =
(
��= >
pageNumberItem
��> L
)
��L M
;
��M N
if
�� 
(
�� 
nextLink
�� 
!=
�� 
null
��  
)
��  !
contentWrapper
��" 0
.
��0 1
Append
��1 7
(
��7 8
nextLink
��8 @
)
��@ A
;
��A B
var
�� 
paginationNav
�� 
=
�� 
new
��  #
HtmlTag
��$ +
(
��+ ,
$str
��, 1
)
��1 2
;
��2 3
paginationNav
�� 
.
�� 
Append
��  
(
��  !
contentWrapper
��! /
)
��/ 0
;
��0 1
paginationNav
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� +
,
��+ ,
$str
��- >
)
��> ?
;
��? @
return
�� 
new
�� 

HtmlString
�� !
(
��! "
paginationNav
��" /
.
��/ 0
ToString
��0 8
(
��8 9
)
��9 :
)
��: ;
;
��; <
}
�� 	
private
�� 
static
�� 
HtmlTag
�� 

PageNumber
�� )
<
��) *
T
��* +
>
��+ ,
(
��, -
	PagedList
��- 6
<
��6 7
T
��7 8
>
��8 9
pagedContent
��: F
,
��F G
HtmlTag
��H O
previousLink
��P \
,
��\ ]
HtmlTag
��^ e
nextLink
��f n
)
��n o
{
�� 	
if
�� 
(
�� 
previousLink
�� 
==
�� 
null
��  $
&&
��% '
nextLink
��( 0
==
��1 3
null
��4 8
)
��8 9
return
�� 
null
�� 
;
�� 
var
�� 

pageNumber
�� 
=
�� 
new
��  
HtmlTag
��! (
(
��( )
$str
��) /
)
��/ 0
;
��0 1

pageNumber
�� 
.
�� 
Text
�� 
(
�� 
$str
�� 
+
��  !
pagedContent
��" .
.
��. /

PageNumber
��/ 9
+
��: ;
$str
��< ?
)
��? @
;
��@ A
var
�� 
listItem
�� 
=
�� 
new
�� 
HtmlTag
�� &
(
��& '
$str
��' +
)
��+ ,
;
��, -
listItem
�� 
.
�� 
Append
�� 
(
�� 

pageNumber
�� &
)
��& '
;
��' (
return
�� 
listItem
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
HtmlTag
�� 

NextButton
�� )
<
��) *
T
��* +
>
��+ ,
(
��, -
string
��- 3
nextUrl
��4 ;
,
��; <
	PagedList
��= F
<
��F G
T
��G H
>
��H I
pagedContent
��J V
)
��V W
{
�� 	
if
�� 
(
�� 
!
�� 
pagedContent
�� 
.
��  
NextPageHasResults
�� 0
)
��0 1
return
�� 
null
�� 
;
�� 
var
�� 
nextLink
�� 
=
�� 
new
�� 
HtmlTag
�� &
(
��& '
$str
��' *
)
��* +
;
��+ ,
nextLink
�� 
.
�� 
Attr
�� 
(
�� 
$str
��  
,
��  !
nextUrl
��" )
)
��) *
;
��* +
nextLink
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� &
,
��& '
$str
��( .
)
��. /
;
��/ 0
nextLink
�� 
.
�� 
AddClass
�� 
(
�� 
$str
�� 2
)
��2 3
;
��3 4
var
�� 

symbolSpan
�� 
=
�� 
new
��  
HtmlTag
��! (
(
��( )
$str
��) /
)
��/ 0
;
��0 1

symbolSpan
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3

symbolSpan
�� 
.
�� 

AppendHtml
�� !
(
��! "
$str
��" +
)
��+ ,
;
��, -
nextLink
�� 
.
�� 
Append
�� 
(
�� 

symbolSpan
�� &
)
��& '
;
��' (
var
�� 
listItem
�� 
=
�� 
new
�� 
HtmlTag
�� &
(
��& '
$str
��' +
)
��+ ,
;
��, -
listItem
�� 
.
�� 
Append
�� 
(
�� 
nextLink
�� $
)
��$ %
;
��% &
return
�� 
listItem
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
HtmlTag
�� 
PreviousButton
�� -
<
��- .
T
��. /
>
��/ 0
(
��0 1
string
��1 7
previousUrl
��8 C
,
��C D
	PagedList
��E N
<
��N O
T
��O P
>
��P Q
pagedContent
��R ^
)
��^ _
{
�� 	
if
�� 
(
�� 
pagedContent
�� 
.
�� 

PageNumber
�� '
<=
��( *
$num
��+ ,
)
��, -
return
�� 
null
�� 
;
�� 
var
�� 
previousLink
�� 
=
�� 
new
�� "
HtmlTag
��# *
(
��* +
$str
��+ .
)
��. /
;
��/ 0
previousLink
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� $
,
��$ %
previousUrl
��& 1
)
��1 2
;
��2 3
previousLink
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� *
,
��* +
$str
��, 6
)
��6 7
;
��7 8
previousLink
�� 
.
�� 
AddClass
�� !
(
��! "
$str
��" :
)
��: ;
;
��; <
var
�� 

symbolSpan
�� 
=
�� 
new
��  
HtmlTag
��! (
(
��( )
$str
��) /
)
��/ 0
;
��0 1

symbolSpan
�� 
.
�� 
Attr
�� 
(
�� 
$str
�� )
,
��) *
$str
��+ 1
)
��1 2
;
��2 3

symbolSpan
�� 
.
�� 

AppendHtml
�� !
(
��! "
$str
��" +
)
��+ ,
;
��, -
previousLink
�� 
.
�� 
Append
�� 
(
��  

symbolSpan
��  *
)
��* +
;
��+ ,
var
�� 
listItem
�� 
=
�� 
new
�� 
HtmlTag
�� &
(
��& '
$str
��' +
)
��+ ,
;
��, -
listItem
�� 
.
�� 
Append
�� 
(
�� 
previousLink
�� (
)
��( )
;
��) *
return
�� 
listItem
�� 
;
�� 
}
�� 	
}
�� 
}�� �
XC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\HtmlTagExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Helpers  '
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
 
HtmlTagExtensions

 )
{ 
public 
static 
HtmlTag 
AppendSpinner +
(+ ,
this, 0
HtmlTag1 8
htmlTag9 @
,@ A
stringB H
idI K
,K L
boolM Q
hiddenR X
=Y Z
true[ _
)_ `
{ 	
htmlTag 
. 
Data 
( 
$str %
,% &
id' )
)) *
;* +
var 
spinner 
= 
new 
HtmlTag %
(% &
$str& )
)) *
. 
Id 
( 
id 
) 
. 

AddClasses 
( 
$str  
,  !
$str" .
,. /
$str0 :
,: ;
$str< C
,C D
$strE R
)R S
;S T
if 
( 
hidden 
) 
spinner 
. 
AddClass  
(  !
$str! ,
), -
;- .
return 
htmlTag 
. 
After  
(  !
spinner! (
)( )
;) *
} 	
public 
static 
HtmlTag 
AddPlaceholder ,
(, -
this- 1
HtmlTag2 9
tag: =
,= >
string? E
placeholderF Q
)Q R
{ 	
return 
tag 
. 
Attr 
( 
$str )
,) *
placeholder+ 6
)6 7
;7 8
} 	
public 
static 
HtmlTag 

AddPattern (
(( )
this) -
HtmlTag. 5
tag6 9
,9 :
string; A
patternB I
)I J
{   	
var!! 
retVal!! 
=!! 
tag!! 
.!! 
Data!! !
(!!! "
$str!!" +
,!!+ ,
pattern!!- 4
)!!4 5
;!!5 6
return"" 
retVal"" 
;"" 
}## 	
}$$ 
}%% �
]C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\OdsApiFacadeExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Helpers  '
{ 
public 

static 
class "
OdsApiFacadeExtensions .
{ 
public 
static 
List 
< &
EducationOrganizationModel 5
>5 6(
GetAllEducationOrganizations7 S
(S T
thisT X
IOdsApiFacadeY f
odsApiFacadeg s
,s t
IMapperu |
mapper	} �
)
� �
{ 	
return 
odsApiFacade 
.  (
GetAllLocalEducationAgencies  <
(< =
)= >
.> ?
Select? E
(E F
mapperF L
.L M
MapM P
<P Q&
EducationOrganizationModelQ k
>k l
)l m
. 
Union 
( 
odsApiFacade '
.' (+
GetAllPostSecondaryInstitutions( G
(G H
)H I
.I J
SelectJ P
(P Q
mapperQ W
.W X
MapX [
<[ \&
EducationOrganizationModel\ v
>v w
)w x
)x y
. 
Union 
( 
odsApiFacade '
.' (
GetAllSchools( 5
(5 6
)6 7
.7 8
Select8 >
(> ?
mapper? E
.E F
MapF I
<I J&
EducationOrganizationModelJ d
>d e
)e f
)f g
. 
ToList 
( 
) 
; 
} 	
} 
} �O
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\OpenIdConnectLoginService.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Helpers  '
{ 
public 

	interface &
IOpenIdConnectLoginService /
{ 
Task 
< 
string 
> (
AddUserLoginForOpenIdConnect 1
(1 2
string2 8

oidcUserId9 C
,C D
stringE K
oidcUserEmailL Y
,Y Z
string[ a
loginProviderb o
,o p
stringq w 
providerDisplayName	x �
)
� �
;
� �
string 1
%GetIdentityUserIdForOpenIdConnectUser 4
(4 5
string5 ;

oidcUserId< F
,F G
stringH N
loginProviderO \
)\ ]
;] ^
Role ,
 UpdateUserRolesFromIncomingClaim -
(- .
string. 4
identityUserId5 C
,C D
IEnumerableE P
<P Q
stringQ W
>W X

roleValuesY c
)c d
;d e
} 
public 

class %
OpenIdConnectLoginService *
:+ ,&
IOpenIdConnectLoginService- G
{ 
private 
readonly 
AddUserLoginCommand , 
_addUserLoginCommand- A
;A B
private 
readonly 
EditUserRoleCommand , 
_editUserRoleCommand- A
;A B
private 
readonly 
GetUserLoginQuery *
_getUserLoginQuery+ =
;= >
private   
readonly   %
AdminAppIdentityDbContext   2
	_identity  3 <
;  < =
private!! 
readonly!! 
ILog!! 
_logger!! %
=!!& '

LogManager!!( 2
.!!2 3
	GetLogger!!3 <
(!!< =
typeof!!= C
(!!C D%
OpenIdConnectLoginService!!D ]
)!!] ^
)!!^ _
;!!_ `
public## %
OpenIdConnectLoginService## (
(##( )
AddUserLoginCommand##) <
addUserLoginCommand##= P
,##P Q
EditUserRoleCommand##R e
editUserRoleCommand##f y
,##y z
GetUserLoginQuery	##{ �
getUserLoginQuery
##� �
,
##� �'
AdminAppIdentityDbContext
##� �
identity
##� �
)
##� �
{$$ 	 
_addUserLoginCommand%%  
=%%! "
addUserLoginCommand%%# 6
;%%6 7 
_editUserRoleCommand&&  
=&&! "
editUserRoleCommand&&# 6
;&&6 7
_getUserLoginQuery'' 
=''  
getUserLoginQuery''! 2
;''2 3
	_identity(( 
=(( 
identity((  
;((  !
})) 	
public++ 
async++ 
Task++ 
<++ 
string++  
>++  !(
AddUserLoginForOpenIdConnect++" >
(++> ?
string++? E

oidcUserId++F P
,++P Q
string++R X
oidcUserEmail++Y f
,++f g
string++h n
loginProvider++o |
,++| }
string	++~ �!
providerDisplayName
++� �
)
++� �
{,, 	
var-- 
addUserLoginModel-- !
=--" #
new--$ '
AddUserLoginModel--( 9
{.. 
	UserEmail// 
=// 
oidcUserEmail// )
,//) *
LoginProvider00 
=00 
loginProvider00  -
,00- .
ProviderDisplayName11 #
=11$ %
providerDisplayName11& 9
,119 :
ProviderKey22 
=22 

oidcUserId22 (
}33 
;33 
var55 #
userLoginModelValidator55 '
=55( )
new55* -&
AddUserLoginModelValidator55. H
(55H I
	_identity55I R
)55R S
;55S T
var66 +
userLoginModelValidationResults66 /
=660 1
(662 3
await663 8#
userLoginModelValidator669 P
.66P Q
ValidateAsync66Q ^
(66^ _
addUserLoginModel66_ p
)66p q
)66q r
;66r s
if88 
(88 +
userLoginModelValidationResults88 /
.88/ 0
IsValid880 7
)887 8
{99 
return:: 
await::  
_addUserLoginCommand:: 1
.::1 2
Execute::2 9
(::9 :
addUserLoginModel::: K
)::K L
;::L M
};; 
foreach== 
(== 
var== 
error== 
in== !+
userLoginModelValidationResults==" A
.==A B
Errors==B H
)==H I
{>> 
_logger?? 
.?? 
Warn?? 
(?? 
error?? "
.??" #
ErrorMessage??# /
)??/ 0
;??0 1
}@@ 
_loggerBB 
.BB 
ErrorBB 
(BB 
$strCC o
+CCp q
$strDD D
)DDD E
;DDE F
returnFF 
nullFF 
;FF 
}GG 	
publicII 
stringII 1
%GetIdentityUserIdForOpenIdConnectUserII ;
(II; <
stringII< B

oidcUserIdIIC M
,IIM N
stringIIO U
loginProviderIIV c
)IIc d
{JJ 	
varKK 
getUserLoginModelKK !
=KK" #
newKK$ '
GetUserLoginModelKK( 9
{LL 
LoginProviderMM 
=MM 
loginProviderMM  -
,MM- .
ProviderKeyNN 
=NN 

oidcUserIdNN (
}OO 
;OO 
varQQ #
userLoginModelValidatorQQ '
=QQ( )
newQQ* -&
GetUserLoginModelValidatorQQ. H
(QQH I
)QQI J
;QQJ K
varRR +
userLoginModelValidationResultsRR /
=RR0 1#
userLoginModelValidatorRR2 I
.RRI J
ValidateRRJ R
(RRR S
getUserLoginModelRRS d
)RRd e
;RRe f
stringTT 
identityUserIdTT !
=TT" #
nullTT$ (
;TT( )
ifUU 
(UU +
userLoginModelValidationResultsUU /
.UU/ 0
IsValidUU0 7
)UU7 8
{VV 
varWW 
identityUserLoginWW %
=WW& '
_getUserLoginQueryWW( :
.WW: ;
ExecuteWW; B
(WWB C
getUserLoginModelWWC T
)WWT U
;WWU V
identityUserIdXX 
=XX  
identityUserLoginXX! 2
?XX2 3
.XX3 4
UserIdXX4 :
;XX: ;
}YY 
elseZZ 
{[[ 
foreach\\ 
(\\ 
var\\ 
error\\ "
in\\# %+
userLoginModelValidationResults\\& E
.\\E F
Errors\\F L
)\\L M
{]] 
_logger^^ 
.^^ 
Warn^^  
(^^  !
error^^! &
.^^& '
ErrorMessage^^' 3
)^^3 4
;^^4 5
}__ 
}`` 
returnbb 
identityUserIdbb !
;bb! "
}cc 	
publicee 
Roleee ,
 UpdateUserRolesFromIncomingClaimee 4
(ee4 5
stringee5 ;
identityUserIdee< J
,eeJ K
IEnumerableeeL W
<eeW X
stringeeX ^
>ee^ _

roleValuesee` j
)eej k
{ff 	
ifgg 
(gg 
identityUserIdgg 
==gg !
nullgg" &
)gg& '
throwhh 
newhh !
ArgumentNullExceptionhh /
(hh/ 0
nameofhh0 6
(hh6 7
identityUserIdhh7 E
)hhE F
)hhF G
;hhG H
Rolejj 
rolejj 
;jj 
ifkk 
(kk 

roleValueskk 
.kk 
Countkk  
(kk  !
)kk! "
==kk# %
$numkk& '
&&kk( *
Rolekk+ /
.kk/ 0
TryParsekk0 8
(kk8 9

roleValueskk9 C
.kkC D
SinglekkD J
(kkJ K
)kkK L
,kkL M
outkkN Q
varkkR U

parsedRolekkV `
)kk` a
)kka b
rolell 
=ll 

parsedRolell !
;ll! "
elsemm 
rolenn 
=nn 
Rolenn 
.nn 
FromOidcClaimsnn *
(nn* +

roleValuesnn+ 5
)nn5 6
;nn6 7
ifpp 
(pp 
rolepp 
!=pp 
nullpp 
)pp 
{qq  
_editUserRoleCommandrr $
.rr$ %
Executerr% ,
(rr, -
newss 
EditUserRoleModelss )
{tt 
UserIduu 
=uu  
identityUserIduu! /
,uu/ 0
RoleIdvv 
=vv  
rolevv! %
.vv% &
Valuevv& +
.vv+ ,
ToStringvv, 4
(vv4 5
)vv5 6
}ww 
)ww 
;ww 
returnyy 
roleyy 
;yy 
}zz 
var|| 

logMessage|| 
=|| 
!|| 

roleValues|| (
.||( )
Any||) ,
(||, -
)||- .
?}} 
$"}} 
$str}} 
{}} 
identityUserId}} (
}}}( )
$str}}) @
"}}@ A
:~~ 
$"~~ 
$str~~ 
{~~ 
identityUserId~~ (
}~~( )
$str~~) [
{~~[ \
string~~\ b
.~~b c
Join~~c g
(~~g h
$str~~h l
,~~l m

roleValues~~n x
)~~x y
}~~y z
"~~z {
;~~{ |
_logger 
. 
Error 
( 

logMessage $
)$ %
;% &
return
�� 
null
�� 
;
�� 
}
�� 	
}
�� 
}�� � 
[C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\ReflectionExtensions.cs
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
 
Web

 
.

  
Helpers

  '
{ 
public 

static 
class  
ReflectionExtensions ,
{ 
public 
static 
bool 
HasAttribute '
<' (
T( )
>) *
(* +
this+ /$
ICustomAttributeProvider0 H
providerI Q
)Q R
whereS X
TY Z
:[ \
	Attribute] f
{ 	
if 
( 
provider 
== 
null  
)  !
return 
false 
; 
return 
provider 
. 
GetCustomAttributes /
(/ 0
typeof0 6
(6 7
T7 8
)8 9
,9 :
true; ?
)? @
.@ A
AnyA D
(D E
)E F
;F G
} 	
public 
static 
T 
GetAttribute $
<$ %
T% &
>& '
(' (
this( ,$
ICustomAttributeProvider- E
providerF N
)N O
whereP U
TV W
:X Y
	AttributeZ c
{ 	
return 
( 
T 
) 
provider 
. 
GetCustomAttributes 2
(2 3
typeof3 9
(9 :
T: ;
); <
,< =
true> B
)B C
.C D
FirstOrDefaultD R
(R S
)S T
;T U
} 	
public 
static 
bool 
IsAssignableTo )
<) *
T* +
>+ ,
(, -
this- 1
Type2 6
type7 ;
); <
{ 	
return 
typeof 
( 
T 
) 
. 
IsAssignableFrom -
(- .
type. 2
)2 3
;3 4
} 	
public 
static 
bool 
Closes !
(! "
this" &
Type' +
type, 0
,0 1
Type2 6!
genericTypeDefinition7 L
)L M
{   	
if!! 
(!! 
type!! 
.!! #
IsGenericTypeDefinition!! ,
)!!, -
return"" 
false"" 
;"" 
	Predicate$$ 
<$$ 
Type$$ 
>$$ 
closes$$ "
=$$# $
x$$% &
=>$$' )
x$$* +
.$$+ ,
IsGenericType$$, 9
&&$$: <
x$$= >
.$$> ?$
GetGenericTypeDefinition$$? W
($$W X
)$$X Y
.$$Y Z
Equals$$Z `
($$` a!
genericTypeDefinition$$a v
)$$v w
;$$w x
if&& 
(&& 
type&& 
.&& 
GetInterfaces&& "
(&&" #
)&&# $
.&&$ %
Any&&% (
(&&( )
x&&) *
=>&&+ -
closes&&. 4
(&&4 5
x&&5 6
)&&6 7
)&&7 8
)&&8 9
return'' 
true'' 
;'' 
var)) 
baseType)) 
=)) 
type)) 
.))  
BaseType))  (
;))( )
while++ 
(++ 
baseType++ 
!=++ 
null++ #
)++# $
{,, 
if-- 
(-- 
closes-- 
(-- 
baseType-- #
)--# $
)--$ %
return.. 
true.. 
;..  
baseType00 
=00 
baseType00 #
.00# $
BaseType00$ ,
;00, -
}11 
return33 
false33 
;33 
}44 	
}55 
}66 �	
VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\ResponseHelpers.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Helpers		  '
{

 
public 

static 
class 
ResponseHelpers '
{ 
public 
static 
ContentResult #

JsonResult$ .
(. /
object/ 5
model6 ;
); <
{ 	
var 

serialized 
= 
JsonConvert (
.( )
SerializeObject) 8
(8 9
model9 >
,> ?
new@ C"
JsonSerializerSettingsD Z
{ !
ReferenceLoopHandling %
=& '!
ReferenceLoopHandling( =
.= >
Ignore> D
} 
) 
; 
return 
new 
ContentResult $
{ 
Content 
= 

serialized $
,$ %
ContentType 
= 
$str 0
} 
; 
} 	
} 
} �;
SC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\RouteHelpers.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Helpers  '
{ 
public 

static 
class 
RouteHelpers $
{ 
public 
static 
string 
GetControllerName .
(. /
this/ 3
Type4 8
controllerType9 G
)G H
{ 	
var 
controllerName 
=  
controllerType! /
./ 0
Name0 4
.4 5
Replace5 <
(< =
$str= I
,I J
stringK Q
.Q R
EmptyR W
)W X
;X Y
return 
controllerName !
;! "
} 	
public 
static 
string 
GetControllerName .
<. /
TController/ :
>: ;
(; <
)< =
{ 	
return 
GetControllerName $
($ %
typeof% +
(+ ,
TController, 7
)7 8
)8 9
;9 :
} 	
public 
static 
string 
GetControllerName .
<. /
TController/ :
>: ;
(; <
this< @

ExpressionA K
<K L
FuncL P
<P Q
TControllerQ \
,\ ]
object^ d
>d e
>e f
actionExpressiong w
)w x
{ 	
var 
controllerName 
=  
typeof! '
(' (
TController( 3
)3 4
.4 5
Name5 9
.9 :
Replace: A
(A B
$strB N
,N O
stringP V
.V W
EmptyW \
)\ ]
;] ^
return 
controllerName !
;! "
} 	
public   
static   
string   
GetActionName   *
<  * +
TController  + 6
>  6 7
(  7 8
this  8 <

Expression  = G
<  G H
Func  H L
<  L M
TController  M X
,  X Y
object  Z `
>  ` a
>  a b
actionExpression  c s
)  s t
{!! 	
var"" 

actionName"" 
="" 
("" 
(""  
MethodCallExpression"" 3
)""3 4
actionExpression""4 D
.""D E
Body""E I
)""I J
.""J K
Method""K Q
.""Q R
Name""R V
;""V W
return## 

actionName## 
;## 
}$$ 	
public&& 
static&&  
RouteValueDictionary&& *
GetRoute&&+ 3
<&&3 4
TController&&4 ?
>&&? @
(&&@ A
this&&A E

Expression&&F P
<&&P Q
Func&&Q U
<&&U V
TController&&V a
,&&a b
object&&c i
>&&i j
>&&j k
actionExpression&&l |
)&&| }
{'' 	
var(( 
result(( 
=(( 
new((  
RouteValueDictionary(( 1
(((1 2
)((2 3
;((3 4
var)) 
expressionBody)) 
=))  
())! " 
MethodCallExpression))" 6
)))6 7
actionExpression))7 G
.))G H
Body))H L
;))L M
var++ 

parameters++ 
=++ 
expressionBody++ +
.+++ ,
Method++, 2
.++2 3
GetParameters++3 @
(++@ A
)++A B
;++B C
if00 
(00 

parameters00 
.00 
Length00 !
!=00" $
expressionBody00% 3
.003 4
	Arguments004 =
.00= >
Count00> C
)00C D
throw11 
new11 %
InvalidOperationException11 3
(113 4
$str114 Y
)11Y Z
;11Z [
for33 
(33 
var33 
i33 
=33 
$num33 
;33 
i33 
<33 
expressionBody33  .
.33. /
	Arguments33/ 8
.338 9
Count339 >
;33> ?
++33@ B
i33B C
)33C D
{44 
var55 
	parameter55 
=55 

parameters55  *
[55* +
i55+ ,
]55, -
;55- .
var66 
argument66 
=66 
expressionBody66 -
.66- .
	Arguments66. 7
[667 8
i668 9
]669 :
;66: ;
var88 
parameterName88 !
=88" #
	parameter88$ -
.88- .
Name88. 2
;882 3
var99 
argumentValue99 !
=99" #
argument99$ ,
.99, -
GetValue99- 5
(995 6
)996 7
;997 8
result;; 
.;; 
Add;; 
(;; 
parameterName;; (
,;;( )
argumentValue;;* 7
);;7 8
;;;8 9
}<< 
result>> 
[>> 
$str>> 
]>>  
=>>! "
typeof>># )
(>>) *
TController>>* 5
)>>5 6
.>>6 7
GetControllerName>>7 H
(>>H I
)>>I J
;>>J K
result?? 
[?? 
$str?? 
]?? 
=?? 
actionExpression?? /
.??/ 0
GetActionName??0 =
(??= >
)??> ?
;??? @
returnAA 
resultAA 
;AA 
}BB 	
privateDD 
staticDD 
objectDD 
GetValueDD &
(DD& '
thisDD' +

ExpressionDD, 6
expDD7 :
)DD: ;
{EE 	
varFF 
objectMemberFF 
=FF 

ExpressionFF )
.FF) *
ConvertFF* 1
(FF1 2
expFF2 5
,FF5 6
typeofFF7 =
(FF= >
objectFF> D
)FFD E
)FFE F
;FFF G
varGG 
getterLambdaGG 
=GG 

ExpressionGG )
.GG) *
LambdaGG* 0
<GG0 1
FuncGG1 5
<GG5 6
objectGG6 <
>GG< =
>GG= >
(GG> ?
objectMemberGG? K
)GGK L
;GGL M
varHH 
getterHH 
=HH 
getterLambdaHH %
.HH% &
CompileHH& -
(HH- .
)HH. /
;HH/ 0
returnJJ 
getterJJ 
(JJ 
)JJ 
;JJ 
}KK 	
publicMM 
staticMM !
RedirectToRouteResultMM +!
RedirectToActionRouteMM, A
<MMA B
TControllerMMB M
>MMM N
(MMN O

ExpressionMMO Y
<MMY Z
FuncMMZ ^
<MM^ _
TControllerMM_ j
,MMj k
objectMMl r
>MMr s
>MMs t
actionMMu {
)MM{ |
{NN 	
varOO 
routeOO 
=OO 
GetRouteOO  
(OO  !
actionOO! '
)OO' (
;OO( )
returnPP 
newPP !
RedirectToRouteResultPP ,
(PP, -
$strPP- 6
,PP6 7
routePP8 =
)PP= >
;PP> ?
}QQ 	
}RR 
}SS �2
WC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Helpers\StringExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Helpers  '
{ 
public 

static 
class 
StringExtensions (
{ 
public 
static 
string 
ToTitleCase (
(( )
this) -
string. 4
text5 9
)9 :
{ 	
return 
new 
CultureInfo "
(" #
$str# *
,* +
false, 1
)1 2
.2 3
TextInfo3 ;
.; <
ToTitleCase< G
(G H
textH L
)L M
;M N
} 	
public 
static 
string 
RemoveWhitespace -
(- .
this. 2
string3 9
text: >
)> ?
{ 	
return 
Regex 
. 
Replace  
(  !
text! %
,% &
$str' -
,- .
$str/ 1
)1 2
;2 3
} 	
public 
static 
Version 
	ToVersion '
(' (
this( ,
string- 3
versionText4 ?
)? @
{ 	
Version 
version 
; 
return 
Version 
. 
TryParse #
(# $
versionText$ /
,/ 0
out1 4
version5 <
)< =
?> ?
version@ G
:H I
nullJ N
;N O
} 	
public!! 
static!! 
string!! "
SafeDecodeBase64String!! 3
(!!3 4
this!!4 8
string!!9 ?
input!!@ E
)!!E F
{"" 	
if## 
(## 
string## 
.## 
IsNullOrWhiteSpace## )
(##) *
input##* /
)##/ 0
)##0 1
return$$ 
$str$$ 
;$$ 
try&& 
{'' 
return(( 
Encoding(( 
.((  
UTF8((  $
.(($ %
	GetString((% .
(((. /
Convert((/ 6
.((6 7
FromBase64String((7 G
(((G H
input((H M
)((M N
)((N O
;((O P
})) 
catch** 
(** 
	Exception** 
)** 
{++ 
return,, 
null,, 
;,, 
}-- 
}.. 	
public00 
static00 
string00 %
GetDescriptorCategoryName00 6
(006 7
this007 ;
string00< B
descriptorPath00C Q
)00Q R
{11 	
var22 
descriptorPathParts22 #
=22$ %
descriptorPath22& 4
.224 5
	TrimStart225 >
(22> ?
$char22? B
)22B C
.22C D
Split22D I
(22I J
$char22J M
,22M N
$num22O P
)22P Q
;22Q R
if44 
(44 
descriptorPathParts44 #
.44# $
Length44$ *
==44+ -
$num44. /
)44/ 0
{55 
var66 
routePrefix66 
=66  !
descriptorPathParts66" 5
[665 6
$num666 7
]667 8
;668 9
var77 
name77 
=77 
descriptorPathParts77 .
[77. /
$num77/ 0
]770 1
;771 2
if99 
(99 
name99 
.99 
EndsWith99 !
(99! "
$str99" /
)99/ 0
)990 1
name:: 
=:: 
name:: 
.::  
Remove::  &
(::& '
name::' +
.::+ ,
Length::, 2
-::3 4
$num::5 6
,::6 7
$num::8 9
)::9 :
;::: ;
var<< 
descriptorName<< "
=<<# $
name<<% )
.<<) *!
CapitalizeFirstLetter<<* ?
(<<? @
)<<@ A
;<<A B
if>> 
(>> 
routePrefix>> 
!=>>  "
$str>># *
)>>* +
descriptorName?? "
=??# $
$"??% '
{??' (
descriptorName??( 6
}??6 7
$str??7 9
{??9 :
routePrefix??: E
.??E F!
CapitalizeFirstLetter??F [
(??[ \
)??\ ]
}??] ^
$str??^ _
"??_ `
;??` a
returnAA 
descriptorNameAA %
;AA% &
}BB 
returnDD 
descriptorPathDD !
;DD! "
}EE 	
publicGG 
staticGG 
stringGG  
ToDelimiterSeparatedGG 1
(GG1 2
thisGG2 6
IEnumerableGG7 B
<GGB C
stringGGC I
>GGI J
inputStringsGGK W
,GGW X
stringGGY _
	separatorGG` i
=GGj k
$strGGl o
)GGo p
{HH 	
varII 
listOfStringsII 
=II 
inputStringsII  ,
.II, -
ToListII- 3
(II3 4
)II4 5
;II5 6
returnKK 
listOfStringsKK  
.KK  !
AnyKK! $
(KK$ %
)KK% &
?LL 
stringLL 
.LL 
JoinLL 
(LL 
	separatorLL '
,LL' (
listOfStringsLL) 6
)LL6 7
:MM 
stringMM 
.MM 
EmptyMM 
;MM 
}NN 	
privatePP 
staticPP 
stringPP !
CapitalizeFirstLetterPP 3
(PP3 4
thisPP4 8
stringPP9 ?
textPP@ D
)PPD E
{QQ 	
ifRR 
(RR 
textRR 
.RR 
LengthRR 
>RR 
$numRR 
)RR  
returnSS 
charSS 
.SS 
ToUpperSS #
(SS# $
textSS$ (
[SS( )
$numSS) *
]SS* +
)SS+ ,
+SS- .
textSS/ 3
.SS3 4
	SubstringSS4 =
(SS= >
$numSS> ?
)SS? @
;SS@ A
returnTT 
textTT 
;TT 
}UU 	
}VV 
}WW �
NC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Hubs\EdfiOdsHub.cs
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
 
Web

 
.

  
Hubs

  $
{ 
[ 
	Authorize 
] 
public 

class 

EdfiOdsHub 
< 
T 
> 
:  
Hub! $
<$ %
T% &
>& '
where( -
T. /
:0 1
class2 7
{ 
	protected 
string 
	GroupName "
=># %
typeof& ,
(, -
T- .
). /
./ 0
ToString0 8
(8 9
)9 :
;: ;
public 
async 
Task 
	Subscribe #
(# $
)$ %
{ 	
await 
Groups 
. 
AddToGroupAsync (
(( )
Context) 0
.0 1
ConnectionId1 =
,= >
	GroupName? H
)H I
;I J
} 	
public 
async 
Task 
Unsubscribe %
(% &
)& '
{ 	
await 
Groups 
.  
RemoveFromGroupAsync -
(- .
Context. 5
.5 6
ConnectionId6 B
,B C
	GroupNameD M
)M N
;N O
} 	
} 
} �
]C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\AcceptAttribute.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
{		 
[

 
AttributeUsage

 
(

 
AttributeTargets

 $
.

$ %
Property

% -
)

- .
]

. /
public 

sealed 
class 
AcceptAttribute '
:( )
	Attribute* 3
{ 
public 
string 
FileTypeSpecifier '
{( )
get* -
;- .
}/ 0
public 
AcceptAttribute 
( 
string %
fileTypeSpecifier& 7
)7 8
=> 
FileTypeSpecifier  
=! "
fileTypeSpecifier# 4
;4 5
} 
} ��
oC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\AutoMapper\AdminWebMappingProfile.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
.. /

AutoMapper/ 9
{ 
public 

class "
AdminWebMappingProfile '
:( )
Profile* 1
{ 
public "
AdminWebMappingProfile %
(% &
)& '
{ 	
	CreateMap 
< 
Application !
,! "
ApplicationModel# 3
>3 4
(4 5
)5 6
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &"
EducationOrganizations& <
,< =
opt> A
=>B D
optE H
.H I
MapFromI P
(P Q
srcQ T
=>U W
srcX [
.[ \-
!ApplicationEducationOrganizations\ }
)} ~
)~ 
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &
ProfileName& 1
,1 2
opt3 6
=>7 9
opt: =
.= >
MapFrom> E
(E F
srcF I
=>J L
srcM P
.P Q
ProfileNameQ \
(\ ]
)] ^
)^ _
)_ `
;` a
	CreateMap 
< ,
 ApplicationEducationOrganization 6
,6 7&
EducationOrganizationModel8 R
>R S
(S T
)T U
. 
	ForMember 
( 
dst 
=> !
dst" %
.% &#
EducationOrganizationId& =
,= >
opt? B
=>C E
optF I
.I J
MapFromJ Q
(Q R
srcR U
=>V X
srcY \
.\ ]#
EducationOrganizationId] t
)t u
)u v
.   
	ForMember   
(   
dst   
=>   !
dst  " %
.  % &
Name  & *
,  * +
opt  , /
=>  0 2
opt  3 6
.  6 7
MapFrom  7 >
<  > ?-
!EducationOrganizationNameResolver  ? `
>  ` a
(  a b
)  b c
)  c d
;  d e
	CreateMap"" 
<"" 
Admin"" 
."" 

DataAccess"" &
.""& '
Models""' -
.""- .
Profile"". 5
,""5 6
ProfileModel""7 C
>""C D
(""D E
)""E F
;""F G
	CreateMap$$ 
<$$ 
Vendor$$ 
,$$ 
EditVendorModel$$ -
>$$- .
($$. /
)$$/ 0
.%% 
	ForMember%% 
(%% 
dst%% 
=>%% !
dst%%" %
.%%% &
Company%%& -
,%%- .
opt%%/ 2
=>%%3 5
opt%%6 9
.%%9 :
MapFrom%%: A
(%%A B
src%%B E
=>%%F H
src%%I L
.%%L M

VendorName%%M W
)%%W X
)%%X Y
.&& 
	ForMember&& 
(&& 
dst&& 
=>&& !
dst&&" %
.&&% &
ContactName&&& 1
,&&1 2
opt&&3 6
=>&&7 9
opt&&: =
.&&= >
MapFrom&&> E
(&&E F
src&&F I
=>&&J L
src&&M P
.&&P Q
ContactName&&Q \
(&&\ ]
)&&] ^
)&&^ _
)&&_ `
.'' 
	ForMember'' 
('' 
dst'' 
=>'' !
dst''" %
.''% &
ContactEmailAddress''& 9
,''9 :
opt''; >
=>''? A
opt''B E
.''E F
MapFrom''F M
(''M N
src''N Q
=>''R T
src''U X
.''X Y
ContactEmail''Y e
(''e f
)''f g
)''g h
)''h i
.(( 
	ForMember(( 
((( 
dst(( 
=>(( !
dst((" %
.((% &
NamespacePrefixes((& 7
,((7 8
opt((9 <
=>((= ?
opt((@ C
.((C D
MapFrom((D K
(((K L
src((L O
=>((P R
ToCommaSeparated((S c
(((c d
src((d g
.((g h#
VendorNamespacePrefixes((h 
)	(( �
)
((� �
)
((� �
;
((� �
	CreateMap** 
<** 
Vendor** 
,** #
VendorApplicationsModel** 5
>**5 6
(**6 7
)**7 8
.++ 
	ForMember++ 
(++ 
dst++ 
=>++ !
dst++" %
.++% &
Applications++& 2
,++2 3
opt,, 
=>,, 
opt,, 
.,, 
MapFrom,, &
(,,& '
src,,' *
=>,,+ -
src,,. 1
.,,1 2
Applications,,2 >
==,,? A
null,,B F
?,,G H
null,,I M
:,,N O
src,,P S
.,,S T
Applications,,T `
.,,` a
Where,,a f
(,,f g
app,,g j
=>,,k m
app,,n q
.,,q r
OdsInstance,,r }
!=	,,~ �
null
,,� �
)
,,� �
)
,,� �
)
,,� �
;
,,� �
	CreateMap.. 
<.. 
Vendor.. 
,.. 
VendorOverviewModel.. 1
>..1 2
(..2 3
)..3 4
.// 
	ForMember// 
(// 
dst// 
=>// !
dst//" %
.//% &
NamespacePrefixes//& 7
,//7 8
opt//9 <
=>//= ?
opt//@ C
.//C D
MapFrom//D K
(//K L
src//L O
=>//P R
ToCommaSeparated//S c
(//c d
src//d g
.//g h#
VendorNamespacePrefixes//h 
)	// �
)
//� �
)
//� �
;
//� �
	CreateMap11 
<11 !
EducationOrganization11 +
,11+ ,&
EducationOrganizationModel11- G
>11G H
(11H I
)11I J
;11J K
	CreateMap22 
<22  
LocalEducationAgency22 *
,22* +&
EducationOrganizationModel22, F
>22F G
(22G H
)22H I
;22I J
	CreateMap33 
<33 $
PostSecondaryInstitution33 .
,33. /&
EducationOrganizationModel330 J
>33J K
(33K L
)33L M
;33M N
	CreateMap44 
<44 
School44 
,44 &
EducationOrganizationModel44 8
>448 9
(449 :
)44: ;
;44; <
	CreateMap66 
<66 (
AddLocalEducationAgencyModel66 2
,662 3 
LocalEducationAgency664 H
>66H I
(66I J
)66J K
.77 
	ForMember77 
(77 
dst77 
=>77 !
dst77" %
.77% &
Id77& (
,77( )
opt77* -
=>77. 0
opt771 4
.774 5
Ignore775 ;
(77; <
)77< =
)77= >
.88 
	ForMember88 
(88 
dst88 
=>88 !
dst88" %
.88% &#
EducationOrganizationId88& =
,88= >
opt88? B
=>88C E
opt88F I
.88I J
MapFrom88J Q
(88Q R
src88R U
=>88V X
src88Y \
.88\ ]"
LocalEducationAgencyId88] s
)88s t
)88t u
.99 
	ForMember99 
(99 
dst99 
=>99 !
dst99" %
.99% &)
EducationOrganizationCategory99& C
,99C D
opt99E H
=>99I K
opt99L O
.99O P
MapFrom99P W
(99W X
src99X [
=>99\ ^&
EducationOrganizationTypes99_ y
.99y z
Instance	99z �
.
99� �"
LocalEducationAgency
99� �
)
99� �
)
99� �
;
99� �
	CreateMap;; 
<;; ,
 AddPostSecondaryInstitutionModel;; 6
,;;6 7$
PostSecondaryInstitution;;8 P
>;;P Q
(;;Q R
);;R S
.<< 
	ForMember<< 
(<< 
dst<< 
=><< !
dst<<" %
.<<% &
Id<<& (
,<<( )
opt<<* -
=><<. 0
opt<<1 4
.<<4 5
Ignore<<5 ;
(<<; <
)<<< =
)<<= >
.== 
	ForMember== 
(== 
dst== 
=>== !
dst==" %
.==% &#
EducationOrganizationId==& =
,=== >
opt==? B
=>==C E
opt==F I
.==I J
MapFrom==J Q
(==Q R
src==R U
=>==V X
src==Y \
.==\ ]&
PostSecondaryInstitutionId==] w
)==w x
)==x y
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
.>>O P
MapFrom>>P W
(>>W X
src>>X [
=>>>\ ^&
EducationOrganizationTypes>>_ y
.>>y z
Instance	>>z �
.
>>� �&
PostSecondaryInstitution
>>� �
)
>>� �
)
>>� �
.?? 
	ForMember?? 
(?? 
dst?? 
=>?? !
dst??" %
.??% &"
LocalEducationAgencyId??& <
,??< =
opt??> A
=>??B D
opt??E H
.??H I
Ignore??I O
(??O P
)??P Q
)??Q R
;??R S
	CreateMapAA 
<AA 
AddSchoolModelAA $
,AA$ %
SchoolAA& ,
>AA, -
(AA- .
)AA. /
.BB 
	ForMemberBB 
(BB 
dstBB 
=>BB !
dstBB" %
.BB% &
IdBB& (
,BB( )
optBB* -
=>BB. 0
optBB1 4
.BB4 5
IgnoreBB5 ;
(BB; <
)BB< =
)BB= >
.CC 
	ForMemberCC 
(CC 
dstCC 
=>CC !
dstCC" %
.CC% &#
EducationOrganizationIdCC& =
,CC= >
optCC? B
=>CCC E
optCCF I
.CCI J
MapFromCCJ Q
(CCQ R
srcCCR U
=>CCV X
srcCCY \
.CC\ ]
SchoolIdCC] e
)CCe f
)CCf g
.DD 
	ForMemberDD 
(DD 
dstDD 
=>DD !
dstDD" %
.DD% &)
EducationOrganizationCategoryDD& C
,DDC D
optDDE H
=>DDI K
optDDL O
.DDO P
MapFromDDP W
(DDW X
srcDDX [
=>DD\ ^&
EducationOrganizationTypesDD_ y
.DDy z
Instance	DDz �
.
DD� �

SchoolType
DD� �
)
DD� �
)
DD� �
;
DD� �
	CreateMapFF 
<FF 
AddPsiSchoolModelFF '
,FF' (
	PsiSchoolFF) 2
>FF2 3
(FF3 4
)FF4 5
.GG 
	ForMemberGG 
(GG 
dstGG 
=>GG !
dstGG" %
.GG% &
IdGG& (
,GG( )
optGG* -
=>GG. 0
optGG1 4
.GG4 5
IgnoreGG5 ;
(GG; <
)GG< =
)GG= >
.HH 
	ForMemberHH 
(HH 
dstHH 
=>HH !
dstHH" %
.HH% &#
EducationOrganizationIdHH& =
,HH= >
optHH? B
=>HHC E
optHHF I
.HHI J
MapFromHHJ Q
(HHQ R
srcHHR U
=>HHV X
srcHHY \
.HH\ ]
SchoolIdHH] e
)HHe f
)HHf g
.II 
	ForMemberII 
(II 
dstII 
=>II !
dstII" %
.II% &)
EducationOrganizationCategoryII& C
,IIC D
optIIE H
=>III K
optIIL O
.IIO P
MapFromIIP W
(IIW X
srcIIX [
=>II\ ^&
EducationOrganizationTypesII_ y
.IIy z
Instance	IIz �
.
II� �

SchoolType
II� �
)
II� �
)
II� �
.JJ 
	ForMemberJJ 
(JJ 
dstJJ 
=>JJ !
dstJJ" %
.JJ% &
ImprovingSchoolJJ& 5
,JJ5 6
optJJ7 :
=>JJ; =
optJJ> A
.JJA B
IgnoreJJB H
(JJH I
)JJI J
)JJJ K
;JJK L
	CreateMapLL 
<LL  
LocalEducationAgencyLL *
,LL* +)
EditLocalEducationAgencyModelLL, I
>LLI J
(LLJ K
)LLK L
.MM 
	ForMemberMM 
(MM 
dstMM 
=>MM !
dstMM" %
.MM% &3
'LocalEducationAgencyCategoryTypeOptionsMM& M
,MMM N
optMMO R
=>MMS U
optMMV Y
.MMY Z
IgnoreMMZ `
(MM` a
)MMa b
)MMb c
.NN 
	ForMemberNN 
(NN 
dstNN 
=>NN !
dstNN" %
.NN% &
StateOptionsNN& 2
,NN2 3
optNN4 7
=>NN8 :
optNN; >
.NN> ?
IgnoreNN? E
(NNE F
)NNF G
)NNG H
;NNH I
	CreateMapPP 
<PP )
EditLocalEducationAgencyModelPP 3
,PP3 4 
LocalEducationAgencyPP5 I
>PPI J
(PPJ K
)PPK L
.QQ 
	ForMemberQQ 
(QQ 
dstQQ 
=>QQ !
dstQQ" %
.QQ% &#
EducationOrganizationIdQQ& =
,QQ= >
optQQ? B
=>QQC E
optQQF I
.QQI J
MapFromQQJ Q
(QQQ R
srcQQR U
=>QQV X
srcQQY \
.QQ\ ]"
LocalEducationAgencyIdQQ] s
)QQs t
)QQt u
.RR 
	ForMemberRR 
(RR 
dstRR 
=>RR !
dstRR" %
.RR% &)
EducationOrganizationCategoryRR& C
,RRC D
optRRE H
=>RRI K
optRRL O
.RRO P
MapFromRRP W
(RRW X
srcRRX [
=>RR\ ^&
EducationOrganizationTypesRR_ y
.RRy z
Instance	RRz �
.
RR� �"
LocalEducationAgency
RR� �
)
RR� �
)
RR� �
;
RR� �
	CreateMapTT 
<TT $
PostSecondaryInstitutionTT .
,TT. /-
!EditPostSecondaryInstitutionModelTT0 Q
>TTQ R
(TTR S
)TTS T
.UU 
	ForMemberUU 
(UU 
dstUU 
=>UU !
dstUU" %
.UU% &0
$PostSecondaryInstitutionLevelOptionsUU& J
,UUJ K
optUUL O
=>UUP R
optUUS V
.UUV W
IgnoreUUW ]
(UU] ^
)UU^ _
)UU_ `
.VV 
	ForMemberVV 
(VV 
dstVV 
=>VV !
dstVV" %
.VV% &/
#AdministrativeFundingControlOptionsVV& I
,VVI J
optVVK N
=>VVO Q
optVVR U
.VVU V
IgnoreVVV \
(VV\ ]
)VV] ^
)VV^ _
.WW 
	ForMemberWW 
(WW 
dstWW 
=>WW !
dstWW" %
.WW% &
StateOptionsWW& 2
,WW2 3
optWW4 7
=>WW8 :
optWW; >
.WW> ?
IgnoreWW? E
(WWE F
)WWF G
)WWG H
;WWH I
	CreateMapYY 
<YY -
!EditPostSecondaryInstitutionModelYY 7
,YY7 8$
PostSecondaryInstitutionYY9 Q
>YYQ R
(YYR S
)YYS T
.ZZ 
	ForMemberZZ 
(ZZ 
dstZZ 
=>ZZ !
dstZZ" %
.ZZ% &#
EducationOrganizationIdZZ& =
,ZZ= >
optZZ? B
=>ZZC E
optZZF I
.ZZI J
MapFromZZJ Q
(ZZQ R
srcZZR U
=>ZZV X
srcZZY \
.ZZ\ ]&
PostSecondaryInstitutionIdZZ] w
)ZZw x
)ZZx y
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
.[[O P
MapFrom[[P W
([[W X
src[[X [
=>[[\ ^&
EducationOrganizationTypes[[_ y
.[[y z
Instance	[[z �
.
[[� �&
PostSecondaryInstitution
[[� �
)
[[� �
)
[[� �
.\\ 
	ForMember\\ 
(\\ 
dst\\ 
=>\\ !
dst\\" %
.\\% &"
LocalEducationAgencyId\\& <
,\\< =
opt\\> A
=>\\B D
opt\\E H
.\\H I
Ignore\\I O
(\\O P
)\\P Q
)\\Q R
;\\R S
	CreateMap^^ 
<^^ 
School^^ 
,^^ 
EditSchoolModel^^ -
>^^- .
(^^. /
)^^/ 0
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
GradeLevelOptions``& 7
,``7 8
opt``9 <
=>``= ?
opt``@ C
.``C D
Ignore``D J
(``J K
)``K L
)``L M
.aa 
	ForMemberaa 
(aa 
dstaa 
=>aa !
dstaa" %
.aa% &
StateOptionsaa& 2
,aa2 3
optaa4 7
=>aa8 :
optaa; >
.aa> ?
Ignoreaa? E
(aaE F
)aaF G
)aaG H
;aaH I
	CreateMapcc 
<cc 
EditSchoolModelcc %
,cc% &
Schoolcc' -
>cc- .
(cc. /
)cc/ 0
.dd 
	ForMemberdd 
(dd 
dstdd 
=>dd !
dstdd" %
.dd% &#
EducationOrganizationIddd& =
,dd= >
optdd? B
=>ddC E
optddF I
.ddI J
MapFromddJ Q
(ddQ R
srcddR U
=>ddV X
srcddY \
.dd\ ]
SchoolIddd] e
)dde f
)ddf g
.ee 
	ForMemberee 
(ee 
dstee 
=>ee !
dstee" %
.ee% &)
EducationOrganizationCategoryee& C
,eeC D
opteeE H
=>eeI K
opteeL O
.eeO P
MapFromeeP W
(eeW X
srceeX [
=>ee\ ^&
EducationOrganizationTypesee_ y
.eey z
Instance	eez �
.
ee� �

SchoolType
ee� �
)
ee� �
)
ee� �
;
ee� �
	CreateMapgg 
<gg 
	PsiSchoolgg 
,gg  
EditPsiSchoolModelgg! 3
>gg3 4
(gg4 5
)gg5 6
.hh 
	ForMemberhh 
(hh 
dsthh 
=>hh !
dsthh" %
.hh% &
SchoolIdhh& .
,hh. /
opthh0 3
=>hh4 6
opthh7 :
.hh: ;
MapFromhh; B
(hhB C
srchhC F
=>hhG I
srchhJ M
.hhM N#
EducationOrganizationIdhhN e
)hhe f
)hhf g
.ii 
	ForMemberii 
(ii 
dstii 
=>ii !
dstii" %
.ii% &
GradeLevelOptionsii& 7
,ii7 8
optii9 <
=>ii= ?
optii@ C
.iiC D
IgnoreiiD J
(iiJ K
)iiK L
)iiL M
.jj 
	ForMemberjj 
(jj 
dstjj 
=>jj !
dstjj" %
.jj% &
StateOptionsjj& 2
,jj2 3
optjj4 7
=>jj8 :
optjj; >
.jj> ?
Ignorejj? E
(jjE F
)jjF G
)jjG H
.kk 
	ForMemberkk 
(kk 
dstkk 
=>kk !
dstkk" %
.kk% &&
AccreditationStatusOptionskk& @
,kk@ A
optkkB E
=>kkF H
optkkI L
.kkL M
IgnorekkM S
(kkS T
)kkT U
)kkU V
.ll 
	ForMemberll 
(ll 
dstll 
=>ll !
dstll" %
.ll% &$
FederalLocaleCodeOptionsll& >
,ll> ?
optll@ C
=>llD F
optllG J
.llJ K
IgnorellK Q
(llQ R
)llR S
)llS T
;llT U
	CreateMapnn 
<nn 
EditPsiSchoolModelnn (
,nn( )
	PsiSchoolnn* 3
>nn3 4
(nn4 5
)nn5 6
.oo 
	ForMemberoo 
(oo 
dstoo 
=>oo !
dstoo" %
.oo% &#
EducationOrganizationIdoo& =
,oo= >
optoo? B
=>ooC E
optooF I
.ooI J
MapFromooJ Q
(ooQ R
srcooR U
=>ooV X
srcooY \
.oo\ ]
SchoolIdoo] e
)ooe f
)oof g
.pp 
	ForMemberpp 
(pp 
dstpp 
=>pp !
dstpp" %
.pp% &)
EducationOrganizationCategorypp& C
,ppC D
optppE H
=>ppI K
optppL O
.ppO P
MapFromppP W
(ppW X
srcppX [
=>pp\ ^&
EducationOrganizationTypespp_ y
.ppy z
Instance	ppz �
.
pp� �

SchoolType
pp� �
)
pp� �
)
pp� �
.qq 
	ForMemberqq 
(qq 
dstqq 
=>qq !
dstqq" %
.qq% &
ImprovingSchoolqq& 5
,qq5 6
optqq7 :
=>qq; =
optqq> A
.qqA B
IgnoreqqB H
(qqH I
)qqI J
)qqJ K
.rr 
	ForMemberrr 
(rr 
dstrr 
=>rr !
dstrr" %
.rr% &"
LocalEducationAgencyIdrr& <
,rr< =
optrr> A
=>rrB D
optrrE H
.rrH I
IgnorerrI O
(rrO P
)rrP Q
)rrQ R
;rrR S
	CreateMaptt 
<tt 

Descriptortt  
,tt  !
DescriptorModeltt" 1
>tt1 2
(tt2 3
)tt3 4
;tt4 5
	CreateMapvv 
<vv 
AdminAppUservv "
,vv" #
	UserModelvv$ -
>vv- .
(vv. /
)vv/ 0
.ww 
	ForMemberww 
(ww 
dstww 
=>ww !
dstww" %
.ww% &
UserIdww& ,
,ww, -
optww. 1
=>ww2 4
optww5 8
.ww8 9
MapFromww9 @
(ww@ A
srcwwA D
=>wwE G
srcwwH K
.wwK L
IdwwL N
)wwN O
)wwO P
;wwP Q
}xx 	
privatezz 
stringzz 
ToCommaSeparatedzz '
(zz' (
ICollectionzz( 3
<zz3 4!
VendorNamespacePrefixzz4 I
>zzI J#
vendorNamespacePrefixeszzK b
)zzb c
{{{ 	
return|| #
vendorNamespacePrefixes|| *
!=||+ -
null||. 2
&&||3 5#
vendorNamespacePrefixes||6 M
.||M N
Any||N Q
(||Q R
)||R S
?}} #
vendorNamespacePrefixes}} 5
.}}5 6
Select}}6 <
(}}< =
x}}= >
=>}}? A
x}}B C
.}}C D
NamespacePrefix}}D S
)}}S T
.}}T U 
ToDelimiterSeparated}}U i
(}}i j
)}}j k
:~~ 
string~~ $
.~~$ %
Empty~~% *
;~~* +
} 	
}
�� 
}�� �
zC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\AutoMapper\EducationOrganizationNameResolver.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
.. /

AutoMapper/ 9
{ 
public 

class -
!EducationOrganizationNameResolver 2
:3 4
IValueResolver5 C
<C D,
 ApplicationEducationOrganizationD d
,d e'
EducationOrganizationModel	f �
,
� �
string
� �
>
� �
{ 
public 
string 
Resolve 
( ,
 ApplicationEducationOrganization >
source? E
,E F&
EducationOrganizationModelG a
destinationb m
,m n
stringo u

destMember	v �
,
� �
ResolutionContext
� �
context
� �
)
� �
{ 	
var 
edOrgs 
= 
context  
.  !%
GetEducationOrganizations! :
(: ;
); <
;< =
var 
edOrg 
= 
edOrgs 
. 
FirstOrDefault -
(- .
o. /
=>0 2
o3 4
.4 5#
EducationOrganizationId5 L
==M O
sourceP V
.V W#
EducationOrganizationIdW n
)n o
;o p
return 
edOrg 
!= 
null  
?! "
edOrg# (
.( )
Name) -
:. /
$str0 2
;2 3
} 	
} 
} �
sC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\CloudOdsAdminAppClaimSetConfiguration.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
{ 
public 

static 
class 1
%CloudOdsAdminAppClaimSetConfiguration =
{ 
public 
static 
CloudOdsClaimSet &
Default' .
=/ 0
new1 4
CloudOdsClaimSet5 E
{ 	
ApplicationName 
= 
CloudOdsAdminApp .
.. /*
SecurityContextApplicationName/ M
,M N
ClaimSetName 
= 
CloudOdsAdminApp +
.+ ,$
InternalAdminAppClaimSet, D
,D E
Claims 
= 
new 
[ 
] 
{ 
new 
CloudOdsEntityClaim '
{ 

EntityName 
=  
$str! 9
,9 :
Actions 
= 
new !
[! "
]" #
{$ %
Create& ,
,, -
Read. 2
,2 3
Update4 :
,: ;
Delete< B
}C D
,D E!
AuthorizationStrategy )
=* +*
NoFurtherAuthorizationRequired, J
} 
, 
new 
CloudOdsEntityClaim '
{ 

EntityName 
=  
$str! 4
,4 5
Actions 
= 
new !
[! "
]" #
{$ %
Create& ,
,, -
Read. 2
,2 3
Update4 :
,: ;
Delete< B
}C D
,D E!
AuthorizationStrategy )
=* +*
NoFurtherAuthorizationRequired, J
}   
,   
new!! 
CloudOdsEntityClaim!! '
{"" 

EntityName## 
=##  
$str##! 5
,##5 6
Actions$$ 
=$$ 
new$$ !
[$$! "
]$$" #
{$$$ %
Create$$& ,
,$$, -
Read$$. 2
,$$2 3
Update$$4 :
,$$: ;
Delete$$< B
}$$C D
,$$D E!
AuthorizationStrategy%% )
=%%* +*
NoFurtherAuthorizationRequired%%, J
}&& 
,&& 
new'' 
CloudOdsEntityClaim'' '
{(( 

EntityName)) 
=))  
$str))! (
,))( )
Actions** 
=** 
new** !
[**! "
]**" #
{**$ %
Read**& *
}**+ ,
,**, -!
AuthorizationStrategy++ )
=++* +*
NoFurtherAuthorizationRequired++, J
},, 
}-- 
}.. 	
;..	 

}// 
}00 �
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\CloudOdsAdminAppSettings.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Infrastructure		  .
{

 
public 

class $
CloudOdsAdminAppSettings )
{ 
private 
static 
readonly 
Lazy  $
<$ %$
CloudOdsAdminAppSettings% =
>= >
	_instance? H
=I J
new 
( 
( 
) 
=> 
new $
CloudOdsAdminAppSettings 2
(2 3
)3 4
)4 5
;5 6
public 
static 
AppSettings !
AppSettings" -
{ 	
get 
{ 
return 
Startup 
. $
ConfigurationAppSettings 7
;7 8
} 
} 	
	protected $
CloudOdsAdminAppSettings *
(* +
)+ ,
{- .
}/ 0
public 
static $
CloudOdsAdminAppSettings .
Instance/ 7
=>8 :
	_instance; D
.D E
ValueE J
;J K
public 
string 
OdsInstanceName %
=>& (
AppSettings) 4
.4 5
DefaultOdsInstance5 G
;G H
public 
string 
ProductionApiUrl &
=>' )
AppSettings* 5
.5 6
ProductionApiUrl6 F
;F G
public!! 
string!! 
ApiExternalUrl!! $
=>!!% '
AppSettings!!( 3
.!!3 4
ApiExternalUrl!!4 B
;!!B C
public## 
string## 
DatabaseEngine## $
=>##% '
AppSettings##( 3
.##3 4
DatabaseEngine##4 B
;##B C
public%% 
int%% /
#SecurityMetadataCacheTimeoutMinutes%% 6
{&& 	
get'' 
{(( 
var)) 
timeOut)) 
=)) 
AppSettings)) )
.))) */
#SecurityMetadataCacheTimeoutMinutes))* M
;))M N
return** 
int** 
.** 
Parse**  
(**  !
timeOut**! (
??**) +
$str**, /
)**/ 0
;**0 1
}++ 
},, 	
}-- 
}.. �.
vC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\CloudOdsApiConnectionInformationProvider.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
{ 
public 

class 4
(CloudOdsApiConnectionInformationProvider 9
:: ;0
$IOdsApiConnectionInformationProvider< `
{ 
private 
readonly .
"IGetOdsAdminAppApiCredentialsQuery ;.
"_getOdsAdminAppApiCredentialsQuery< ^
;^ _
public 4
(CloudOdsApiConnectionInformationProvider 7
(7 8.
"IGetOdsAdminAppApiCredentialsQuery8 Z-
!getOdsAdminAppApiCredentialsQuery[ |
)| }
{ 	.
"_getOdsAdminAppApiCredentialsQuery .
=/ 0-
!getOdsAdminAppApiCredentialsQuery1 R
;R S
} 	
public 
async 
Task 
< '
OdsApiConnectionInformation 5
>5 62
&GetConnectionInformationForEnvironment7 ]
(] ^
)^ _
{ 	
var 
apiCredentials 
=  
await! &.
"_getOdsAdminAppApiCredentialsQuery' I
.I J
ExecuteJ Q
(Q R
)R S
;S T
if 
( %
ApiCredentialAreCorrupted )
() *
)* +
)+ ,
{ *
ThrowSecretCorruptionException .
(. /
)/ 0
;0 1
} 
return 2
&GetConnectionInformationForEnvironment 9
(9 :
apiCredentials: H
.H I#
ProductionApiCredentialI `
)` a
;a b
bool!! %
ApiCredentialAreCorrupted!! *
(!!* +
)!!+ ,
{"" 
return## 
apiCredentials## %
==##& (
null##) -
||##. 0
apiCredentials##1 ?
.##? @#
ProductionApiCredential##@ W
==##X Z
null##[ _
;##_ `
}$$ 
void&& *
ThrowSecretCorruptionException&& /
(&&/ 0
)&&0 1
{'' 
const(( 
string(( 
message(( $
=((% &
$str	)) �
;
))� �
throw** 
new** %
InvalidOperationException** 3
(**3 4
message**4 ;
)**; <
;**< =
}++ 
},, 	
public.. 
static.. '
OdsApiConnectionInformation.. 12
&GetConnectionInformationForEnvironment..2 X
(..X Y
OdsApiCredential..Y i
apiCredentials..j x
)..x y
{// 	
if00 
(00 
apiCredentials00 
==00 !
null00" &
)00& '
{11 
throw22 
new22 !
ArgumentNullException22 /
(22/ 0
nameof220 6
(226 7
apiCredentials227 E
)22E F
)22F G
;22G H
}33 
if44 
(44 
string44 
.44 
IsNullOrWhiteSpace44 )
(44) *
apiCredentials44* 8
.448 9
Key449 <
)44< =
)44= >
{55 
throw66 
new66 
ArgumentException66 +
(66+ ,
$"66, .
{66. /
nameof66/ 5
(665 6
apiCredentials666 D
.66D E
Key66E H
)66H I
}66I J
$str66J N
{66N O
nameof66O U
(66U V
apiCredentials66V d
)66d e
}66e f
$str	66f �
"
66� �
)
66� �
;
66� �
}77 
if88 
(88 
string88 
.88 
IsNullOrWhiteSpace88 )
(88) *
apiCredentials88* 8
.888 9
Secret889 ?
)88? @
)88@ A
{99 
throw:: 
new:: 
ArgumentException:: +
(::+ ,
$"::, .
{::. /
nameof::/ 5
(::5 6
apiCredentials::6 D
.::D E
Secret::E K
)::K L
}::L M
$str::M Q
{::Q R
nameof::R X
(::X Y
apiCredentials::Y g
)::g h
}::h i
$str	::i �
"
::� �
)
::� �
;
::� �
};; 
return== /
#ConnectionInformationForEnvironment== 6
(==6 7$
CloudOdsAdminAppSettings==7 O
.==O P
Instance==P X
.==X Y
ProductionApiUrl==Y i
,==i j
apiCredentials==k y
)==y z
;==z {
}>> 	
private@@ 
static@@ '
OdsApiConnectionInformation@@ 2/
#ConnectionInformationForEnvironment@@3 V
(@@V W
string@@W ]
apiUrl@@^ d
,@@d e
OdsApiCredential@@f v
apiCredentials	@@w �
)
@@� �
{AA 	
varBB !
connectionInformationBB %
=BB& '
newBB( +'
OdsApiConnectionInformationBB, G
(BBG H
)BBH I
{CC 
ApiServerUrlDD 
=DD 
$"DD !
{DD! "
apiUrlDD" (
}DD( )
"DD) *
,DD* +
	ClientKeyEE 
=EE 
apiCredentialsEE *
.EE* +
KeyEE+ .
,EE. /
ClientSecretFF 
=FF 
apiCredentialsFF -
.FF- .
SecretFF. 4
,FF4 5
OAuthUrlGG 
=GG 
$"GG 
{GG 
apiUrlGG $
}GG$ %
$strGG% &
"GG& '
}HH 
;HH 
returnII !
connectionInformationII (
;II( )
}JJ 	
}KK 
}LL �
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\EducationOrganizationTypes.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Infrastructure		  .
{

 
public 

class &
EducationOrganizationTypes +
{ 
private 
static 
readonly 
Lazy  $
<$ %&
EducationOrganizationTypes% ?
>? @
	_instanceB K
=L M
newN Q
LazyR V
<V W&
EducationOrganizationTypesW q
>q r
(r s
(s t
)t u
=>v x
newy |'
EducationOrganizationTypes	} �
(
� �
)
� �
)
� �
;
� �
	protected &
EducationOrganizationTypes ,
(, -
)- .
{ 	
} 	
public 
static &
EducationOrganizationTypes 0
Instance1 9
=: ;
	_instance< E
.E F
ValueF K
;K L
public 
string  
LocalEducationAgency *
=>+ -$
CloudOdsAdminAppSettings. F
.F G
AppSettingsG R
.R S)
LocalEducationAgencyTypeValueS p
;p q
public 
string $
PostSecondaryInstitution .
=>/ 1$
CloudOdsAdminAppSettings2 J
.J K
AppSettingsK V
.V W-
!PostSecondaryInstitutionTypeValueW x
;x y
public 
string 

SchoolType  
=>! #$
CloudOdsAdminAppSettings$ <
.< =
AppSettings= H
.H I
SchoolTypeValueI X
;X Y
} 
} �
[C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\InMemoryCache.cs
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
 
Web

 
.

  
Infrastructure

  .
{ 
public 

class 
InMemoryCache 
{ 
private 
static 
readonly 
Lazy  $
<$ %
InMemoryCache% 2
>2 3
	_instance4 =
=> ?
new@ C
LazyD H
<H I
InMemoryCacheI V
>V W
(W X
(X Y
)Y Z
=>[ ]
new^ a
InMemoryCacheb o
(o p
)p q
)q r
;r s
public 
static 
InMemoryCache #
Instance$ ,
=>- /
	_instance0 9
.9 :
Value: ?
;? @
private 
InMemoryCache 
( 
) 
{ 	
} 	
public 
T 
GetOrSet 
< 
T 
> 
( 
string #
cacheKey$ ,
,, -
Func. 2
<2 3
T3 4
>4 5
getItemCallback6 E
,E F
intG J
expirationInMinutesK ^
=_ `
$numa e
)e f
{ 	
var 
obj 
= 
MemoryCache !
.! "
Default" )
.) *
Get* -
(- .
cacheKey. 6
)6 7
;7 8
if 
( 
obj 
is 
T 
	typedItem "
)" #
return 
	typedItem  
;  !
var 
item 
= 
getItemCallback &
(& '
)' (
;( )
MemoryCache 
. 
Default 
.  
Add  #
(# $
cacheKey$ ,
,, -
item. 2
,2 3
DateTime4 <
.< =
Now= @
.@ A

AddMinutesA K
(K L
expirationInMinutesL _
)_ `
)` a
;a b
return 
item 
; 
} 	
public!! 
async!! 
Task!! 
<!! 
T!! 
>!! 
GetOrSet!! %
<!!% &
T!!& '
>!!' (
(!!( )
string!!) /
cacheKey!!0 8
,!!8 9
Func!!: >
<!!> ?
Task!!? C
<!!C D
T!!D E
>!!E F
>!!F G
getItemCallback!!H W
,!!W X
int!!Y \
expirationInMinutes!!] p
=!!q r
$num!!s w
)!!w x
where!!y ~
T	!! �
:
!!� �
class
!!� �
{"" 	
var## 
item## 
=## 
MemoryCache## "
.##" #
Default### *
.##* +
Get##+ .
(##. /
cacheKey##/ 7
)##7 8
as##9 ;
T##< =
;##= >
if$$ 
($$ 
item$$ 
!=$$ 
null$$ 
)$$ 
return$$ $
item$$% )
;$$) *
item&& 
=&& 
await&& 
getItemCallback&& (
(&&( )
)&&) *
;&&* +
MemoryCache'' 
.'' 
Default'' 
.''  
Add''  #
(''# $
cacheKey''$ ,
,'', -
item''. 2
,''2 3
DateTime''4 <
.''< =
Now''= @
.''@ A

AddMinutes''A K
(''K L
expirationInMinutes''L _
)''_ `
)''` a
;''a b
return(( 
item(( 
;(( 
})) 	
}** 
}++ �
VC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\Property.cs
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
 
Web

 
.

  
Infrastructure

  .
{ 
public 

static 
class 
Property  
{ 
public 
static 
PropertyInfo "
From# '
<' (
TModel( .
,. /
TValue0 6
>6 7
(7 8

Expression8 B
<B C
FuncC G
<G H
TModelH N
,N O
TValueP V
>V W
>W X

expressionY c
)c d
{ 	
return 
( 
PropertyInfo  
)  !
	GetMember! *
(* +

expression+ 5
)5 6
;6 7
} 	
private 
static 

MemberInfo !
	GetMember" +
<+ ,
TModel, 2
,2 3
TValue4 :
>: ;
(; <

Expression< F
<F G
FuncG K
<K L
TModelL R
,R S
TValueT Z
>Z [
>[ \

expression] g
)g h
{ 	
var 
memberExpression  
=! ""
UnpackMemberExpression# 9
(9 :

expression: D
)D E
;E F
return 
memberExpression #
.# $
Member$ *
;* +
} 	
private 
static 
MemberExpression '"
UnpackMemberExpression( >
<> ?
TModel? E
,E F
TValueG M
>M N
(N O

ExpressionO Y
<Y Z
FuncZ ^
<^ _
TModel_ e
,e f
TValueg m
>m n
>n o

expressionp z
)z {
{ 	
var** 
body** 
=** 

expression** !
.**! "
Body**" &
;**& '
if,, 
(,, 
body,, 
is,, 
UnaryExpression,, '
castToObject,,( 4
),,4 5
body-- 
=-- 
castToObject-- #
.--# $
Operand--$ +
;--+ ,
return// 
(// 
MemberExpression// $
)//$ %
body//% )
;//) *
}00 	
}11 
}22 �$
lC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\ResourceClaimSelectListBuilder.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
{ 
public 

class *
ResourceClaimSelectListBuilder /
{ 
public 
static 
List 
< 
SelectListItem )
>) **
GetSelectListForResourceClaims+ I
(I J
ListJ N
<N O
ResourceClaimO \
>\ ]
allResourceClaims^ o
)o p
{ 	
var 

selectList 
= 
new  
List! %
<% &
SelectListItem& 4
>4 5
{5 6
new 
SelectListItem "
{" #
Text$ (
=( )
$str) @
,@ A
ValueB G
=H I
$strJ M
,N O
DisabledP X
=Y Z
true[ _
,_ `
Selecteda i
=j k
truel p
}p q
,q r
} 
; 
var 
parentGroup 
= 
new !
SelectListGroup" 1
{ 
Name 
= 
$str 
} 
; 
var 

childGroup 
= 
new  
SelectListGroup! 0
{ 
Name 
= 
$str "
} 
; 
var 
parentGroupList 
=  !
new" %
List& *
<* +
SelectListItem+ 9
>9 :
(: ;
); <
;< =
var 
childGroupList 
=  
new! $
List% )
<) *
SelectListItem* 8
>8 9
(9 :
): ;
;; <
foreach 
( 
var 
resourceClaim &
in' )
allResourceClaims* ;
); <
{   
var!! 
item!! 
=!! 
new!! 
SelectListItem!! -
{"" 
Text## 
=## 
resourceClaim## (
.##( )
Name##) -
,##- .
Value$$ 
=$$ 
resourceClaim$$ )
.$$) *
Id$$* ,
.$$, -
ToString$$- 5
($$5 6
)$$6 7
,$$7 8
Group%% 
=%% 
parentGroup%% '
}&& 
;&& 
parentGroupList'' 
.''  
Add''  #
(''# $
item''$ (
)''( )
;'') *
if(( 
((( 
resourceClaim(( !
.((! "
Children((" *
.((* +
Count((+ 0
>((1 2
$num((3 4
)((4 5
{)) 
childGroupList** "
.**" #
AddRange**# +
(**+ ,
resourceClaim**, 9
.**9 :
Children**: B
.**B C
Select**C I
(**I J
x**J K
=>**L N
new**O R
SelectListItem**S a
{++ 
Text,, 
=,, 
x,,  
.,,  !
Name,,! %
,,,% &
Value-- 
=-- 
x--  !
.--! "
Id--" $
.--$ %
ToString--% -
(--- .
)--. /
,--/ 0
Group.. 
=.. 

childGroup..  *
}// 
)// 
)// 
;// 
}00 
}11 
parentGroupList22 
=22 
parentGroupList22 -
.22- .
OrderBy22. 5
(225 6
x226 7
=>228 :
x22; <
.22< =
Text22= A
)22A B
.22B C
ToList22C I
(22I J
)22J K
;22K L
parentGroupList33 
.33 
AddRange33 $
(33$ %
childGroupList33% 3
.333 4
OrderBy334 ;
(33; <
x33< =
=>33> @
x33A B
.33B C
Text33C G
)33G H
)33H I
;33I J

selectList44 
.44 
AddRange44 
(44  
new44  #

SelectList44$ .
(44. /
parentGroupList44/ >
,44> ?
$str44@ G
,44G H
$str44I O
,44O P
-44Q R
$num44R S
,44S T
$str44U a
)44a b
)44b c
;44c d
return55 

selectList55 
;55 
}66 	
}77 
}88 �
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\SelectListProvider.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
{ 
public		 

static		 
class		 
SelectListProvider		 *
{

 
public 
static 
List 
< 
SelectListItem )
>) *
ToSelectListItems+ <
<< =
T= >
>> ?
(? @
this 
IReadOnlyList 
< 
T  
>  !
items" '
,' (
string 
emptyValueText !
=" #
null$ (
,( )
Func 
< 
T 
, 
string 
> 
getValue $
=% &
null' +
,+ ,
Func 
< 
T 
, 
string 
> 
getText #
=$ %
null& *
,* +
Func 
< 
T 
, 
SelectListGroup #
># $
getGroup% -
=. /
null0 4
)4 5
{ 	
if 
( 
getValue 
== 
null  
)  !
getValue 
= 
x 
=> 
x  !
.! "
ToString" *
(* +
)+ ,
;, -
if 
( 
getText 
== 
null 
)  
getText 
= 
getValue "
;" #
var 
result 
= 
new 
List !
<! "
SelectListItem" 0
>0 1
(1 2
)2 3
;3 4
if 
( 
emptyValueText 
!= !
null" &
)& '
result 
. 
Add 
( 
new 
SelectListItem -
{. /
Text0 4
=5 6
emptyValueText7 E
,E F
ValueG L
=M N
$strO Q
}R S
)S T
;T U
result 
. 
AddRange 
( 
items !
.! "
Select" (
(( )
x) *
=>+ -
new. 1
SelectListItem2 @
{ 
Text 
= 
getText 
( 
x  
)  !
,! "
Value   
=   
getValue    
(    !
x  ! "
)  " #
,  # $
Group!! 
=!! 
getGroup!!  
?!!  !
.!!! "
Invoke!!" (
(!!( )
x!!) *
)!!* +
}"" 
)"" 
)"" 
;"" 
return$$ 
result$$ 
;$$ 
}%% 	
}&& 
}'' �
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\Tags\DefaultDisplayLabelBuilder.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
.. /
Tags/ 3
{ 
public 

class &
DefaultDisplayLabelBuilder +
:, -
IElementBuilder. =
{ 
public 
bool 
Matches 
( 
ElementRequest *
subject+ 2
)2 3
{ 	
return 
true 
; 
} 	
public 
HtmlTag 
Build 
( 
ElementRequest +
request, 3
)3 4
{ 	
return 
new 
HtmlTag 
( 
$str '
)' (
.( )
Text) -
(- .
BreakUpCamelCase. >
(> ?
request? F
.F G
AccessorG O
.O P
NameP T
)T U
+V W
$strX \
)\ ]
;] ^
} 	
public 
static 
string 
BreakUpCamelCase -
(- .
string. 4
	fieldName5 >
)> ?
{ 	
var 
patterns 
= 
new 
[ 
]  
{ 
$str  
,  !
$str #
,# $
$str   #
}!! 
;!! 
var## 
output## 
=## 
patterns## !
.##! "
	Aggregate##" +
(##+ ,
	fieldName##, 5
,##5 6
($$ 
current$$ 
,$$ 
pattern$$ !
)$$! "
=>$$# %
Regex$$& +
.$$+ ,
Replace$$, 3
($$3 4
current$$4 ;
,$$; <
pattern$$= D
,$$D E
$str$$F M
,$$M N
RegexOptions$$O [
.$$[ \#
IgnorePatternWhitespace$$\ s
)$$s t
)$$t u
;$$u v
return%% 
output%% 
.%% 
Replace%% !
(%%! "
$char%%" %
,%%% &
$char%%' *
)%%* +
;%%+ ,
}&& 	
}'' 
}(( �

pC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\Tags\OdsAdminHtmlConventionLibrary.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
.. /
Tags/ 3
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
 )
OdsAdminHtmlConventionLibrary

 5
{ 
public 
static !
HtmlConventionLibrary +'
CreateHtmlConventionLibrary, G
(G H
)H I
{ 	
var !
htmlConventionLibrary %
=& '
new( +!
HtmlConventionLibrary, A
(A B
)B C
;C D
new &
OdsAdminHtmlTagConventions *
(* +
)+ ,
., -
Apply- 2
(2 3!
htmlConventionLibrary3 H
)H I
;I J
new "
DefaultHtmlConventions &
(& '
)' (
.( )
Apply) .
(. /!
htmlConventionLibrary/ D
)D E
;E F
return !
htmlConventionLibrary (
;( )
} 	
} 
} �:
mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\Tags\OdsAdminHtmlTagConventions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
.. /
Tags/ 3
{ 
public 

class &
OdsAdminHtmlTagConventions +
:, -"
HtmlConventionRegistry. D
{ 
public &
OdsAdminHtmlTagConventions )
() *
)* +
{ 	
Editors 
. 
If 
( 
e 
=> 
e 
. 
Accessor &
.& '
PropertyType' 3
!=4 6
typeof7 =
(= >
bool> B
)B C
&&D F
eG H
.H I
AccessorI Q
.Q R
PropertyTypeR ^
!=_ a
typeofb h
(h i
booli m
?m n
)n o
)o p
. 
AddClass 
( 
$str (
)( )
;) *
Editors 
. 
IfPropertyIs  
<  !
bool! %
>% &
(& '
)' (
.( )
BuildBy) 0
(0 1
BuildCheckBox1 >
)> ?
;? @
Editors 
. 
If 
( 
e 
=> 
e 
. 
Accessor &
.& '
PropertyType' 3
==4 6
typeof7 =
(= >
DateTime> F
)F G
||H J
eK L
.L M
AccessorM U
.U V
PropertyTypeV b
==c e
typeoff l
(l m
DateTimem u
?u v
)v w
)w x
. 

ModifyWith 
( 
m 
=>  
m! "
." #

CurrentTag# -
. 

AddPattern 
( 
$str 0
)0 1
. 
AddPlaceholder 
(  
$str  ,
), -
. 
AddClass 
( 
$str &
)& '
. 
Value 
( 
m 
. 
Value 
< 
DateTime '
?' (
>( )
() *
)* +
!=, .
null/ 3
?4 5
m6 7
.7 8
Value8 =
<= >
DateTime> F
>F G
(G H
)H I
.I J
ToShortDateStringJ [
([ \
)\ ]
:^ _
string` f
.f g
Emptyg l
)l m
)m n
;n o
Editors!! 
.!! 
If!! 
(!! 
e!! 
=>!! 
e!! 
.!! 
Accessor!! &
.!!& '
GetAttribute!!' 3
<!!3 4
DataTypeAttribute!!4 E
>!!E F
(!!F G
)!!G H
?!!H I
.!!I J
DataType!!J R
==!!S U
DataType!!V ^
.!!^ _
Password!!_ g
)!!g h
."" 

ModifyWith"" 
("" 
m"" 
=>""  
m""! "
.""" #

CurrentTag""# -
.""- .
PasswordMode"". :
("": ;
)""; <
)""< =
;""= >
Editors$$ 
.$$ 
If$$ 
($$ 
e$$ 
=>$$ 
e$$ 
.$$ 
Accessor$$ &
.$$& '
PropertyType$$' 3
==$$4 6
typeof$$7 =
($$= >
decimal$$> E
)$$E F
||$$G I
e$$J K
.$$K L
Accessor$$L T
.$$T U
PropertyType$$U a
==$$b d
typeof$$e k
($$k l
decimal$$l s
?$$s t
)$$t u
)$$u v
.%% 

ModifyWith%% 
(%% 
m%% 
=>%%  
m%%! "
.%%" #

CurrentTag%%# -
.%%- .
Value%%. 3
(%%3 4
m%%4 5
.%%5 6
Value%%6 ;
<%%; <
decimal%%< C
?%%C D
>%%D E
(%%E F
)%%F G
!=%%H J
null%%K O
?%%P Q
m%%R S
.%%S T
Value%%T Y
<%%Y Z
decimal%%Z a
>%%a b
(%%b c
)%%c d
.%%d e
ToString%%e m
(%%m n
$str%%n q
)%%q r
:%%s t
$str%%u w
)%%w x
)%%x y
;%%y z
Labels'' 
.'' 
Always'' 
.'' 
BuildBy'' !
<''! "&
DefaultDisplayLabelBuilder''" <
>''< =
(''= >
)''> ?
;''? @
Labels(( 
.(( 
Always(( 
.(( 
AddClass(( "
(((" #
$str((# 2
)((2 3
;((3 4
Labels)) 
.)) 
ModifyForAttribute)) %
<))% &
DisplayAttribute))& 6
>))6 7
())7 8
())8 9
t))9 :
,)): ;
a))< =
)))= >
=>))? A
t))B C
.))C D
Text))D H
())H I
$"))I K
{))K L
a))L M
.))M N
Name))N R
}))R S
$str))S T
"))T U
)))U V
)))V W
;))W X
}** 	
private,, 
static,, 
HtmlTag,, 
BuildCheckBox,, ,
(,,, -
ElementRequest,,- ;
request,,< C
),,C D
{-- 	
var.. 
namingConvention..  
=..! "
new..# &.
"DotNotationElementNamingConvention..' I
(..I J
)..J K
;..K L
var// 
name// 
=// 
namingConvention// '
.//' (
GetName//( /
(/// 0
request//0 7
.//7 8

HolderType//8 B
(//B C
)//C D
,//D E
request//F M
.//M N
Accessor//N V
)//V W
;//W X
var11 
checkboxTag11 
=11 
new11 !
CheckboxTag11" -
(11- .
request11. 5
.115 6
Value116 ;
<11; <
bool11< @
>11@ A
(11A B
)11B C
)11C D
.22 
Attr22 
(22 
$str22 
,22 
$str22 %
)22% &
.33 
Attr33 
(33 
$str33 
,33 
name33 "
)33" #
.44 
Attr44 
(44 
$str44 
,44 
name44  
)44  !
;44! "
var66 $
mvcConventionHiddenInput66 (
=66) *
new66+ .
	HiddenTag66/ 8
(668 9
)669 :
.77 
Attr77 
(77 
$str77 
,77 
$str77 &
)77& '
.88 
Attr88 
(88 
$str88 
,88 
name88 "
)88" #
;88# $
checkboxTag:: 
.:: 
After:: 
(:: $
mvcConventionHiddenInput:: 6
)::6 7
;::7 8
return;; 
checkboxTag;; 
;;; 
}<< 	
}== 
}>> �&
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\ValidationExtensions.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
{ 
public 

static 
class  
ValidationExtensions ,
{ 
private 
static 
readonly 
ILog  $
_logger% ,
=- .

LogManager/ 9
.9 :
	GetLogger: C
(C D
typeofD J
(J K 
ValidationExtensionsK _
)_ `
)` a
;a b
public 
static )
IRuleBuilderOptionsConditions 3
<3 4
T4 5
,5 6
	TProperty7 @
>@ A

SafeCustomB L
<L M
TM N
,N O
	TPropertyP Y
>Y Z
(Z [
this[ _
IRuleBuilder` l
<l m
Tm n
,n o
	TPropertyp y
>y z
ruleBuilder	{ �
,
� �
Action
� �
<
� �
	TProperty
� �
,
� �
ValidationContext
� �
<
� �
T
� �
>
� �
>
� �
action
� �
)
� �
{ 	
return 
ruleBuilder 
. 
Custom %
(% &
(& '
command' .
,. /
context0 7
)7 8
=>9 ;
{ 
try 
{ 
action 
( 
command "
," #
context$ +
)+ ,
;, -
} 
catch 
( 
	Exception  
	exception! *
)* +
{ 
const 
string  
errorMsg! )
=* +
$str	, �
;
� �
context 
. 

AddFailure &
(& '
errorMsg' /
)/ 0
;0 1
_logger   
.   
Error   !
(  ! "
errorMsg  " *
,  * +
	exception  , 5
)  5 6
;  6 7
}!! 
}"" 
)"" 
;"" 
}## 	
public%% 
static%% )
IRuleBuilderOptionsConditions%% 3
<%%3 4
T%%4 5
,%%5 6
	TProperty%%7 @
>%%@ A
SafeCustomAsync%%B Q
<%%Q R
T%%R S
,%%S T
	TProperty%%U ^
>%%^ _
(%%_ `
this%%` d
IRuleBuilder%%e q
<%%q r
T%%r s
,%%s t
	TProperty%%u ~
>%%~ 
ruleBuilder
%%� �
,
%%� �
Func
%%� �
<
%%� �
	TProperty
%%� �
,
%%� �
ValidationContext
%%� �
<
%%� �
T
%%� �
>
%%� �
,
%%� �
Task
%%� �
>
%%� �
action
%%� �
)
%%� �
{&& 	
return'' 
ruleBuilder'' 
.'' 
CustomAsync'' *
(''* +
async'', 1
(''2 3
command''3 :
,'': ;
context''< C
,''C D
cancellationToken''E V
)''V W
=>''X Z
{(( 
try)) 
{** 
await++ 
action++  
(++  !
command++! (
,++( )
context++* 1
)++1 2
;++2 3
},, 
catch-- 
(-- 
	Exception--  
	exception--! *
)--* +
{.. 
const// 
string//  
errorMsg//! )
=//* +
$str	//, �
;
//� �
context00 
.00 

AddFailure00 &
(00& '
errorMsg00' /
)00/ 0
;000 1
_logger11 
.11 
Error11 !
(11! "
errorMsg11" *
,11* +
	exception11, 5
)115 6
;116 7
}22 
}33 
)33 
;33 
}44 	
public66 
static66 
void66 
AddFailures66 &
<66& '
T66' (
>66( )
(66) *
this66* .
ValidationContext66/ @
<66@ A
T66A B
>66B C
context66D K
,66K L
ValidationResult66M ]
result66^ d
)66d e
{77 	
result88 
.88 
Errors88 
.88 
Select88  
(88  !
x88! "
=>88# %
x88& '
.88' (
ErrorMessage88( 4
)884 5
.885 6
ForEach886 =
(88= >
context88> E
.88E F

AddFailure88F P
)88P Q
;88Q R
}99 	
}:: 
};; �
UC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Infrastructure\Version.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Infrastructure  .
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
 
Version

 
{ 
public 
static 
string  
InformationalVersion 1
=>2 4
Assembly 
.  
GetExecutingAssembly %
(% &
)& '
. 
GetCustomAttribute #
<# $1
%AssemblyInformationalVersionAttribute$ I
>I J
(J K
)K L
?L M
.M N 
InformationalVersionN b
;b c
} 
} �
TC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ErrorViewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
{ 
public 

class 
ErrorViewModel 
{		 
public

 
string

 
	RequestId
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
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
} 
} �
aC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ApplicationModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
{		 
public

 

class

 
ApplicationModel

 !
{ 
public 
int 
ApplicationId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ApplicationName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ClaimSetName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
ProfileName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
List 
< &
EducationOrganizationModel .
>. /"
EducationOrganizations0 F
{G H
getI L
;L M
setN Q
;Q R
}S T
public 
string 
OdsInstanceName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} �?
pC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Application\AddApplicationModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Application2 =
{ 
public 

class 
AddApplicationModel $
:% & 
IAddApplicationModel' ;
{ 
public 
string 
ApplicationName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
VendorId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ClaimSetName "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Display	 
( 
Name 
= 
$str (
)( )
]) *
public 
int 
? 
	ProfileId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
IEnumerable 
< 
int 
> $
EducationOrganizationIds  8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
public 

class #
AddApplicationViewModel (
:) *
AddApplicationModel+ >
{ 
public 
string 

VendorName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
List 
< 
string 
> 
ClaimSetNames )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public   
List   
<   
ProfileModel    
>    !
Profiles  " *
{  + ,
get  - 0
;  0 1
set  2 5
;  5 6
}  7 8
public!! 
List!! 
<!!  
LocalEducationAgency!! (
>!!( )"
LocalEducationAgencies!!* @
{!!A B
get!!C F
;!!F G
set!!H K
;!!K L
}!!M N
public"" 
List"" 
<"" $
PostSecondaryInstitution"" ,
>"", -%
PostSecondaryInstitutions"". G
{""H I
get""J M
;""M N
set""O R
;""R S
}""T U
public## 
List## 
<## 
School## 
>## 
Schools## #
{##$ %
get##& )
;##) *
set##+ .
;##. /
}##0 1
public$$ 0
$ApplicationEducationOrganizationType$$ 3%
EducationOrganizationType$$4 M
{$$N O
get$$P S
;$$S T
set$$U X
;$$X Y
}$$Z [
public%% 
bool%% 
TpdmEnabled%% 
{%%  !
get%%" %
;%%% &
set%%' *
;%%* +
}%%, -
}&& 
public(( 

class(( 0
$ApplicationEducationOrganizationType(( 5
:((6 7
Enumeration((8 C
<((C D0
$ApplicationEducationOrganizationType((D h
>((h i
{)) 
public** 
static** 0
$ApplicationEducationOrganizationType** : 
LocalEducationAgency**; O
=**P Q
new**R U0
$ApplicationEducationOrganizationType**V z
(**z {
$num**{ |
,**| }
$str	**~ �
)
**� �
;
**� �
public++ 
static++ 0
$ApplicationEducationOrganizationType++ :
School++; A
=++B C
new++D G0
$ApplicationEducationOrganizationType++H l
(++l m
$num++m n
,++n o
$str++p x
)++x y
;++y z
public,, 
static,, 0
$ApplicationEducationOrganizationType,, :$
PostSecondaryInstitution,,; S
=,,T U
new,,V Y0
$ApplicationEducationOrganizationType,,Z ~
(,,~ 
$num	,, �
,
,,� �
$str
,,� �
)
,,� �
;
,,� �
public.. 0
$ApplicationEducationOrganizationType.. 3
(..3 4
int..4 7
value..8 =
,..= >
string..? E
displayName..F Q
)..Q R
:..S T
base..U Y
(..Y Z
value..Z _
,.._ `
displayName..a l
)..l m
{// 	
}00 	
}11 
public33 

class33 (
AddApplicationModelValidator33 -
:33. /
AbstractValidator330 A
<33A B
AddApplicationModel33B U
>33U V
{44 
public55 (
AddApplicationModelValidator55 +
(55+ ,
)55, -
{66 	
RuleFor77 
(77 
m77 
=>77 
m77 
.77 
ApplicationName77 *
)77* +
.88 
NotEmpty88 
(88 
)88 
;88 
RuleFor:: 
(:: 
m:: 
=>:: 
m:: 
.:: 
ApplicationName:: *
)::* +
.;; 
Must;; 
(;; ,
 BeWithinApplicationNameMaxLength;; 6
);;6 7
.<< 
WithMessage<< 
(<< 
$str	<< �
+
<<� �
$str== X
)==X Y
.>> 
When>> 
(>> 
x>> 
=>>> 
x>> 
.>> 
ApplicationName>> ,
!=>>- /
null>>0 4
)>>4 5
;>>5 6
RuleFor@@ 
(@@ 
m@@ 
=>@@ 
m@@ 
.@@ 
ClaimSetName@@ '
)@@' (
.AA 
NotEmptyAA 
(AA 
)AA 
.BB 
WithMessageBB 
(BB 
$strBB :
)BB: ;
;BB; <
RuleForDD 
(DD 
mDD 
=>DD 
mDD 
.DD $
EducationOrganizationIdsDD 3
)DD3 4
.EE 
NotEmptyEE 
(EE 
)EE 
.FF 
WithMessageFF 
(FF 
$strFF R
)FFR S
;FFS T
RuleForHH 
(HH 
mHH 
=>HH 
mHH 
.HH 
VendorIdHH #
)HH# $
.HH$ %
NotEmptyHH% -
(HH- .
)HH. /
;HH/ 0
}II 	
privateKK 
boolKK ,
 BeWithinApplicationNameMaxLengthKK 5
<KK5 6
TKK6 7
>KK7 8
(KK8 9
AddApplicationModelKK9 L
modelKKM R
,KKR S
stringKKT Z
applicationNameKK[ j
,KKj k
ValidationContextKKl }
<KK} ~
TKK~ 
>	KK �
context
KK� �
)
KK� �
{LL 	
varMM !
extraCharactersInNameMM %
=MM& '
applicationNameMM( 7
.MM7 8
LengthMM8 >
-MM? @
ValidationConstantsMMA T
.MMT U(
MaximumApplicationNameLengthMMU q
;MMq r
ifNN 
(NN !
extraCharactersInNameNN %
<=NN& (
$numNN) *
)NN* +
{OO 
returnPP 
truePP 
;PP 
}QQ 
contextSS 
.SS 
MessageFormatterSS $
.SS$ %
AppendArgumentSS% 3
(SS3 4
$strSS4 E
,SSE F
applicationNameSSG V
)SSV W
;SSW X
contextTT 
.TT 
MessageFormatterTT $
.TT$ %
AppendArgumentTT% 3
(TT3 4
$strTT4 K
,TTK L!
extraCharactersInNameTTM b
)TTb c
;TTc d
returnVV 
falseVV 
;VV 
}WW 	
}XX 
}YY �
pC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Application\ApplicationKeyModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Application2 =
{		 
public

 

class

 
ApplicationKeyModel

 $
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
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Secret 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
DisplayApiUrl #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} �
sC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Application\ApplicationsIndexModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Application2 =
{		 
public

 

class

 "
ApplicationsIndexModel

 '
:

( )(
BaseOdsInstanceSettingsModel

* F
{ 
public 
string 
DisplayApiUrl #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} �
sC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Application\DeleteApplicationModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Application2 =
{ 
public 

class "
DeleteApplicationModel '
{		 
public

 
int

 
ApplicationId

  
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
- .
} 
} �8
qC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Application\EditApplicationModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Application2 =
{ 
public 

class  
EditApplicationModel %
:& '!
IEditApplicationModel( =
{ 
public 
int 
ApplicationId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
ApplicationName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
VendorId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ClaimSetName "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Display	 
( 
Name 
= 
$str (
)( )
]) *
public 
int 
? 
	ProfileId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Display	 
( 
Name 
= 
$str 1
)1 2
]2 3
public 
IEnumerable 
< 
int 
> $
EducationOrganizationIds  8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
public 

class $
EditApplicationViewModel )
:* + 
EditApplicationModel, @
{ 
public 
string 

VendorName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public   
List   
<   
string   
>   
ClaimSetNames   )
{  * +
get  , /
;  / 0
set  1 4
;  4 5
}  6 7
public!! 
List!! 
<!! 
ProfileModel!!  
>!!  !
Profiles!!" *
{!!+ ,
get!!- 0
;!!0 1
set!!2 5
;!!5 6
}!!7 8
public"" 
List"" 
<""  
LocalEducationAgency"" (
>""( )"
LocalEducationAgencies""* @
{""A B
get""C F
;""F G
set""H K
;""K L
}""M N
public## 
List## 
<## $
PostSecondaryInstitution## ,
>##, -%
PostSecondaryInstitutions##. G
{##H I
get##J M
;##M N
set##O R
;##R S
}##T U
public$$ 
List$$ 
<$$ 
School$$ 
>$$ 
Schools$$ #
{$$$ %
get$$& )
;$$) *
set$$+ .
;$$. /
}$$0 1
public%% 0
$ApplicationEducationOrganizationType%% 3%
EducationOrganizationType%%4 M
{%%N O
get%%P S
;%%S T
set%%U X
;%%X Y
}%%Z [
public&& 
bool&& 
TpdmEnabled&& 
{&&  !
get&&" %
;&&% &
set&&' *
;&&* +
}&&, -
}'' 
public)) 

class)) )
EditApplicationModelValidator)) .
:))/ 0
AbstractValidator))1 B
<))B C 
EditApplicationModel))C W
>))W X
{** 
public++ )
EditApplicationModelValidator++ ,
(++, -
)++- .
{,, 	
RuleFor-- 
(-- 
m-- 
=>-- 
m-- 
.-- 
ApplicationId-- (
)--( )
.--) *
NotEmpty--* 2
(--2 3
)--3 4
;--4 5
RuleFor.. 
(.. 
m.. 
=>.. 
m.. 
... 
ApplicationName.. *
)..* +
...+ ,
NotEmpty.., 4
(..4 5
)..5 6
;..6 7
RuleFor// 
(// 
m// 
=>// 
m// 
.// 
ApplicationName// *
)//* +
.00 
Must00 
(00 ,
 BeWithinApplicationNameMaxLength00 6
)006 7
.11 
WithMessage11 
(11 
$str	11 �
+
11� �
$str22 e
)22e f
.33 
When33 
(33 
x33 
=>33 
x33 
.33 
ApplicationName33 ,
!=33- /
null330 4
)334 5
;335 6
RuleFor55 
(55 
m55 
=>55 
m55 
.55 
ClaimSetName55 '
)55' (
.66 
NotEmpty66 
(66 
)66 
.77 
WithMessage77 
(77 
$str77 :
)77: ;
;77; <
RuleFor99 
(99 
m99 
=>99 
m99 
.99 $
EducationOrganizationIds99 3
)993 4
.:: 
NotEmpty:: 
(:: 
):: 
.;; 
WithMessage;; 
(;; 
$str;; R
);;R S
;;;S T
RuleFor== 
(== 
m== 
=>== 
m== 
.== 
VendorId== #
)==# $
.==$ %
NotEmpty==% -
(==- .
)==. /
;==/ 0
}>> 	
private@@ 
bool@@ ,
 BeWithinApplicationNameMaxLength@@ 5
<@@5 6
T@@6 7
>@@7 8
(@@8 9 
EditApplicationModel@@9 M
model@@N S
,@@S T
string@@U [
applicationName@@\ k
,@@k l
ValidationContext@@m ~
<@@~ 
T	@@ �
>
@@� �
context
@@� �
)
@@� �
{AA 	
varBB !
extraCharactersInNameBB %
=BB& '
applicationNameBB( 7
.BB7 8
LengthBB8 >
-BB? @
ValidationConstantsBBA T
.BBT U(
MaximumApplicationNameLengthBBU q
;BBq r
ifCC 
(CC !
extraCharactersInNameCC %
<=CC& (
$numCC) *
)CC* +
{DD 
returnEE 
trueEE 
;EE 
}FF 
contextHH 
.HH 
MessageFormatterHH $
.HH$ %
AppendArgumentHH% 3
(HH3 4
$strHH4 E
,HHE F
applicationNameHHG V
)HHV W
;HHW X
contextII 
.II 
MessageFormatterII $
.II$ %
AppendArgumentII% 3
(II3 4
$strII4 K
,IIK L!
extraCharactersInNameIIM b
)IIb c
;IIc d
returnLL 
falseLL 
;LL 
}MM 	
}NN 
}OO �
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Application\RegenerateSecretModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Application2 =
{ 
public 

class !
RegenerateSecretModel &
{		 
public

 
int

 
ApplicationId

  
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
- .
} 
} �
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\AddClaimSetModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
	ClaimSets2 ;
{ 
public 

class 
AddClaimSetModel !
:" #
IAddClaimSetModel$ 5
{ 
public 
string 
ClaimSetName "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
public 

class %
AddClaimSetModelValidator *
:+ ,
AbstractValidator- >
<> ?
AddClaimSetModel? O
>O P
{ 
private !
IGetAllClaimSetsQuery %!
_getAllClaimSetsQuery& ;
;; <
public %
AddClaimSetModelValidator (
(( )!
IGetAllClaimSetsQuery) > 
getAllClaimSetsQuery? S
)S T
{ 	!
_getAllClaimSetsQuery !
=" # 
getAllClaimSetsQuery$ 8
;8 9
RuleFor 
( 
m 
=> 
m 
. 
ClaimSetName '
)' (
.( )
NotEmpty) 1
(1 2
)2 3
. 
Must 
( 
BeAUniqueName #
)# $
. 
WithMessage 
( 
$str u
)u v
;v w
RuleFor 
( 
m 
=> 
m 
. 
ClaimSetName '
)' (
. 
MaximumLength 
( 
$num "
)" #
.   
WithMessage   
(   
$str   S
)  S T
;  T U
}!! 	
private## 
bool## 
BeAUniqueName## "
(##" #
string### )
newName##* 1
)##1 2
{$$ 	
return%% !
_getAllClaimSetsQuery%% (
.%%( )
Execute%%) 0
(%%0 1
)%%1 2
.%%2 3
All%%3 6
(%%6 7
x%%7 8
=>%%9 ;
x%%< =
.%%= >
Name%%> B
!=%%C E
newName%%F M
)%%M N
;%%N O
}&& 	
}'' 
}(( �
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\AuthStrategyEditorModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
	ClaimSets2 ;
{		 
public

 

class

 #
AuthStrategyEditorModel

 (
{ 
public 
ResourceClaim 
ResourceClaim *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
AuthStrategies $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} �	
oC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\ClaimSetDetailsModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
	ClaimSets		2 ;
{

 
public 

class  
ClaimSetDetailsModel %
{ 
public 
ClaimSet 
ClaimSet  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
IEnumerable 
< 

Management %
.% &
ClaimSetEditor& 4
.4 5
Application5 @
>@ A
ApplicationsB N
{O P
getQ T
;T U
setV Y
;Y Z
}[ \
public 
IEnumerable 
< 
ResourceClaim (
>( )
ResourceClaims* 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
} �
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\ClaimSetFileExportModel.cs
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
 
Web

 
.

  
Models

  &
.

& '

ViewModels

' 1
.

1 2
	ClaimSets

2 ;
{ 
public 

class #
ClaimSetFileExportModel (
:( )$
IClaimSetFileExportModel* B
{ 
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
IEnumerable 
< 
ClaimSet #
># $
	ClaimSets% .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
IList 
< 
int 
> 
SelectedForExport +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
class ,
 ClaimSetFileExportModelValidator 5
:6 7
AbstractValidator8 I
<I J#
ClaimSetFileExportModelJ a
>a b
{ 	
public ,
 ClaimSetFileExportModelValidator 3
(3 4
)4 5
{ 
RuleFor 
( 
m 
=> 
m 
. 
SelectedForExport 0
)0 1
.1 2
NotEmpty2 :
(: ;
); <
.< =
WithMessage= H
(H I
$strI |
)| }
;} ~
RuleFor 
( 
m 
=> 
m 
. 
Title $
)$ %
.% &
NotEmpty& .
(. /
)/ 0
;0 1
} 
} 	
} 
} �O
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\ClaimSetFileImportModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
	ClaimSets2 ;
{ 
public 

class #
ClaimSetFileImportModel (
{ 
private 
SharingModel 
_sharingModel *
;* +
[ 	
DisplayName	 
( 
$str "
)" #
]# $
[ 	
Accept	 
( 
$str 
) 
] 
public 
	IFormFile 

ImportFile #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
SharingModel 
AsSharingModel *
(* +
)+ ,
{ 	
return 
_sharingModel  
??=! $
SharingModel% 1
.1 2%
DeserializeToSharingModel2 K
(K L

ImportFileL V
.V W
OpenReadStreamW e
(e f
)f g
)g h
;h i
}   	
public"" 
class"" ,
 ClaimSetFileImportModelValidator"" 5
:""6 7
AbstractValidator""8 I
<""I J#
ClaimSetFileImportModel""J a
>""a b
{## 	
private$$ !
IGetAllClaimSetsQuery$$ )!
_getAllClaimSetsQuery$$* ?
;$$? @
private%% ,
 GetResourceClaimsAsFlatListQuery%% 4#
_getResourceClaimsQuery%%5 L
;%%L M
public'' ,
 ClaimSetFileImportModelValidator'' 3
(''3 4!
IGetAllClaimSetsQuery''4 I 
getAllClaimSetsQuery''J ^
,''^ _-
 GetResourceClaimsAsFlatListQuery	''` �$
getResourceClaimsQuery
''� �
)
''� �
{(( !
_getAllClaimSetsQuery)) %
=))& ' 
getAllClaimSetsQuery))( <
;))< =#
_getResourceClaimsQuery** '
=**( )"
getResourceClaimsQuery*** @
;**@ A
RuleFor++ 
(++ 
m++ 
=>++ 
m++ 
.++ 

ImportFile++ )
)++) *
.++* +
NotEmpty+++ 3
(++3 4
)++4 5
;++5 6
When-- 
(-- 
m-- 
=>-- 
m-- 
.-- 

ImportFile-- &
!=--' )
null--* .
,--. /
(--0 1
)--1 2
=>--3 5
{.. 
RuleFor// 
(// 
x// 
=>//  
x//! "
)//" #
.00 

SafeCustom00 #
(00# $
(00$ %
model00% *
,00* +
context00, 3
)003 4
=>005 7
{11 
var22 
	validator22  )
=22* +
new22, /!
SharingModelValidator220 E
(22E F!
_getAllClaimSetsQuery22F [
,22[ \#
_getResourceClaimsQuery22] t
,22t u
context22v }
.22} ~
PropertyName	22~ �
)
22� �
;
22� �
if44 
(44  
Path44  $
.44$ %
GetExtension44% 1
(441 2
model442 7
.447 8

ImportFile448 B
.44B C
FileName44C K
)44K L
?44L M
.44M N
ToLower44N U
(44U V
)44V W
!=44X Z
$str44[ b
)44b c
{55 
context66  '
.66' (

AddFailure66( 2
(662 3
$str663 m
)66m n
;66n o
}77 
else88  
{99 
context::  '
.::' (
AddFailures::( 3
(::3 4
	validator::4 =
.::= >
Validate::> F
(::F G
model::G L
.::L M
AsSharingModel::M [
(::[ \
)::\ ]
)::] ^
)::^ _
;::_ `
};; 
}<< 
)<< 
;<< 
}== 
)== 
;== 
}>> 
}?? 	
publicAA 
classAA !
SharingModelValidatorAA *
:AA+ ,
AbstractValidatorAA- >
<AA> ?
SharingModelAA? K
>AAK L
{BB 	
privateCC 
readonlyCC 
ILogCC !
_loggerCC" )
=CC* +

LogManagerCC, 6
.CC6 7
	GetLoggerCC7 @
(CC@ A
typeofCCA G
(CCG H!
SharingModelValidatorCCH ]
)CC] ^
)CC^ _
;CC_ `
publicEE !
SharingModelValidatorEE (
(EE( )!
IGetAllClaimSetsQueryEE) > 
getAllClaimSetsQueryEE? S
,EES T,
 GetResourceClaimsAsFlatListQueryEEU u#
getResourceClaimsQuery	EEv �
,
EE� �
string
EE� �
propertyName
EE� �
)
EE� �
{FF 
constGG 
stringGG 
missingGG $
=GG% &
$strGG' S
;GGS T
varHH 
dbResourceClaimsHH $
=HH% &"
getResourceClaimsQueryHH' =
.HH= >
ExecuteHH> E
(HHE F
)HHF G
.HHG H
SelectHHH N
(HHN O
xHHO P
=>HHQ S
xHHT U
.HHU V
NameHHV Z
)HHZ [
.HH[ \
	ToHashSetHH\ e
(HHe f
)HHf g
;HHg h
RuleForJJ 
(JJ 
xJJ 
=>JJ 
xJJ 
.JJ 
TitleJJ $
)JJ$ %
.JJ% &
NotNullJJ& -
(JJ- .
)JJ. /
.JJ/ 0
WithMessageJJ0 ;
(JJ; <
stringJJ< B
.JJB C
FormatJJC I
(JJI J
missingJJJ Q
,JJQ R
$strJJS Z
)JJZ [
)JJ[ \
;JJ\ ]
RuleForEachKK 
(KK 
xKK 
=>KK  
xKK! "
.KK" #
TemplateKK# +
.KK+ ,
	ClaimSetsKK, 5
)KK5 6
.LL 

SafeCustomLL 
(LL  
(LL  !
sharingClaimSetLL! 0
,LL0 1
contextLL2 9
)LL9 :
=>LL; =
{MM 
ifNN 
(NN $
IsAnExistingClaimSetNameNN 4
(NN4 5
sharingClaimSetNN5 D
.NND E
NameNNE I
)NNI J
)NNJ K
{OO 
contextPP #
.PP# $

AddFailurePP$ .
(PP. /
propertyNamePP/ ;
,PP; <
$"PP= ?
$str	PP? �
{
PP� �
sharingClaimSet
PP� �
.
PP� �
Name
PP� �
}
PP� �
$str
PP� �
"
PP� �
)
PP� �
;
PP� �
returnQQ "
;QQ" #
}RR 
varTT 
resourceClaimsTT *
=TT+ ,
newTT- 0
ListTT1 5
<TT5 6
ResourceClaimTT6 C
>TTC D
(TTD E
)TTE F
;TTF G
tryUU 
{VV 
resourceClaimsWW *
=WW+ ,
sharingClaimSetWW- <
.WW< =
ResourceClaimsWW= K
.WWK L
SelectWWL R
(WWR S
xWWS T
=>WWU W
xWWX Y
.WWY Z
ToObjectWWZ b
<WWb c
ResourceClaimWWc p
>WWp q
(WWq r
)WWr s
)WWs t
.WWt u
ToListWWu {
(WW{ |
)WW| }
;WW} ~
}XX 
catchYY 
(YY 
	ExceptionYY (
	exceptionYY) 2
)YY2 3
{ZZ 
var[[ 
errorMsg[[  (
=[[) *
$"\\  "
$str\\" w
{\\w x
sharingClaimSet	\\x �
.
\\� �
Name
\\� �
}
\\� �
$str
\\� �
{
\\� �
	exception
\\� �
.
\\� �
Message
\\� �
}
\\� �
$str
\\� �
"
\\� �
;
\\� �
context]] #
.]]# $

AddFailure]]$ .
(]]. /
propertyName]]/ ;
,]]; <
errorMsg]]= E
)]]E F
;]]F G
_logger^^ #
.^^# $
Error^^$ )
(^^) *
errorMsg^^* 2
,^^2 3
	exception^^4 =
)^^= >
;^^> ?
}__ 
ifaa 
(aa 
resourceClaimsaa *
.aa* +
Anyaa+ .
(aa. /
)aa/ 0
)aa0 1
{bb 
foreachcc #
(cc$ %
varcc% (
resourceClaimcc) 6
incc7 9
resourceClaimscc: H
)ccH I
{dd 
ifee  "
(ee# $
!ee$ %
dbResourceClaimsee% 5
.ee5 6
Containsee6 >
(ee> ?
resourceClaimee? L
.eeL M
NameeeM Q
)eeQ R
)eeR S
{ff  !
contextgg$ +
.gg+ ,

AddFailuregg, 6
(gg6 7
propertyNamegg7 C
,ggC D
$"ggE G
$str	ggG �
{
gg� �
sharingClaimSet
gg� �
.
gg� �
Name
gg� �
}
gg� �
$str
gg� �
{
gg� �
resourceClaim
gg� �
.
gg� �
Name
gg� �
}
gg� �
$str
gg� �
"
gg� �
)
gg� �
;
gg� �
}hh  !
}ii 
}jj 
}kk 
)kk 
;kk 
boolmm $
IsAnExistingClaimSetNamemm -
(mm- .
stringmm. 4
sharingClaimSetNamemm5 H
)mmH I
{nn 
varoo 
	claimSetsoo !
=oo" # 
getAllClaimSetsQueryoo$ 8
.oo8 9
Executeoo9 @
(oo@ A
)ooA B
.ooB C
ToListooC I
(ooI J
)ooJ K
;ooK L
returnpp 
	claimSetspp $
.pp$ %
Anypp% (
(pp( )
xpp) *
=>pp+ -
xpp. /
.pp/ 0
Namepp0 4
==pp5 7
sharingClaimSetNamepp8 K
)ppK L
;ppL M
}qq 
}rr 
}ss 	
}tt 
}uu �
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\ClaimSetModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
	ClaimSets2 ;
{		 
public

 

class

 
ClaimSetModel

 
:

 #
BaseGlobalSettingsModel

  7
{ 
public 
EditClaimSetModel  
EditClaimSetModel! 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public  
ClaimSetDetailsModel # 
ClaimSetDetailsModel$ 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
} �
qC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\ClaimSetResourcesModel.cs
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
 
Web

 
.

  
Models

  &
.

& '

ViewModels

' 1
.

1 2
	ClaimSets

2 ;
{ 
public 

class "
ClaimSetResourcesModel '
{ 
public 
int 

ClaimSetId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ClaimSetName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
IEnumerable 
< 
ResourceClaim (
>( )
ResourceClaims* 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
List 
< 
SelectListItem "
>" #
AllResourceClaims$ 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public "
ClaimSetResourcesModel %
(% &
)& '
{ 	
ResourceClaims 
= 
new  
List! %
<% &
ResourceClaim& 3
>3 4
(4 5
)5 6
;6 7
} 	
} 
} �
lC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\CopyClaimSetModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
	ClaimSets2 ;
{ 
public 

class 
CopyClaimSetModel "
:# $
ICopyClaimSetModel% 7
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 

OriginalId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
OriginalName "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
public 

class &
CopyClaimSetModelValidator +
:, -
AbstractValidator. ?
<? @
CopyClaimSetModel@ Q
>Q R
{ 
private !
IGetAllClaimSetsQuery %!
_getAllClaimSetsQuery& ;
;; <
public &
CopyClaimSetModelValidator )
() *!
IGetAllClaimSetsQuery* ? 
getAllClaimSetsQuery@ T
)T U
{ 	!
_getAllClaimSetsQuery !
=" # 
getAllClaimSetsQuery$ 8
;8 9
RuleFor 
( 
m 
=> 
m 
. 
Name 
)  
.  !
NotEmpty! )
() *
)* +
.+ ,
Must, 0
(0 1
BeAUniqueName1 >
)> ?
.? @
WithMessage@ K
(K L
$strL w
)w x
;x y
RuleFor 
( 
m 
=> 
m 
. 
Name 
)  
. 
MaximumLength 
( 
$num "
)" #
.   
WithMessage   
(   
$str   S
)  S T
;  T U
}!! 	
private## 
bool## 
BeAUniqueName## "
(##" #
string### )
newName##* 1
)##1 2
{$$ 	
return%% !
_getAllClaimSetsQuery%% (
.%%( )
Execute%%) 0
(%%0 1
)%%1 2
.%%2 3
All%%3 6
(%%6 7
x%%7 8
=>%%9 ;
x%%< =
.%%= >
Name%%> B
!=%%C E
newName%%F M
)%%M N
;%%N O
}&& 	
}'' 
}(( �
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\DeleteClaimSetModel.cs
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
 
Web

 
.

  
Models

  &
.

& '

ViewModels

' 1
.

1 2
	ClaimSets

2 ;
{ 
public 

class 
DeleteClaimSetModel $
:% & 
IDeleteClaimSetModel' ;
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
bool 

IsEditable 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int "
VendorApplicationCount )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
public 

class (
DeleteClaimSetModelValidator -
:. /
AbstractValidator0 A
<A B
DeleteClaimSetModelB U
>U V
{ 
private 
readonly !
IGetClaimSetByIdQuery .!
_getClaimSetByIdQuery/ D
;D E
public (
DeleteClaimSetModelValidator +
(+ ,!
IGetClaimSetByIdQuery, A 
getClaimSetByIdQueryB V
)V W
{ 	!
_getClaimSetByIdQuery !
=" # 
getClaimSetByIdQuery$ 8
;8 9
RuleFor 
( 
m 
=> 
m 
. 
Id 
) 
. 
NotEmpty '
(' (
)( )
. 
Must 
(  
BeAnExistingClaimSet *
)* +
. 
WithMessage 
( 
$str G
)G H
;H I
RuleFor 
( 
m 
=> 
m 
. "
VendorApplicationCount 1
)1 2
.   
Equal   
(   
$num   
)   
.!! 
WithMessage!! 
(!! 
m!! 
=>!! !
$"!!" $
$str!!$ U
{!!U V
m!!V W
.!!W X"
VendorApplicationCount!!X n
}!!n o
$str	!!o �
"
!!� �
)
!!� �
;
!!� �
RuleFor"" 
("" 
m"" 
=>"" 
m"" 
."" 

IsEditable"" %
)""% &
.""& '
NotEqual""' /
(""/ 0
false""0 5
)""5 6
.""6 7
WithMessage""7 B
(""B C
$str""C p
)""p q
;""q r
}## 	
private%% 
bool%%  
BeAnExistingClaimSet%% )
(%%) *
int%%* -
id%%. 0
)%%0 1
{&& 	
try'' 
{(( !
_getClaimSetByIdQuery)) %
.))% &
Execute))& -
())- .
id)). 0
)))0 1
;))1 2
return** 
true** 
;** 
}++ 
catch,, 
(,, 
AdminAppException,, $
),,$ %
{-- 
return.. 
false.. 
;.. 
}// 
}00 	
}11 
}22 �
vC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\DeleteClaimSetResourceModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
	ClaimSets		2 ;
{

 
public 

class '
DeleteClaimSetResourceModel ,
:- .*
IDeleteResourceOnClaimSetModel/ M
{ 
public 
int 

ClaimSetId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
ResourceClaimId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
ClaimSetName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
ResourceName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
class 0
$DeleteClaimSetResourceModelValidator 9
:: ;
AbstractValidator< M
<M N'
DeleteClaimSetResourceModelN i
>i j
{ 	
private 
readonly *
IGetResourcesByClaimSetIdQuery ;*
_getResourcesByClaimSetIdQuery< Z
;Z [
public 0
$DeleteClaimSetResourceModelValidator 7
(7 8*
IGetResourcesByClaimSetIdQuery8 V)
getResourcesByClaimSetIdQueryW t
)t u
{ *
_getResourcesByClaimSetIdQuery .
=/ 0)
getResourcesByClaimSetIdQuery1 N
;N O
RuleFor 
( 
m 
=> 
m 
. 

ClaimSetId )
)) *
.* +
NotEmpty+ 3
(3 4
)4 5
;5 6
RuleFor 
( 
m 
=> 
m 
. 
ResourceClaimId .
). /
. 
NotEmpty 
( 
) 
. 
Must 
( "
BeOnTheClaimSetAlready 0
)0 1
. 
WithMessage  
(  !
$str! P
)P Q
;Q R
} 
private!! 
bool!! "
BeOnTheClaimSetAlready!! /
(!!/ 0'
DeleteClaimSetResourceModel!!0 K
model!!L Q
,!!Q R
int!!S V
resourceClaimId!!W f
)!!f g
{"" 
return## *
_getResourcesByClaimSetIdQuery## 5
.##5 6
SingleResource##6 D
(##D E
model##E J
.##J K

ClaimSetId##K U
,##U V
resourceClaimId##W f
)##f g
!=##h j
null##k o
;##o p
}$$ 
}%% 	
}&& 
}'' �#
lC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\EditClaimSetModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
	ClaimSets2 ;
{ 
public 

class 
EditClaimSetModel "
:# $
IEditClaimSetModel% 7
{ 
public 
string 
ClaimSetName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 

ClaimSetId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
IEnumerable 
< 
VendorApplication ,
>, -
Applications. :
{; <
get= @
;@ A
setB E
;E F
}G H
public 
IEnumerable 
< 
ResourceClaim (
>( )
ResourceClaims* 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
List 
< 
SelectListItem "
>" #
AllResourceClaims$ 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
public 

class &
EditClaimSetModelValidator +
:, -
AbstractValidator. ?
<? @
EditClaimSetModel@ Q
>Q R
{ 
private !
IGetAllClaimSetsQuery %!
_getAllClaimSetsQuery& ;
;; <
private 
readonly !
IGetClaimSetByIdQuery .!
_getClaimSetByIdQuery/ D
;D E
public &
EditClaimSetModelValidator )
() *!
IGetAllClaimSetsQuery* ? 
getAllClaimSetsQuery@ T
,T U!
IGetClaimSetByIdQueryV k!
getClaimSetByIdQuery	l �
)
� �
{   	!
_getAllClaimSetsQuery!! !
=!!" # 
getAllClaimSetsQuery!!$ 8
;!!8 9!
_getClaimSetByIdQuery"" !
=""" # 
getClaimSetByIdQuery""$ 8
;""8 9
RuleFor$$ 
($$ 
m$$ 
=>$$ 
m$$ 
.$$ 
ClaimSetName$$ '
)$$' (
.%% 
NotEmpty%% 
(%% 
)%% 
.&& 
Must&& 
(&& 
BeAUniqueName&& #
)&&# $
.'' 
WithMessage'' 
('' 
$str'' u
)''u v
.(( 
When(( 
((( 
NameIsChanged(( #
)((# $
;(($ %
RuleFor** 
(** 
m** 
=>** 
m** 
.** 
ClaimSetName** '
)**' (
.++ 
MaximumLength++ 
(++ 
$num++ "
)++" #
.,, 
WithMessage,, 
(,, 
$str,, S
),,S T
;,,T U
}-- 	
private// 
bool// 
NameIsChanged// "
(//" #
EditClaimSetModel//# 4
model//5 :
)//: ;
{00 	
try11 
{22 
var33 
existingClaimSet33 $
=33% &!
_getClaimSetByIdQuery33' <
.33< =
Execute33= D
(33D E
model33E J
.33J K

ClaimSetId33K U
)33U V
;33V W
return44 
existingClaimSet44 '
.44' (
Name44( ,
!=44- /
model440 5
.445 6
ClaimSetName446 B
;44B C
}55 
catch66 
(66 
AdminAppException66 $
)66$ %
{77 
return88 
false88 
;88 
}99 
}:: 	
private<< 
bool<< 
BeAUniqueName<< "
(<<" #
string<<# )
newName<<* 1
)<<1 2
{== 	
return>> !
_getAllClaimSetsQuery>> (
.>>( )
Execute>>) 0
(>>0 1
)>>1 2
.>>2 3
All>>3 6
(>>6 7
x>>7 8
=>>>9 ;
x>>< =
.>>= >
Name>>> B
!=>>C E
newName>>F M
)>>M N
;>>N O
}?? 	
}@@ 
}AA �
tC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\EditClaimSetResourceModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
	ClaimSets2 ;
{ 
public 

class %
EditClaimSetResourceModel *
:* +(
IEditResourceOnClaimSetModel, H
{ 
public 
int 

ClaimSetId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
ResourceClaim 
ResourceClaim *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
IEnumerable 
< 
ResourceClaim (
>( )"
ExistingResourceClaims* @
{A B
getC F
;F G
setH K
;K L
}M N
} 
public 

class .
"EditClaimSetResourceModelValidator 3
:4 5
AbstractValidator6 G
<G H%
EditClaimSetResourceModelH a
>a b
{ 
public .
"EditClaimSetResourceModelValidator 1
(1 2
)2 3
{ 	
RuleFor 
( 
m 
=> 
m 
. 
ResourceClaim (
)( )
.) *
Must* .
(. /
HaveValidActions/ ?
)? @
. 
WithMessage 
( 
m 
=> !
$" 
$str	 �
{
� �
m
� �
.
� �
ResourceClaim
� �
.
� �
Name
� �
}
� �
"
� �
)
� �
. 
Must 
( 
( 
model 
, 
resourceClaim +
)+ ,
=>- /
NotHaveDuplicates0 A
(A B
modelB G
.G H"
ExistingResourceClaimsH ^
,^ _
resourceClaim` m
)m n
)n o
. 
WithMessage 
( 
m 
=> !
$" 
$str h
{h i
mi j
.j k
ResourceClaimk x
.x y
Namey }
}} ~
"~ 
)	 �
;
� �
} 	
private   
static   
bool   
NotHaveDuplicates   -
(  - .
IEnumerable  . 9
<  9 :
ResourceClaim  : G
>  G H"
existingResourceClaims  I _
,  _ `
ResourceClaim  a n
resourceClaim  o |
)  | }
{!! 	
return"" "
existingResourceClaims"" )
==""* ,
null""- 1
||""2 4
!""5 6"
existingResourceClaims""6 L
.""L M
Contains""M U
(""U V
resourceClaim""V c
)""c d
;""d e
}## 	
private%% 
static%% 
bool%% 
HaveValidActions%% ,
(%%, -
ResourceClaim%%- :
resourceClaim%%; H
)%%H I
{&& 	
return'' 
resourceClaim''  
.''  !
Create''! '
||''( *
resourceClaim''+ 8
.''8 9
Delete''9 ?
||''@ B
resourceClaim''C P
.''P Q
Read''Q U
||''V X
resourceClaim''Y f
.''f g
Update''g m
;''m n
}(( 	
})) 
}** �
uC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\ExportClaimSetPreviewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
	ClaimSets2 ;
{ 
public 

class &
ExportClaimSetPreviewModel +
{		 
public

 
string

 
DownLoadFileTitle

 '
{

( )
get

* -
;

- .
set

/ 2
;

2 3
}

4 5
public 
string 
ExportPreviewString )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} �
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\OverrideDefaultAuthorizationStrategyModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
	ClaimSets		2 ;
{

 
public 

class 5
)OverrideDefaultAuthorizationStrategyModel :
:; <6
*IOverrideDefaultAuthorizationStrategyModel= g
{ 
public 
int 

ClaimSetId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
ResourceClaimId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int *
AuthorizationStrategyForCreate 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
int (
AuthorizationStrategyForRead /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
int *
AuthorizationStrategyForUpdate 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
int *
AuthorizationStrategyForDelete 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
public 

class >
2OverrideDefaultAuthorizationStrategyModelValidator C
:D E
AbstractValidatorF W
<W X6
)OverrideDefaultAuthorizationStrategyModel	X �
>
� �
{ 
private 
readonly *
IGetResourcesByClaimSetIdQuery 7*
_getResourcesByClaimSetIdQuery8 V
;V W
public >
2OverrideDefaultAuthorizationStrategyModelValidator A
(A B*
IGetResourcesByClaimSetIdQueryB `)
getResourcesByClaimSetIdQuerya ~
)~ 
{ 	*
_getResourcesByClaimSetIdQuery *
=+ ,)
getResourcesByClaimSetIdQuery- J
;J K
RuleFor 
( 
m 
=> 
m 
) 
. 
Must  
(  !
m! "
=># %
ExistInTheSystem& 6
(6 7
m7 8
.8 9

ClaimSetId9 C
,C D
mE F
.F G
ResourceClaimIdG V
)V W
)W X
.X Y
WithMessageY d
(d e
$str	e �
)
� �
;
� �
} 	
private   
bool   
ExistInTheSystem   %
(  % &
int  & )

claimSetId  * 4
,  4 5
int  6 9
resourceClaimId  : I
)  I J
{!! 	
return"" *
_getResourcesByClaimSetIdQuery"" 1
.""1 2
SingleResource""2 @
(""@ A

claimSetId""A K
,""K L
resourceClaimId""M \
)""\ ]
!=""^ `
null""a e
;""e f
}## 	
}$$ 
}%% �
zC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ClaimSets\ResetToDefaultAuthStrategyModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
	ClaimSets		2 ;
{

 
public 

class +
ResetToDefaultAuthStrategyModel 0
:1 2,
 IResetToDefaultAuthStrategyModel3 S
{ 
public 
int 

ClaimSetId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
ResourceClaimId "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
public 

class 4
(ResetToDefaultAuthStrategyModelValidator 9
:: ;
AbstractValidator< M
<M N+
ResetToDefaultAuthStrategyModelN m
>m n
{ 
private 
readonly *
IGetResourcesByClaimSetIdQuery 7*
_getResourcesByClaimSetIdQuery8 V
;V W
public 4
(ResetToDefaultAuthStrategyModelValidator 7
(7 8*
IGetResourcesByClaimSetIdQuery8 V)
getResourcesByClaimSetIdQueryW t
)t u
{ 	*
_getResourcesByClaimSetIdQuery *
=+ ,)
getResourcesByClaimSetIdQuery- J
;J K
RuleFor 
( 
m 
=> 
m 
) 
. 
Must  
(  !
m! "
=># %
ExistInTheSystem& 6
(6 7
m7 8
.8 9
ResourceClaimId9 H
,H I
mJ K
.K L

ClaimSetIdL V
)V W
)W X
.X Y
WithMessageY d
(d e
$str	e �
)
� �
;
� �
} 	
private 
bool 
ExistInTheSystem %
(% &
int& )
resourceClaimId* 9
,9 :
int; >

claimSetId? I
)I J
{ 	
return *
_getResourcesByClaimSetIdQuery 1
.1 2
SingleResource2 @
(@ A

claimSetIdA K
,K L
resourceClaimIdM \
)\ ]
!=^ `
nulla e
;e f
}   	
}!! 
}"" �
vC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Descriptors\DescriptorCategoriesModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Descriptors2 =
{		 
public

 

class

 %
DescriptorCategoriesModel

 *
{ 
public 
IReadOnlyList 
< 
Category %
>% & 
DescriptorCategories' ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
class 
Category 
{ 	
public 
string 
Path 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Name 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 	
} 
} �
lC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Descriptors\DescriptorModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Descriptors2 =
{ 
public 

class 
DescriptorModel  
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
} �
rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Descriptors\DescriptorsIndexModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Descriptors2 =
{		 
public

 

class

 !
DescriptorsIndexModel

 &
:

' ((
BaseOdsInstanceSettingsModel

) E
{ 
} 
} �
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizationModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
{ 
public 

class &
EducationOrganizationModel +
{		 
public

 
int

 #
EducationOrganizationId

 *
{

+ ,
get

- 0
;

0 1
set

2 5
;

5 6
}

7 8
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} �'
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\AddLocalEducationAgencyModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{ 
public 

class (
AddLocalEducationAgencyModel -
{ 
[ 	
Display	 
( 
Name 
= 
$str 9
)9 :
]: ;
public 
int 
? "
LocalEducationAgencyId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Display	 
( 
Name 
= 
$str /
)/ 0
]0 1
public 
int 
? 
StateOrganizationId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
[ 	
Display	 
( 
Name 
= 
$str -
)- .
]. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Display	 
( 
Name 
= 
$str !
)! "
]" #
public 
string 
StreetNumberName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string $
ApartmentRoomSuiteNumber .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string ,
 LocalEducationAgencyCategoryType 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
List 
< 
SelectOptionModel %
>% &3
'LocalEducationAgencyCategoryTypeOptions' N
{O P
getQ T
;T U
setV Y
;Y Z
}[ \
public 
List 
< 
SelectOptionModel %
>% &
StateOptions' 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public   
bool    
RequiredApiDataExist   (
{  ) *
get  + .
;  . /
set  0 3
;  3 4
}  5 6
}!! 
public## 

class## 1
%AddLocalEducationAgencyModelValidator## 6
:##7 8
AbstractValidator##9 J
<##J K(
AddLocalEducationAgencyModel##K g
>##g h
{$$ 
public%% 1
%AddLocalEducationAgencyModelValidator%% 4
(%%4 5
)%%5 6
{&& 	
RuleFor'' 
('' 
m'' 
=>'' 
m'' 
.'' "
LocalEducationAgencyId'' 1
)''1 2
.''2 3
NotEmpty''3 ;
(''; <
)''< =
;''= >
RuleFor(( 
((( 
m(( 
=>(( 
m(( 
.(( 
Name(( 
)((  
.((  !
NotEmpty((! )
((() *
)((* +
;((+ ,
RuleFor)) 
()) 
m)) 
=>)) 
m)) 
.)) 
StreetNumberName)) +
)))+ ,
.)), -
NotEmpty))- 5
())5 6
)))6 7
;))7 8
RuleFor** 
(** 
m** 
=>** 
m** 
.** 
State**  
)**  !
.**! "
NotEmpty**" *
(*** +
)**+ ,
;**, -
RuleFor++ 
(++ 
m++ 
=>++ 
m++ 
.++ 
City++ 
)++  
.++  !
NotEmpty++! )
(++) *
)++* +
;+++ ,
RuleFor,, 
(,, 
m,, 
=>,, 
m,, 
.,, 
ZipCode,, "
),," #
.,,# $
NotEmpty,,$ ,
(,,, -
),,- .
;,,. /
}-- 	
}.. 
}// �)
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\AddPostSecondaryInstitutionModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{ 
public 

class ,
 AddPostSecondaryInstitutionModel 1
{ 
[ 	
Display	 
( 
Name 
= 
$str 7
)7 8
]8 9
public 
int 
? &
PostSecondaryInstitutionId .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[ 	
Display	 
( 
Name 
= 
$str -
)- .
]. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Display	 
( 
Name 
= 
$str !
)! "
]" #
public 
string 
StreetNumberName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string $
ApartmentRoomSuiteNumber .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Display	 
( 
Name 
= 
$str :
): ;
]; <
public 
string )
PostSecondaryInstitutionLevel 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AdministrativeFundingControl 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
List 
< 
SelectOptionModel %
>% &0
$PostSecondaryInstitutionLevelOptions' K
{L M
getN Q
;Q R
setS V
;V W
}X Y
public 
List 
< 
SelectOptionModel %
>% &/
#AdministrativeFundingControlOptions' J
{K L
getM P
;P Q
setR U
;U V
}W X
public   
List   
<   
SelectOptionModel   %
>  % &
StateOptions  ' 3
{  4 5
get  6 9
;  9 :
set  ; >
;  > ?
}  @ A
public!! 
bool!!  
RequiredApiDataExist!! (
{!!) *
get!!+ .
;!!. /
set!!0 3
;!!3 4
}!!5 6
}"" 
public$$ 

class$$ 5
)AddPostSecondaryInstitutionModelValidator$$ :
:$$; <
AbstractValidator$$= N
<$$N O,
 AddPostSecondaryInstitutionModel$$O o
>$$o p
{%% 
public&& 5
)AddPostSecondaryInstitutionModelValidator&& 8
(&&8 9
)&&9 :
{'' 	
RuleFor(( 
((( 
m(( 
=>(( 
m(( 
.(( &
PostSecondaryInstitutionId(( 5
)((5 6
.((6 7
NotEmpty((7 ?
(((? @
)((@ A
;((A B
RuleFor)) 
()) 
m)) 
=>)) 
m)) 
.)) 
Name)) 
)))  
.))  !
NotEmpty))! )
())) *
)))* +
;))+ ,
RuleFor** 
(** 
m** 
=>** 
m** 
.** 
StreetNumberName** +
)**+ ,
.**, -
NotEmpty**- 5
(**5 6
)**6 7
;**7 8
RuleFor++ 
(++ 
m++ 
=>++ 
m++ 
.++ 
State++  
)++  !
.++! "
NotEmpty++" *
(++* +
)+++ ,
;++, -
RuleFor,, 
(,, 
m,, 
=>,, 
m,, 
.,, 
City,, 
),,  
.,,  !
NotEmpty,,! )
(,,) *
),,* +
;,,+ ,
RuleFor-- 
(-- 
m-- 
=>-- 
m-- 
.-- 
ZipCode-- "
)--" #
.--# $
NotEmpty--$ ,
(--, -
)--- .
;--. /
}.. 	
}// 
}00 �
yC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\AddPsiSchoolModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2"
EducationOrganizations		2 H
{

 
public 

class 
AddPsiSchoolModel "
:" #
AddSchoolModel$ 2
{ 
public 
int 
? &
PostSecondaryInstitutionId .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
AccreditationStatus )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
List 
< 
SelectOptionModel %
>% &&
AccreditationStatusOptions' A
{B C
getD G
;G H
setI L
;L M
}N O
public 
string 
FederalLocaleCode '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
List 
< 
SelectOptionModel %
>% &$
FederalLocaleCodeOptions' ?
{@ A
getB E
;E F
setG J
;J K
}L M
} 
public 

class &
AddPsiSchoolModelValidator +
:, -'
AddSchoolModelValidatorBase. I
<I J
AddPsiSchoolModelJ [
>[ \
{ 
} 
} �+
vC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\AddSchoolModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{ 
public 

class 
AddSchoolModel 
{ 
public 
int 
? "
LocalEducationAgencyId *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Display	 
( 
Name 
= 
$str #
)# $
]$ %
public 
int 
? 
SchoolId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Display	 
( 
Name 
= 
$str -
)- .
]. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Display	 
( 
Name 
= 
$str !
)! "
]" #
public 
string 
StreetNumberName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string $
ApartmentRoomSuiteNumber .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
string 
> 
GradeLevels '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
List 
< 
SelectOptionModel %
>% &
GradeLevelOptions' 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
List 
< 
SelectOptionModel %
>% &
StateOptions' 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
bool  
RequiredApiDataExist (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
}   
public"" 

class"" #
AddSchoolModelValidator"" (
:"") *'
AddSchoolModelValidatorBase""+ F
<""F G
AddSchoolModel""G U
>""U V
{## 
}$$ 
public&& 

abstract&& 
class&& '
AddSchoolModelValidatorBase&& 5
<&&5 6
T&&6 7
>&&7 8
:&&9 :
AbstractValidator&&; L
<&&L M
T&&M N
>&&N O
where&&P U
T&&V W
:&&X Y
AddSchoolModel&&Z h
{'' 
	protected(( '
AddSchoolModelValidatorBase(( -
(((- .
)((. /
{)) 	
RuleFor** 
(** 
x** 
=>** 
x** 
.** 
SchoolId** #
)**# $
.**$ %
NotEmpty**% -
(**- .
)**. /
;**/ 0
RuleFor++ 
(++ 
x++ 
=>++ 
x++ 
.++ 
Name++ 
)++  
.++  !
NotEmpty++! )
(++) *
)++* +
;+++ ,
RuleFor,, 
(,, 
x,, 
=>,, 
x,, 
.,, 
StreetNumberName,, +
),,+ ,
.,,, -
NotEmpty,,- 5
(,,5 6
),,6 7
;,,7 8
RuleFor-- 
(-- 
x-- 
=>-- 
x-- 
.-- 
City-- 
)--  
.--  !
NotEmpty--! )
(--) *
)--* +
;--+ ,
RuleFor.. 
(.. 
x.. 
=>.. 
x.. 
... 
State..  
)..  !
...! "
NotEmpty.." *
(..* +
)..+ ,
;.., -
RuleFor// 
(// 
x// 
=>// 
x// 
.// 
ZipCode// "
)//" #
.//# $
NotEmpty//$ ,
(//, -
)//- .
;//. /
RuleFor00 
(00 
x00 
=>00 
x00 
.00 
GradeLevels00 &
)00& '
.00' (
Must00( ,
(00, -
x00- .
=>00/ 1
x002 3
!=004 6
null007 ;
&&00< >
x00? @
.00@ A
Count00A F
>00G H
$num00I J
)00J K
.00K L
WithMessage00L W
(00W X
$str	00X �
)
00� �
;
00� �
}11 	
}22 
}33 �
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\DeleteEducationOrganizationModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{ 
public 

class ,
 DeleteEducationOrganizationModel 1
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
% &
} 
} �#
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\EditLocalEducationAgencyModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{ 
public 

class )
EditLocalEducationAgencyModel .
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
int "
LocalEducationAgencyId )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Display	 
( 
Name 
= 
$str /
)/ 0
]0 1
public 
int 
? 
StateOrganizationId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
[ 	
Display	 
( 
Name 
= 
$str -
)- .
]. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Display	 
( 
Name 
= 
$str !
)! "
]" #
public 
string 
StreetNumberName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string $
ApartmentRoomSuiteNumber .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string ,
 LocalEducationAgencyCategoryType 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
List 
< 
SelectOptionModel %
>% &3
'LocalEducationAgencyCategoryTypeOptions' N
{O P
getQ T
;T U
setV Y
;Y Z
}[ \
public 
List 
< 
SelectOptionModel %
>% &
StateOptions' 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
}   
public"" 

class"" 2
&EditLocalEducationAgencyModelValidator"" 7
:""8 9
AbstractValidator"": K
<""K L)
EditLocalEducationAgencyModel""L i
>""i j
{## 
public$$ 2
&EditLocalEducationAgencyModelValidator$$ 5
($$5 6
)$$6 7
{%% 	
RuleFor&& 
(&& 
m&& 
=>&& 
m&& 
.&& 
Name&& 
)&&  
.&&  !
NotEmpty&&! )
(&&) *
)&&* +
;&&+ ,
RuleFor'' 
('' 
m'' 
=>'' 
m'' 
.'' 
StreetNumberName'' +
)''+ ,
.'', -
NotEmpty''- 5
(''5 6
)''6 7
;''7 8
RuleFor(( 
((( 
m(( 
=>(( 
m(( 
.(( 
State((  
)((  !
.((! "
NotEmpty((" *
(((* +
)((+ ,
;((, -
RuleFor)) 
()) 
m)) 
=>)) 
m)) 
.)) 
City)) 
)))  
.))  !
NotEmpty))! )
())) *
)))* +
;))+ ,
RuleFor** 
(** 
m** 
=>** 
m** 
.** 
ZipCode** "
)**" #
.**# $
NotEmpty**$ ,
(**, -
)**- .
;**. /
}++ 	
},, 
}-- �'
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\EditPostSecondaryInstitutionModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{ 
public 

class -
!EditPostSecondaryInstitutionModel 2
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
Display	 
( 
Name 
= 
$str 7
)7 8
]8 9
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
[ 	
Display	 
( 
Name 
= 
$str -
)- .
]. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Display	 
( 
Name 
= 
$str !
)! "
]" #
public 
string 
StreetNumberName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string $
ApartmentRoomSuiteNumber .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Display	 
( 
Name 
= 
$str :
): ;
]; <
public 
string )
PostSecondaryInstitutionLevel 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AdministrativeFundingControl 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
List 
< 
SelectOptionModel %
>% &0
$PostSecondaryInstitutionLevelOptions' K
{L M
getN Q
;Q R
setS V
;V W
}X Y
public   
List   
<   
SelectOptionModel   %
>  % &/
#AdministrativeFundingControlOptions  ' J
{  K L
get  M P
;  P Q
set  R U
;  U V
}  W X
public!! 
List!! 
<!! 
SelectOptionModel!! %
>!!% &
StateOptions!!' 3
{!!4 5
get!!6 9
;!!9 :
set!!; >
;!!> ?
}!!@ A
}"" 
public$$ 

class$$ 6
*EditPostSecondaryInstitutionModelValidator$$ ;
:$$< =
AbstractValidator$$> O
<$$O P-
!EditPostSecondaryInstitutionModel$$P q
>$$q r
{%% 
public&& 6
*EditPostSecondaryInstitutionModelValidator&& 9
(&&9 :
)&&: ;
{'' 	
RuleFor(( 
((( 
m(( 
=>(( 
m(( 
.(( 
Name(( 
)((  
.((  !
NotEmpty((! )
((() *
)((* +
;((+ ,
RuleFor)) 
()) 
m)) 
=>)) 
m)) 
.)) 
StreetNumberName)) +
)))+ ,
.)), -
NotEmpty))- 5
())5 6
)))6 7
;))7 8
RuleFor** 
(** 
m** 
=>** 
m** 
.** 
State**  
)**  !
.**! "
NotEmpty**" *
(*** +
)**+ ,
;**, -
RuleFor++ 
(++ 
m++ 
=>++ 
m++ 
.++ 
City++ 
)++  
.++  !
NotEmpty++! )
(++) *
)++* +
;+++ ,
RuleFor,, 
(,, 
m,, 
=>,, 
m,, 
.,, 
ZipCode,, "
),," #
.,,# $
NotEmpty,,$ ,
(,,, -
),,- .
;,,. /
}-- 	
}.. 
}// �
zC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\EditPsiSchoolModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2"
EducationOrganizations		2 H
{

 
public 

class 
EditPsiSchoolModel #
:# $
EditSchoolModel% 4
{ 
public 
int 
? &
PostSecondaryInstitutionId .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
AccreditationStatus )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
List 
< 
SelectOptionModel %
>% &&
AccreditationStatusOptions' A
{B C
getD G
;G H
setI L
;L M
}N O
public 
string 
FederalLocaleCode '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
List 
< 
SelectOptionModel %
>% &$
FederalLocaleCodeOptions' ?
{@ A
getB E
;E F
setG J
;J K
}L M
} 
public 

class '
EditPsiSchoolModelValidator ,
:- .(
EditSchoolModelValidatorBase/ K
<K L
EditPsiSchoolModelL ^
>^ _
{ 
} 
} �(
wC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\EditSchoolModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{ 
public 

class 
EditSchoolModel  
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
SchoolId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int "
LocalEducationAgencyId )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Display	 
( 
Name 
= 
$str -
)- .
]. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Display	 
( 
Name 
= 
$str !
)! "
]" #
public 
string 
StreetNumberName &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string $
ApartmentRoomSuiteNumber .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
string 
> 
GradeLevels '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
List 
< 
SelectOptionModel %
>% &
GradeLevelOptions' 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
List 
< 
SelectOptionModel %
>% &
StateOptions' 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
public!! 

class!! $
EditSchoolModelValidator!! )
:!!* +(
EditSchoolModelValidatorBase!!, H
<!!H I
EditSchoolModel!!I X
>!!X Y
{"" 
}"" 
public$$ 

abstract$$ 
class$$ (
EditSchoolModelValidatorBase$$ 6
<$$6 7
T$$7 8
>$$8 9
:$$: ;
AbstractValidator$$< M
<$$M N
T$$N O
>$$O P
where$$Q V
T$$W X
:$$Y Z
EditSchoolModel$$[ j
{%% 
	protected&& (
EditSchoolModelValidatorBase&& .
(&&. /
)&&/ 0
{'' 	
RuleFor(( 
((( 
x(( 
=>(( 
x(( 
.(( 
Name(( 
)((  
.((  !
NotEmpty((! )
((() *
)((* +
;((+ ,
RuleFor)) 
()) 
x)) 
=>)) 
x)) 
.)) 
StreetNumberName)) +
)))+ ,
.)), -
NotEmpty))- 5
())5 6
)))6 7
;))7 8
RuleFor** 
(** 
x** 
=>** 
x** 
.** 
City** 
)**  
.**  !
NotEmpty**! )
(**) *
)*** +
;**+ ,
RuleFor++ 
(++ 
x++ 
=>++ 
x++ 
.++ 
State++  
)++  !
.++! "
NotEmpty++" *
(++* +
)+++ ,
;++, -
RuleFor,, 
(,, 
x,, 
=>,, 
x,, 
.,, 
ZipCode,, "
),," #
.,,# $
NotEmpty,,$ ,
(,,, -
),,- .
;,,. /
RuleFor-- 
(-- 
x-- 
=>-- 
x-- 
.-- 
GradeLevels-- &
)--& '
.--' (
Must--( ,
(--, -
x--- .
=>--/ 1
x--2 3
!=--4 6
null--7 ;
&&--< >
x--? @
.--@ A
Count--A F
>--G H
$num--I J
)--J K
.--K L
WithMessage--L W
(--W X
$str	--X �
)
--� �
;
--� �
}.. 	
}// 
}00 �
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\EducationOrganizationsIndexModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{		 
public

 

class

 ,
 EducationOrganizationsIndexModel

 1
:

2 3(
BaseOdsInstanceSettingsModel

4 P
{ 
public 
bool 
TpdmEnabled 
{  !
get" %
;% &
set' *
;* +
}, -
public &
EducationOrganizationsMode )
Mode* .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
public 

enum &
EducationOrganizationsMode *
{ "
LocalEducationAgencies 
, %
PostSecondaryInstitutions !
} 
} �
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\EducationOrganizations\EducationOrganizationValidationHelper.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2"
EducationOrganizations2 H
{		 
public

 

class

 1
%EducationOrganizationValidationHelper

 6
{ 
public 
static 
bool 2
&ProposedEducationOrganizationIdIsInUse A
(A B
intB E
idF H
,H I
IOdsApiFacadeJ W
	apiFacadeX a
)a b
{ 	
return 
	apiFacade 
. +
GetAllPostSecondaryInstitutions <
(< =
)= >
.> ?
Find? C
(C D
xD E
=>F H
xI J
.J K#
EducationOrganizationIdK b
==c e
idf h
)h i
!=j l
nullm q
||r t
	apiFacade 
. (
GetAllLocalEducationAgencies 9
(9 :
): ;
.; <
Find< @
(@ A
xA B
=>C E
xF G
.G H#
EducationOrganizationIdH _
==` b
idc e
)e f
!=g i
nullj n
||o q
	apiFacade 
. 
GetAllSchools *
(* +
)+ ,
., -
Find- 1
(1 2
x2 3
=>4 6
x7 8
.8 9#
EducationOrganizationId9 P
==Q S
idT V
)V W
!=X Z
null[ _
;_ `
} 	
} 
} �
dC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\FirstTimeSetupModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
;1 2
public 
class 
FirstTimeSetupModel  
{		 
public

 

bool

 0
$AreProductImprovementSettingsEnabled

 4
{

5 6
get

7 :
;

: ;
set

< ?
;

? @
}

A B
} �
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\AddVendorModel.cs
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
 
Web

 
.

  
Models

  &
.

& '

ViewModels

' 1
.

1 2
Global

2 8
{ 
public 

class 
AddVendorModel 
:  !
IAddVendorModel" 1
{ 
public 
string 
Company 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
NamespacePrefixes '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
ContactName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ContactEmailAddress )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
public 

class #
AddVendorModelValidator (
:) *
AbstractValidator+ <
<< =
AddVendorModel= K
>K L
{ 
public #
AddVendorModelValidator &
(& '
)' (
{ 	
RuleFor 
( 
m 
=> 
m 
. 
Company "
)" #
.# $
NotEmpty$ ,
(, -
)- .
;. /
RuleFor 
( 
m 
=> 
m 
. 
Company "
)" #
. 
Must 
( 
name 
=> 
! 
VendorExtensions /
./ 0&
IsSystemReservedVendorName0 J
(J K
nameK O
)O P
)P Q
. 
WithMessage 
( 
p 
=> !
$"" $
$str$ %
{% &
p& '
.' (
Company( /
}/ 0
$str0 u
"u v
)v w
;w x
RuleFor 
( 
m 
=> 
m 
. 
ContactName &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
;2 3
RuleFor 
( 
m 
=> 
m 
. 
ContactEmailAddress .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
EmailAddress; G
(G H
)H I
;I J
} 	
}   
}!! �

mC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\AdvancedSettingsModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
Global		2 8
{

 
public 

class !
AdvancedSettingsModel &
{ 
[ 	
Display	 
( 
Name 
= 
$str 9
)9 :
]: ;
public 
int '
BearerTokenTimeoutInMinutes .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
public 

class *
AdvancedSettingsModelValidator /
:0 1
AbstractValidator2 C
<C D!
AdvancedSettingsModelD Y
>Y Z
{ 
public *
AdvancedSettingsModelValidator -
(- .
). /
{ 	
RuleFor 
( 
m 
=> 
m 
. '
BearerTokenTimeoutInMinutes 6
)6 7
.7 8
GreaterThan8 C
(C D
$numD E
)E F
;F G
} 	
} 
} �
oC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\BaseGlobalSettingsModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
Global		2 8
{

 
public 

abstract 
class #
BaseGlobalSettingsModel 1
{ 
public 
List 
< 

TabDisplay 
< (
GlobalSettingsTabEnumeration ;
>; <
>< =)
GlobalSettingsTabEnumerations> [
{[ \
get] `
;` a
setb e
;e f
}g h
} 
} �
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\ClaimSetEditorModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
Global		2 8
{

 
public 

class 
ClaimSetEditorModel $
{ 
public 
IEnumerable 
< 
ClaimSet #
># $
	ClaimSets% .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} �
iC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\DeleteVendorModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Global2 8
{ 
public 

class 
DeleteVendorModel "
{		 
public

 
int

 
VendorId

 
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
( )
} 
} �
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\EditVendorModel.cs
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
 
Web

 
.

  
Models

  &
.

& '

ViewModels

' 1
.

1 2
Global

2 8
{ 
public 

class 
EditVendorModel  
:! "
IEditVendor# .
{ 
public 
int 
VendorId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Company 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
NamespacePrefixes '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
ContactName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ContactEmailAddress )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
public 

class $
EditVendorModelValidator )
:* +
AbstractValidator, =
<= >
EditVendorModel> M
>M N
{ 
public $
EditVendorModelValidator '
(' (
)( )
{ 	
RuleFor 
( 
m 
=> 
m 
. 
Company "
)" #
.# $
NotEmpty$ ,
(, -
)- .
;. /
RuleFor 
( 
m 
=> 
m 
. 
Company "
)" #
. 
Must 
( 
name 
=> 
! 
VendorExtensions /
./ 0&
IsSystemReservedVendorName0 J
(J K
nameK O
)O P
)P Q
. 
WithMessage 
( 
p 
=> !
$"" $
$str$ %
{% &
p& '
.' (
Company( /
}/ 0
$str0 u
"u v
)v w
;w x
RuleFor 
( 
m 
=> 
m 
. 
ContactName &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
;2 3
RuleFor 
( 
m 
=> 
m 
. 
ContactEmailAddress .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
EmailAddress; G
(G H
)H I
;I J
}   	
}!! 
}"" �	
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\GlobalSettingsModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Global2 8
{ 
public 

class 
GlobalSettingsModel $
:$ %#
BaseGlobalSettingsModel& =
{		 
public

 
VendorsListModel

 
VendorListModel

  /
{

0 1
get

2 5
;

5 6
set

7 :
;

: ;
}

< =
public !
AdvancedSettingsModel $!
AdvancedSettingsModel% :
{; <
get= @
;@ A
setB E
;E F
}G H
public 
ClaimSetEditorModel "
ClaimSetEditorModel# 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
UserIndexModel 
UserIndexModel ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} �	
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\UserIndexModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Global2 8
{		 
public

 

class

 
UserIndexModel

 
{ 
public 
IEnumerable 
< 
	UserModel $
>$ %
Users& +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
public 

class 
	UserModel 
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} �
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Global\VendorsListModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Global2 8
{		 
public

 

class

 
VendorsListModel

 !
{ 
public 
List 
< 
VendorOverviewModel '
>' (
Vendors) 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
VendorsListModel 
(  
)  !
{ 	
Vendors 
= 
new 
List 
< 
VendorOverviewModel 2
>2 3
(3 4
)4 5
;5 6
} 	
} 
} �
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Home\ErrorModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Home2 6
{ 
public 

class 

ErrorModel 
: 
	PageModel &
{ 
public 
string 
Message 
{ 
get  #
;# $
}% &
public 
string 

StackTrace  
{! "
get# &
;& '
}( )
public 
new 
HttpStatusCode !
?! "

StatusCode# -
{. /
get0 3
;3 4
}5 6
public 
bool  
IsStackTraceRelevant (
{) *
get+ .
;. /
}0 1
public 
bool 
AllowFeedback !
{" #
get$ '
;' (
}) *
public 

ErrorModel 
( 
	Exception #
	exception$ -
,- .
bool/ 3'
isProductImprovementEnabled4 O
)O P
{ 	

StackTrace 
= 
	exception "
." #

StackTrace# -
;- .
Message 
= 
	exception 
.  
Message  '
;' (
if 
( 
	exception 
is 
IAdminAppException /
adminAppException0 A
)A B
{ 

StatusCode 
= 
adminAppException .
.. /

StatusCode/ 9
;9 : 
IsStackTraceRelevant $
=% &
adminAppException' 8
.8 9 
IsStackTraceRelevant9 M
;M N
AllowFeedback 
= 
adminAppException  1
.1 2
AllowFeedback2 ?
;? @
}   
else!! 
{"" 

StatusCode## 
=## 
HttpStatusCode## +
.##+ ,
InternalServerError##, ?
;##? @ 
IsStackTraceRelevant$$ $
=$$% &
true$$' +
;$$+ ,
AllowFeedback%% 
=%% 
true%%  $
;%%$ %
}&& 
if(( 
((( 
!(( '
isProductImprovementEnabled(( ,
)((, -
{)) 
AllowFeedback** 
=** 
false**  %
;**% &
}++ 
},, 	
}-- 
}.. �
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Home\IndexModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
Home		2 6
{

 
public 

class 

IndexModel 
{ 
public 
bool 
SetupJustCompleted &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
List 
< !
HomeScreenEnumeration )
>) *
HomeScreenDisplays+ =
{> ?
get@ C
;C D
setE H
;H I
}J K
} 
} �
qC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Identity\ChangePasswordViewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Identity2 :
{		 
public

 

class

 #
ChangePasswordViewModel

 (
{ 
[ 	
Required	 
] 
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str *
)* +
]+ ,
public 
string 
OldPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* Y
,Y Z
MinimumLength[ h
=i j
$numk l
)l m
]m n
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str &
)& '
]' (
public 
string 
NewPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str .
). /
]/ 0
[ 	
Compare	 
( 
$str 
, 
ErrorMessage  ,
=- .
$str/ i
)i j
]j k
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} �
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Identity\LoginViewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Identity2 :
{		 
public

 

class

 
LoginViewModel

 
{ 
[ 	
Required	 
] 
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str "
)" #
]# $
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Display	 
( 
Name 
= 
$str &
)& '
]' (
public 
bool 

RememberMe 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool !
AllowUserRegistration )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} �
kC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\Identity\RegisterViewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
Identity2 :
{ 
public 

class 
RegisterViewModel "
:" #
IRegisterModel$ 2
{ 
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Display	 
( 
Name 
= 
$str "
)" #
]# $
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Display	 
( 
Name 
= 
$str *
)* +
]+ ,
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
public 

class &
RegisterViewModelValidator +
:, -
AbstractValidator. ?
<? @
RegisterViewModel@ Q
>Q R
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public   &
RegisterViewModelValidator   )
(  ) *%
AdminAppIdentityDbContext  * C
identity  D L
)  L M
{!! 	
	_identity"" 
="" 
identity""  
;""  !
RuleFor## 
(## 
m## 
=>## 
m## 
.## 
Email##  
)##  !
.##! "
NotEmpty##" *
(##* +
)##+ ,
.##, -
EmailAddress##- 9
(##9 :
)##: ;
.##; <
Must##< @
(##@ A
BeAUniqueEmail##A O
)##O P
.##P Q
WithMessage##Q \
(##\ ]
$str	##] �
)
##� �
;
##� �
RuleFor$$ 
($$ 
x$$ 
=>$$ 
x$$ 
.$$ 
Password$$ #
)$$# $
.$$$ %
NotEmpty$$% -
($$- .
)$$. /
.$$/ 0
Length$$0 6
($$6 7
$num$$7 8
,$$8 9
$num$$: =
)$$= >
;$$> ?
RuleFor%% 
(%% 
x%% 
=>%% 
x%% 
.%% 
ConfirmPassword%% *
)%%* +
.%%+ ,
NotEmpty%%, 4
(%%4 5
)%%5 6
.%%6 7
Equal%%7 <
(%%< =
x%%= >
=>%%? A
x%%B C
.%%C D
Password%%D L
)%%L M
.%%M N
WithMessage%%N Y
(%%Y Z
$str	%%Z �
)
%%� �
;
%%� �
}&& 	
private(( 
bool(( 
BeAUniqueEmail(( #
(((# $
string(($ *
newEmail((+ 3
)((3 4
{)) 	
return** 
	_identity** 
.** 
Users** "
.**" #
ToList**# )
(**) *
)*** +
.**+ ,
All**, /
(**/ 0
x**0 1
=>**2 4
x**5 6
.**6 7
Email**7 <
!=**= ?
newEmail**@ H
)**H I
;**I J
}++ 	
},, 
}-- �
nC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\LocalEducationAgencyViewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
{ 
public 

class )
LocalEducationAgencyViewModel .
{ 
public 
List 
< 
School 
> 
Schools #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
	PagedList 
<  
LocalEducationAgency -
>- ."
LocalEducationAgencies/ E
{F G
getH K
;K L
setM P
;P Q
}R S
public 
bool (
ShouldAllowMultipleDistricts 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
AddSchoolModel 
AddSchoolModel ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public (
AddLocalEducationAgencyModel +(
AddLocalEducationAgencyModel, H
{I J
getK N
;N O
setP S
;S T
}U V
} 
} �
aC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\LogSettingsModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
{		 
public

 

class

 
LogSettingsModel

 !
{ 
public 
LogLevel 
LogLevel  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} �
�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\OdsInstanceSettings\BaseOdsInstanceSettingsModel.cs
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
 
Web

 
.

  
Models

  &
.

& '

ViewModels

' 1
.

1 2
OdsInstanceSettings

2 E
{ 
public 

abstract 
class (
BaseOdsInstanceSettingsModel 6
{ 
public 
InstanceContext 
OdsInstance *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
List 
< 

TabDisplay 
< -
!OdsInstanceSettingsTabEnumeration @
>@ A
>A B.
"OdsInstanceSettingsTabEnumerationsC e
{f g
geth k
;k l
setm p
;p q
}r s
} 
} �
}C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\OdsInstanceSettings\OdsInstanceSettingsModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
OdsInstanceSettings2 E
{ 
public 

class $
OdsInstanceSettingsModel )
:* +(
BaseOdsInstanceSettingsModel, H
{		 
public

 
LogSettingsModel

 
LogSettingsModel

  0
{

1 2
get

3 6
;

6 7
set

8 ;
;

; <
}

= >
} 
} �

�C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\OdsInstanceSettings\OdsVersionMetadataViewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
OdsInstanceSettings2 E
{ 
public 

class '
OdsVersionMetadataViewModel ,
{		 
public

 
string

 
OdsApiVersion
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
public 
bool 
HasOdsApiVersion $
=>% '
!( )
string) /
./ 0
IsNullOrEmpty0 =
(= >
OdsApiVersion> K
)K L
;L M
public 
string 
TpdmVersion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
HasTpdmVersion "
=># %
!& '
string' -
.- .
IsNullOrEmpty. ;
(; <
TpdmVersion< G
)G H
;H I
} 
} �
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\OdsInstances\IndexModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
OdsInstances		2 >
{

 
public 

class 

IndexModel 
{ 
public 
AdminAppUserContext "
UserContext# .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
List 
< 
OdsInstanceModel $
>$ %
OdsInstances& 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
public 

class 
OdsInstanceModel !
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
DatabaseName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string !
SchoolYearDescription +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} �

rC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\PostSecondaryInstitutionViewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
{ 
public 

class -
!PostSecondaryInstitutionViewModel 2
{ 
public 
List 
< 
	PsiSchool 
> 
Schools &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
	PagedList 
< $
PostSecondaryInstitution 1
>1 2%
PostSecondaryInstitutions3 L
{M N
getO R
;R S
setT W
;W X
}Y Z
public 
AddPsiSchoolModel  
AddPsiSchoolModel! 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public ,
 AddPostSecondaryInstitutionModel /,
 AddPostSecondaryInstitutionModel0 P
{Q R
getS V
;V W
setX [
;[ \
}] ^
} 
} �
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ProductImprovementModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
{		 
public

 

class

 #
ProductImprovementModel

 (
{ 
public 
bool $
EnableProductImprovement ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
[ 	
Display	 
( 
Name 
= 
$str 1
)1 2
]2 3
public 
string !
ProductRegistrationId +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} �
]C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\ProfileModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
{ 
public 

class 
ProfileModel 
{		 
public

 
int

 
	ProfileId

 
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
public 
string 
ProfileName !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} �
pC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\SchoolYears\EditSchoolYearModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
SchoolYears2 =
{ 
public 

class 
EditSchoolYearModel $
{ 
public		 
string		 
Warning		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
string

 
InstanceName
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
public 
short 
? 

SchoolYear  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
IReadOnlyList 
< 
SelectListItem +
>+ ,
SchoolYears- 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
public 

class (
EditSchoolYearModelValidator -
:. /
AbstractValidator0 A
<A B
EditSchoolYearModelB U
>U V
{ 
public (
EditSchoolYearModelValidator +
(+ ,
), -
=> 
RuleFor 
( 
m 
=> 
m 
. 

SchoolYear (
)( )
.) *
NotEmpty* 2
(2 3
)3 4
;4 5
} 
} �"
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\User\AddUserLoginModel .cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
User2 6
{ 
public 

class 
AddUserLoginModel "
:" #
IAddUserLoginModel$ 6
{ 
public 
string 
LoginProvider #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
ProviderKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ProviderDisplayName )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
	UserEmail 
{  !
get" %
;% &
set' *
;* +
}, -
} 
public 

class &
AddUserLoginModelValidator +
:, -
AbstractValidator. ?
<? @
AddUserLoginModel@ Q
>Q R
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public &
AddUserLoginModelValidator )
() *%
AdminAppIdentityDbContext* C
identityD L
)L M
{ 	
	_identity 
= 
identity  
;  !
RuleFor 
( 
m 
=> 
m 
. 
	UserEmail $
)$ %
.% &
NotEmpty& .
(. /
)/ 0
.0 1
EmailAddress1 =
(= >
)> ?
;? @
RuleFor 
( 
x 
=> 
x 
. 
LoginProvider (
)( )
.) *
NotEmpty* 2
(2 3
)3 4
;4 5
RuleFor 
( 
x 
=> 
x 
. 
ProviderKey &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
;2 3
RuleFor 
( 
m 
=> 
m 
) 
.   
Must   
(   
m   
=>   
NotExistInTheSystem   .
(  . /
m  / 0
.  0 1
LoginProvider  1 >
,  > ?
m  @ A
.  A B
ProviderKey  B M
)  M N
)  N O
.!! 
When!! 
(!! 
x!! 
=>!! 
x!! 
.!! 
LoginProvider!! *
!=!!+ -
null!!. 2
&&!!3 5
x!!6 7
.!!7 8
ProviderKey!!8 C
!=!!D F
null!!G K
)!!K L
."" 
WithMessage"" 
("" 
$str"" p
)""p q
;""q r
}## 	
private%% 
bool%% 
BeAUniqueEmail%% #
(%%# $
string%%$ *
newEmail%%+ 3
)%%3 4
{&& 	
return'' 
	_identity'' 
.'' 
Users'' "
.''" #
ToList''# )
('') *
)''* +
.''+ ,
All'', /
(''/ 0
x''0 1
=>''2 4
x''5 6
.''6 7
Email''7 <
!=''= ?
newEmail''@ H
)''H I
;''I J
}(( 	
private** 
bool** 
NotExistInTheSystem** (
(**( )
string**) /
loginProvider**0 =
,**= >
string**? E
providerKey**F Q
)**Q R
{++ 	
return,, 
!,, 
	_identity,, 
.,, 

UserLogins,, (
.,,( )
Any,,) ,
(,,, -
x,,- .
=>,,/ 1
x-- 
.-- 
LoginProvider-- 
==--  "
loginProvider--# 0
&&--1 3
x--4 5
.--5 6
ProviderKey--6 A
==--B D
providerKey--E P
)--P Q
;--Q R
}.. 	
}// 
}00 �!
bC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\User\AddUserModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
User2 6
{ 
public 

class 
AddUserModel 
: 
IAddUserModel +
{ 
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Display	 
( 
Name 
= 
$str "
)" #
]# $
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Display	 
( 
Name 
= 
$str *
)* +
]+ ,
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
List 
< 

TabDisplay 
< (
GlobalSettingsTabEnumeration ;
>; <
>< =)
GlobalSettingsTabEnumerations> [
{\ ]
get^ a
;a b
setc f
;f g
}h i
} 
public   

class   !
AddUserModelValidator   &
:  ' (
AbstractValidator  ) :
<  : ;
AddUserModel  ; G
>  G H
{!! 
private"" 
readonly"" %
AdminAppIdentityDbContext"" 2
	_identity""3 <
;""< =
public$$ !
AddUserModelValidator$$ $
($$$ %%
AdminAppIdentityDbContext$$% >
identity$$? G
)$$G H
{%% 	
	_identity&& 
=&& 
identity&&  
;&&  !
RuleFor'' 
('' 
m'' 
=>'' 
m'' 
.'' 
Email''  
)''  !
.''! "
NotEmpty''" *
(''* +
)''+ ,
.'', -
EmailAddress''- 9
(''9 :
)'': ;
.''; <
Must''< @
(''@ A
BeAUniqueEmail''A O
)''O P
.''P Q
WithMessage''Q \
(''\ ]
$str	''] �
)
''� �
;
''� �
RuleFor(( 
((( 
x(( 
=>(( 
x(( 
.(( 
Password(( #
)((# $
.(($ %
NotEmpty((% -
(((- .
)((. /
.((/ 0
Length((0 6
(((6 7
$num((7 8
,((8 9
$num((: =
)((= >
;((> ?
RuleFor)) 
()) 
x)) 
=>)) 
x)) 
.)) 
ConfirmPassword)) *
)))* +
.))+ ,
NotEmpty)), 4
())4 5
)))5 6
.))6 7
Equal))7 <
())< =
x))= >
=>))? A
x))B C
.))C D
Password))D L
)))L M
.))M N
WithMessage))N Y
())Y Z
$str	))Z �
)
))� �
;
))� �
}** 	
private,, 
bool,, 
BeAUniqueEmail,, #
(,,# $
string,,$ *
newEmail,,+ 3
),,3 4
{-- 	
return.. 
	_identity.. 
... 
Users.. "
..." #
ToList..# )
(..) *
)..* +
...+ ,
All.., /
(../ 0
x..0 1
=>..2 4
x..5 6
...6 7
Email..7 <
!=..= ?
newEmail..@ H
)..H I
;..I J
}// 	
}00 
}11 �
eC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\User\DeleteUserModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
User2 6
{ 
public 

class 
DeleteUserModel  
:  !
IDeleteUserModel" 2
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
public 

class $
DeleteUserModelValidator )
:* +
AbstractValidator, =
<= >
DeleteUserModel> M
>M N
{ 
private 
readonly 
AdminAppUserContext ,
_userContext- 9
;9 :
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public $
DeleteUserModelValidator '
(' (
AdminAppUserContext( ;
userContext< G
,G H%
AdminAppIdentityDbContextI b
identityc k
)k l
{ 	
_userContext 
= 
userContext &
;& '
	_identity 
= 
identity  
;  !
RuleFor!! 
(!! 
m!! 
=>!! 
m!! 
.!! 
UserId!! !
)!!! "
."" 
NotEmpty"" 
("" 
)"" 
.## 
Must## 
(## 
BeAnExistingUser## &
)##& '
.##' (
WithMessage##( 3
(##3 4
$str##4 w
)##w x
.$$ 
Must$$ 
($$ 
NotBeCurrentUser$$ &
)$$& '
.$$' (
WithMessage$$( 3
($$3 4
$str$$4 c
)$$c d
;$$d e
RuleFor%% 
(%% 
m%% 
=>%% 
m%% 
.%% 
Email%%  
)%%  !
.%%! "
NotEmpty%%" *
(%%* +
)%%+ ,
;%%, -
}&& 	
private(( 
bool(( 
NotBeCurrentUser(( %
(((% &
string((& ,
userId((- 3
)((3 4
{)) 	
return** 
_userContext** 
.**  
User**  $
.**$ %
Id**% '
!=**( *
userId**+ 1
;**1 2
}++ 	
private-- 
bool-- 
BeAnExistingUser-- %
(--% &
string--& ,
userId--- 3
)--3 4
{.. 	
return// 
	_identity// 
.// 
Users// "
.//" #
Any//# &
(//& '
x//' (
=>//) +
x//, -
.//- .
Id//. 0
==//1 3
userId//4 :
)//: ;
;//; <
}00 	
}11 
}22 �
}C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\User\EditOdsInstanceRegistrationForUserModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
User2 6
{ 
public 

class '
EditOdsInstanceForUserModel ,
:, -(
IEditOdsInstanceForUserModel. J
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Display	 
( 
Name 
= 
$str 0
)0 1
]1 2
public 
List 
<  
OdsInstanceSelection (
>( )
OdsInstances* 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
List 
< 

TabDisplay 
< (
GlobalSettingsTabEnumeration ;
>; <
>< =)
GlobalSettingsTabEnumerations> [
{\ ]
get^ a
;a b
setc f
;f g
}h i
public '
EditOdsInstanceForUserModel *
(* +
)+ ,
{ 	
OdsInstances 
= 
new 
List #
<# $ 
OdsInstanceSelection$ 8
>8 9
(9 :
): ;
;; <
} 	
} 
public!! 

class!! 0
$EditOdsInstanceForUserModelValidator!! 5
:!!6 7
AbstractValidator!!8 I
<!!I J'
EditOdsInstanceForUserModel!!J e
>!!e f
{"" 
private## 
readonly## %
AdminAppIdentityDbContext## 2
	_identity##3 <
;##< =
public%% 0
$EditOdsInstanceForUserModelValidator%% 3
(%%3 4
AdminAppDbContext%%4 E
database%%F N
,%%N O%
AdminAppIdentityDbContext%%P i
identity%%j r
)%%r s
{&& 	
	_identity'' 
='' 
identity''  
;''  !
RuleFor)) 
()) 
m)) 
=>)) 
m)) 
.)) 
UserId)) !
)))! "
.))" #
NotEmpty))# +
())+ ,
))), -
.))- .
Must)). 2
())2 3
BeAnExistingUser))3 C
)))C D
.))D E
WithMessage))E P
())P Q
$str	))Q �
)
))� �
;
))� �
RuleFor** 
(** 
m** 
=>** 
m** 
.** 
Email**  
)**  !
.**! "
NotEmpty**" *
(*** +
)**+ ,
;**, -
RuleFor++ 
(++ 
m++ 
=>++ 
m++ 
.++ 
OdsInstances++ '
)++' (
.++( )
NotEmpty++) 1
(++1 2
)++2 3
;++3 4
},, 	
private.. 
bool.. 
BeAnExistingUser.. %
(..% &
string..& ,
userId..- 3
)..3 4
{// 	
return00 
	_identity00 
.00 
Users00 "
.00" #
Any00# &
(00& '
x00' (
=>00) +
x00, -
.00- .
Id00. 0
==001 3
userId004 :
)00: ;
;00; <
}11 	
}22 
}33 �
cC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\User\EditUserModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
User2 6
{ 
public 

class 
EditUserModel 
: 
IEditUserModel -
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
List 
< 

TabDisplay 
< (
GlobalSettingsTabEnumeration ;
>; <
>< =)
GlobalSettingsTabEnumerations> [
{\ ]
get^ a
;a b
setc f
;f g
}h i
} 
public 

class "
EditUserModelValidator '
:( )
AbstractValidator* ;
<; <
EditUserModel< I
>I J
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public "
EditUserModelValidator %
(% &%
AdminAppIdentityDbContext& ?
identity@ H
)H I
{ 	
	_identity   
=   
identity    
;    !
RuleFor"" 
("" 
m"" 
=>"" 
m"" 
."" 
Email""  
)""  !
.## 
NotEmpty## 
(## 
)## 
.$$ 
EmailAddress$$ 
($$ 
)$$ 
.$$  
Must$$  $
($$$ %
BeAUniqueEmail$$% 3
)$$3 4
.%% 
WithMessage%% 
(%% 
$str%% ]
)%%] ^
.&& 
When&& 
(&& 
EmailIsChanged&& $
)&&$ %
;&&% &
}'' 	
private)) 
bool)) 
EmailIsChanged)) #
())# $
EditUserModel))$ 1
model))2 7
)))7 8
{** 	
return++ 
	_identity++ 
.++ 
Users++ "
.++" #
Single++# )
(++) *
x++* +
=>++, .
x++/ 0
.++0 1
Id++1 3
==++4 6
model++7 <
.++< =
UserId++= C
)++C D
.++D E
Email++E J
!=++K M
model++N S
.++S T
Email++T Y
;++Y Z
},, 	
private.. 
bool.. 
BeAUniqueEmail.. #
(..# $
string..$ *
newEmail..+ 3
)..3 4
{// 	
return00 
	_identity00 
.00 
Users00 "
.00" #
ToList00# )
(00) *
)00* +
.00+ ,
All00, /
(00/ 0
x000 1
=>002 4
x005 6
.006 7
Email007 <
!=00= ?
newEmail00@ H
)00H I
;00I J
}11 	
}22 
}33 �%
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\User\EditUserRoleModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
.1 2
User2 6
{ 
public 

class 
EditUserRoleModel "
:# $
IEditUserRoleModel% 7
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
RoleId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
List 
< 

TabDisplay 
< (
GlobalSettingsTabEnumeration ;
>; <
>< =)
GlobalSettingsTabEnumerations> [
{\ ]
get^ a
;a b
setc f
;f g
}h i
} 
public 

class &
EditUserRoleModelValidator +
:, -
AbstractValidator. ?
<? @
EditUserRoleModel@ Q
>Q R
{ 
private 
readonly 
AdminAppUserContext ,
_userContext- 9
;9 :
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
public   &
EditUserRoleModelValidator   )
(  ) *
AdminAppUserContext  * =
userContext  > I
,  I J%
AdminAppIdentityDbContext  K d
identity  e m
)  m n
{!! 	
_userContext"" 
="" 
userContext"" &
;""& '
	_identity## 
=## 
identity##  
;##  !
RuleFor%% 
(%% 
m%% 
=>%% 
m%% 
.%% 
UserId%% !
)%%! "
.%%" #
NotEmpty%%# +
(%%+ ,
)%%, -
.&& 
Must&& 
(&& 
BeAnExistingUser&& &
)&&& '
.&&' (
WithMessage&&( 3
(&&3 4
$str&&4 u
)&&u v
.'' 
Must'' 
('' 
NotBeCurrentUser'' &
)''& '
.''' (
WithMessage''( 3
(''3 4
$str	''4 �
)
''� �
;
''� �
RuleFor(( 
((( 
m(( 
=>(( 
m(( 
.(( 
RoleId(( !
)((! "
.((" #
NotEmpty((# +
(((+ ,
)((, -
.((- .
Must((. 2
(((2 3
BeAnExistingRole((3 C
)((C D
.((D E
WithMessage((E P
(((P Q
$str	((Q �
)
((� �
;
((� �
RuleFor)) 
()) 
m)) 
=>)) 
m)) 
.)) 
Email))  
)))  !
.))! "
NotEmpty))" *
())* +
)))+ ,
;)), -
}** 	
private,, 
bool,, 
NotBeCurrentUser,, %
(,,% &
string,,& ,
userId,,- 3
),,3 4
{-- 	
if.. 
(.. 
_userContext.. 
... 
User..  
!=..! #
null..$ (
)..( )
return// 
!// 
_userContext// $
.//$ %
User//% )
.//) *
Id//* ,
.//, -
Equals//- 3
(//3 4
userId//4 :
)//: ;
;//; <
return00 
true00 
;00 
}11 	
private33 
bool33 
BeAnExistingUser33 %
(33% &
string33& ,
userId33- 3
)333 4
{44 	
return55 
	_identity55 
.55 
Users55 "
.55" #
Any55# &
(55& '
x55' (
=>55) +
x55, -
.55- .
Id55. 0
==551 3
userId554 :
)55: ;
;55; <
}66 	
private88 
bool88 
BeAnExistingRole88 %
(88% &
string88& ,
roleId88- 3
)883 4
{99 	
return:: 
	_identity:: 
.:: 
Roles:: "
.::" #
Any::# &
(::& '
x::' (
=>::) +
x::, -
.::- .
Id::. 0
==::1 3
roleId::4 :
)::: ;
;::; <
};; 	
}<< 
}== �
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\User\GetUserLoginModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
.		1 2
User		2 6
{

 
public 

class 
GetUserLoginModel "
:" #
IGetUserLoginModel$ 6
{ 
public 
string 
LoginProvider #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
ProviderKey !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
public 

class &
GetUserLoginModelValidator +
:, -
AbstractValidator. ?
<? @
GetUserLoginModel@ Q
>Q R
{ 
public &
GetUserLoginModelValidator )
() *
)* +
{ 	
RuleFor 
( 
x 
=> 
x 
. 
LoginProvider (
)( )
.) *
NotEmpty* 2
(2 3
)3 4
;4 5
RuleFor 
( 
x 
=> 
x 
. 
ProviderKey &
)& '
.' (
NotEmpty( 0
(0 1
)1 2
;2 3
} 	
} 
} �

hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\VendorApplicationsModel.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
.		  
Models		  &
.		& '

ViewModels		' 1
{

 
public 

class (
VendorApplicationsIndexModel -
{ 
public 
	PagedList 
< #
VendorApplicationsModel 0
>0 1
Vendors2 9
{: ;
get< ?
;? @
setA D
;D E
}F G
} 
public 

class #
VendorApplicationsModel (
{ 
public 
int 
VendorId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 

VendorName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
List 
< 
ApplicationModel $
>$ %
Applications& 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} �
dC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Models\ViewModels\VendorOverviewModel.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
Models  &
.& '

ViewModels' 1
{ 
public 

class 
VendorOverviewModel $
{		 
public

 
int

 
VendorId

 
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
string 

VendorName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
NamespacePrefixes '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} �
`C:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\OpenIdConnectUserMustExistHandler.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
{ 
public 

class -
!OpenIdConnectUserMustExistHandler 2
:3 4 
AuthorizationHandler5 I
<I J$
UserMustExistRequirementJ b
>b c
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
private 
readonly 
IdentitySettings )
_identitySettings* ;
;; <
public -
!OpenIdConnectUserMustExistHandler 0
(0 1%
AdminAppIdentityDbContext1 J
identityK S
,S T
IOptionsU ]
<] ^
IdentitySettings^ n
>n o
identitySettings	p �
)
� �
{ 	
	_identity 
= 
identity  
;  !
_identitySettings 
= 
identitySettings  0
.0 1
Value1 6
;6 7
} 	
	protected 
override 
Task "
HandleRequirementAsync  6
(6 7'
AuthorizationHandlerContext7 R
contextS Z
,Z [$
UserMustExistRequirement\ t
requirement	u �
)
� �
{ 	
try 
{   
var!! 
userId!! 
=!! 
context!! $
.!!$ %
User!!% )
.!!) *
FindFirstValue!!* 8
(!!8 9

ClaimTypes!!9 C
.!!C D
NameIdentifier!!D R
)!!R S
;!!S T
if## 
(## 
userId## 
!=## 
null## "
)##" #
{$$ 
var%% 
	userLogin%% !
=%%" #
	_identity%%$ -
.%%- .

UserLogins%%. 8
.%%8 9
SingleOrDefault%%9 H
(%%H I
x&& 
=>&& 
x&& 
.&& 
LoginProvider&& ,
==&&- /
_identitySettings&&0 A
.&&A B
OpenIdSettings&&B P
.&&P Q
LoginProvider&&Q ^
&&&&_ a
x'' 
.'' 
ProviderKey'' *
==''+ -
userId''. 4
)''4 5
;''5 6
if)) 
()) 
	userLogin)) !
!=))" $
null))% )
)))) *
{** 
context++ 
.++  
Succeed++  '
(++' (
requirement++( 3
)++3 4
;++4 5
},, 
else-- 
{.. 
throw// 
new// !
	Exception//" +
(//+ ,
$str//, q
)//q r
;//r s
}00 
}11 
}22 
catch33 
(33 
	Exception33 
	exception33 &
)33& '
{44 
context55 
.55 
Fail55 
(55 
)55 
;55 
throw66 
new66 
AdminAppException66 +
(66+ ,
$"66, .
$str	66. �
{
66� �
	exception
66� �
.
66� �
Message
66� �
}
66� �
"
66� �
,
66� �
	exception
66� �
)
66� �
;
66� �
}77 
return99 
Task99 
.99 
CompletedTask99 %
;99% &
}:: 	
};; 
}<< �

FC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Program.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 
Web		 
{

 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ��
FC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\Startup.cs
	namespace00 	
EdFi00
 
.00 
Ods00 
.00 
AdminApp00 
.00 
Web00 
{11 
public22 

class22 
Startup22 
{33 
public44 
Startup44 
(44 
IConfiguration44 %
configuration44& 3
)443 4
{55 	
Configuration66 
=66 
configuration66 )
;66) *
}77 	
public99 
IConfiguration99 
Configuration99 +
{99, -
get99. 1
;991 2
}993 4
public<< 
void<< 
ConfigureServices<< %
(<<% &
IServiceCollection<<& 8
services<<9 A
)<<A B
{== 	
var>> 
executingAssembly>> !
=>>" #
Assembly>>$ ,
.>>, - 
GetExecutingAssembly>>- A
(>>A B
)>>B C
;>>C D
var@@ 
databaseEngine@@ 
=@@  
Configuration@@! .
[@@. /
$str@@/ K
]@@K L
;@@L M
DbConfigurationAA 
.AA 
SetConfigurationAA ,
(AA, -
newAA- 0)
DatabaseEngineDbConfigurationAA1 N
(AAN O
CommonAAO U
.AAU V
ConfigurationAAV c
.AAc d
DatabaseEngineAAd r
.AAr s
TryParseEngine	AAs �
(
AA� �
databaseEngine
AA� �
)
AA� �
)
AA� �
)
AA� �
;
AA� �
varCC 
identitySettingsCC  
=CC! "
newCC# &
IdentitySettingsCC' 7
(CC7 8
)CC8 9
;CC9 :
ConfigurationDD 
.DD 

GetSectionDD $
(DD$ %
$strDD% 7
)DD7 8
.DD8 9
BindDD9 =
(DD= >
identitySettingsDD> N
)DDN O
;DDO P
servicesFF 
.FF 
AddDbContextFF !
<FF! "
AdminAppDbContextFF" 3
>FF3 4
(FF4 5%
ConfigureForAdminDatabaseFF5 N
)FFN O
;FFO P
servicesGG 
.GG 
AddDbContextGG !
<GG! "%
AdminAppIdentityDbContextGG" ;
>GG; <
(GG< =%
ConfigureForAdminDatabaseGG= V
)GGV W
;GGW X
servicesHH 
.HH 
AddDbContextHH !
<HH! "/
#AdminAppDataProtectionKeysDbContextHH" E
>HHE F
(HHF G%
ConfigureForAdminDatabaseHHG `
)HH` a
;HHa b
ifJJ 
(JJ 
identitySettingsJJ 
.JJ  
TypeJJ  $
==JJ% '%
IdentitySettingsConstantsJJ( A
.JJA B'
EntityFrameworkIdentityTypeJJB ]
)JJ] ^/
#ConfigureForEntityFrameworkIdentityKK 3
(KK3 4
servicesKK4 <
)KK< =
;KK= >
elseLL 
ifLL 
(LL 
identitySettingsLL %
.LL% &
TypeLL& *
==LL+ -%
IdentitySettingsConstantsLL. G
.LLG H
OpenIdIdentityTypeLLH Z
)LLZ [-
!ConfigureForOpenIdConnectIdentityMM 1
(MM1 2
servicesMM2 :
,MM: ;
identitySettingsMM< L
)MML M
;MMM N
elseNN 
throwOO 
newOO !
NotSupportedExceptionOO /
(OO/ 0
$"PP 
$strPP ,
{PP, -
identitySettingsPP- =
.PP= >
TypePP> B
}PPB C
$str	PPC �
"
PP� �
)
PP� �
;
PP� �
servicesRR 
.RR #
AddControllersWithViewsRR ,
(RR, -
optionsRR- 4
=>RR5 7
{SS 
optionsTT 
.TT  
FiltersTT  '
.TT' (
AddTT( +
(TT+ ,
newTT, /
AuthorizeFilterTT0 ?
(TT? @
)TT@ A
)TTA B
;TTB C
optionsUU 
.UU  
FiltersUU  '
.UU' (
AddUU( +
(UU+ ,
newUU, /
AuthorizeFilterUU0 ?
(UU? @
$strUU@ U
)UUU V
)UUV W
;UUW X
optionsVV 
.VV  
FiltersVV  '
.VV' (
AddVV( +
<VV+ ,1
%AutoValidateAntiforgeryTokenAttributeVV, Q
>VVQ R
(VVR S
)VVS T
;VVT U
optionsWW 
.WW  
FiltersWW  '
.WW' (
AddWW( +
<WW+ , 
JsonValidationFilterWW, @
>WW@ A
(WWA B
)WWB C
;WWC D
optionsXX 
.XX  
FiltersXX  '
.XX' (
AddXX( +
<XX+ ,
SetupRequiredFilterXX, ?
>XX? @
(XX@ A
)XXA B
;XXB C
optionsYY 
.YY  
FiltersYY  '
.YY' (
AddYY( +
<YY+ ,!
InstanceContextFilterYY, A
>YYA B
(YYB C
)YYC D
;YYD E
}ZZ 
)ZZ 
.[[ 
AddFluentValidation[[ (
([[( )
opt\\ 
=>\\ 
{]] 
opt^^ 
.^^  *
RegisterValidatorsFromAssembly^^  >
(^^> ?
executingAssembly^^? P
)^^P Q
;^^Q R
opt`` 
.``  
ValidatorOptions``  0
.``0 1
DisplayNameResolver``1 D
=``E F
(``G H
type``H L
,``L M

memberInfo``N X
,``X Y

expression``Z d
)``d e
=>aa  "

memberInfoaa# -
?aa- .
.bb$ %
GetCustomAttributebb% 7
<bb7 8
Systembb8 >
.bb> ?
ComponentModelbb? M
.bbM N
DataAnnotationsbbN ]
.bb] ^
DisplayAttributebb^ n
>bbn o
(bbo p
)bbp q
?bbq r
.bbr s
GetNamebbs z
(bbz {
)bb{ |
;bb| }
}cc 
)cc 
;cc 
servicesee 
.ee 
AddWebOptimizeree $
(ee$ %
pipelineff 
=>ff 
{gg 
varhh 
minifyJsSettingshh (
=hh) *
newhh+ .
CodeSettingshh/ ;
{ii 
LocalRenamingjj %
=jj& '
LocalRenamingjj( 5
.jj5 6
	CrunchAlljj6 ?
,jj? @

MinifyCodekk "
=kk# $
truekk% )
}ll 
;ll 
varnn 
minifyCssSettingsnn )
=nn* +
newnn, /
CssSettingsnn0 ;
{oo 
MinifyExpressionspp )
=pp* +
truepp, 0
}qq 
;qq 
pipeliness 
.ss 
AddCssBundless )
(ss) *
$strss* R
,ssR S
minifyCssSettingsssT e
,sse f
$str	ssg �
)
ss� �
;
ss� �
pipelinett 
.tt 
AddCssBundlett )
(tt) *
$strtt* A
,ttA B
minifyCssSettingsttC T
,ttT U
$strttV m
)ttm n
;ttn o
pipelineuu 
.uu 
AddJavaScriptBundleuu 0
(uu0 1
$struu1 X
,uuX Y
minifyJsSettingsuuZ j
,uuj k
$str	uul �
)
uu� �
;
uu� �
pipelinevv 
.vv 
AddJavaScriptBundlevv 0
(vv0 1
$strvv1 L
,vvL M
minifyJsSettingsvvN ^
,vv^ _
$strvv` }
)vv} ~
;vv~ 
pipelineww 
.ww 
AddJavaScriptBundleww 0
(ww0 1
$strww1 G
,wwG H
minifyJsSettingswwI Y
,wwY Z
$strww[ m
,wwm n
$str	wwo �
,
ww� �
$str
ww� �
)
ww� �
;
ww� �
pipelinexx 
.xx 
AddJavaScriptBundlexx 0
(xx0 1
$strxx1 K
,xxK L
minifyJsSettingsxxM ]
,xx] ^
$strxx_ |
)xx| }
;xx} ~
pipelineyy 
.yy 
AddJavaScriptBundleyy 0
(yy0 1
$stryy1 O
,yyO P
minifyJsSettingsyyQ a
,yya b
$stryyc |
)yy| }
;yy} ~
}zz 
)zz 
;zz 
services|| 
.|| 
AddDataProtection|| &
(||& '
)||' (
.||( )"
PersistKeysToDbContext||) ?
<||? @/
#AdminAppDataProtectionKeysDbContext||@ c
>||c d
(||d e
)||e f
;||f g
services~~ 
.~~ 
AddAutoMapper~~ "
(~~" #
executingAssembly~~# 4
,~~4 5
typeof~~6 <
(~~< =)
AdminManagementMappingProfile~~= Z
)~~Z [
.~~[ \
Assembly~~\ d
)~~d e
;~~e f
services
�� 
.
�� 
	Configure
�� 
<
�� 
AppSettings
�� *
>
��* +
(
��+ ,
Configuration
��, 9
.
��9 :

GetSection
��: D
(
��D E
$str
��E R
)
��R S
)
��S T
;
��T U
services
�� 
.
�� 
	Configure
�� 
<
�� 
IdentitySettings
�� /
>
��/ 0
(
��0 1
Configuration
��1 >
.
��> ?

GetSection
��? I
(
��I J
$str
��J \
)
��\ ]
)
��] ^
;
��^ _
services
�� 
.
�� 
	Configure
�� 
<
�� 
ConnectionStrings
�� 0
>
��0 1
(
��1 2
Configuration
��2 ?
.
��? @

GetSection
��@ J
(
��J K
$str
��K ^
)
��^ _
)
��_ `
;
��` a
services
�� 
.
�� 

AddSignalR
�� 
(
��  
)
��  !
;
��! "
services
�� 
.
�� 
AddHttpClient
�� "
(
��" #
)
��# $
;
��$ %
var
�� 
appSettings
�� 
=
�� 
new
�� !
AppSettings
��" -
(
��- .
)
��. /
;
��/ 0
Configuration
�� 
.
�� 

GetSection
�� $
(
��$ %
$str
��% 2
)
��2 3
.
��3 4
Bind
��4 8
(
��8 9
appSettings
��9 D
)
��D E
;
��E F&
ConfigurationAppSettings
�� $
=
��% &
appSettings
��' 2
;
��2 3
var
�� 
connectionStrings
�� !
=
��" #
new
��$ '
ConnectionStrings
��( 9
(
��9 :
)
��: ;
;
��; <
Configuration
�� 
.
�� 

GetSection
�� $
(
��$ %
$str
��% 8
)
��8 9
.
��9 :
Bind
��: >
(
��> ?
connectionStrings
��? P
)
��P Q
;
��Q R,
ConfigurationConnectionStrings
�� *
=
��+ ,
connectionStrings
��- >
;
��> ?
var
�� 

appStartup
�� 
=
�� 
appSettings
�� (
.
��( )

AppStartup
��) 3
;
��3 4
if
�� 
(
�� 

appStartup
�� 
==
�� 
$str
�� &
)
��& '
new
�� 
OnPremInstaller
�� #
(
��# $
)
��$ %
.
��% &
Install
��& -
(
��- .
services
��. 6
,
��6 7
appSettings
��8 C
)
��C D
;
��D E
services
�� 
.
�� 
AddHealthCheck
�� #
(
��# $
Configuration
��$ 1
.
��1 2!
GetConnectionString
��2 E
(
��E F
$str
��F M
)
��M N
,
��N O
IsSqlServer
��P [
(
��[ \
databaseEngine
��\ j
)
��j k
)
��k l
;
��l m
}
�� 	
private
�� 
void
�� 1
#ConfigureForEntityFrameworkIdentity
�� 8
(
��8 9 
IServiceCollection
��9 K
services
��L T
)
��T U
{
�� 	
services
�� 
.
�� 
AddIdentity
��  
<
��  !
AdminAppUser
��! -
,
��- .
IdentityRole
��/ ;
>
��; <
(
��< =
)
��= >
.
�� &
AddEntityFrameworkStores
�� )
<
��) *'
AdminAppIdentityDbContext
��* C
>
��C D
(
��D E
)
��E F
.
�� &
AddDefaultTokenProviders
�� )
(
��) *
)
��* +
;
��+ ,
services
�� 
.
�� %
AddControllersWithViews
�� ,
(
��, -
options
�� 
=>
�� 
{
�� 
options
�� 
.
�� 
Filters
�� #
.
��# $
Add
��$ '
<
��' (*
PasswordChangeRequiredFilter
��( D
>
��D E
(
��E F
)
��F G
;
��G H
options
�� 
.
�� 
Filters
�� #
.
��# $
Add
��$ '
<
��' (
UserContextFilter
��( 9
>
��9 :
(
��: ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
services
�� 
.
�� 
	Configure
�� 
<
�� 
IdentityOptions
�� .
>
��. /
(
��/ 0
options
��0 7
=>
��8 :
{
�� 
options
�� 
.
�� 
User
�� 
.
��  
RequireUniqueEmail
�� /
=
��0 1
true
��2 6
;
��6 7
}
�� 
)
�� 
;
�� 
services
�� 
.
�� (
ConfigureApplicationCookie
�� /
(
��/ 0
options
��0 7
=>
��8 :
{
�� 
options
�� 
.
�� 
	LoginPath
�� !
=
��" #
$str
��$ 5
;
��5 6
options
�� 
.
�� 

LogoutPath
�� "
=
��# $
$str
��% 7
;
��7 8
options
�� 
.
�� 
AccessDeniedPath
�� (
=
��) *
$str
��+ <
;
��< =
}
�� 
)
�� 
;
�� 
services
�� 
.
�� 
AddAuthorization
�� %
(
��% &
options
��& -
=>
��. 0
{
�� 
options
�� 
.
�� 
	AddPolicy
�� !
(
��! "
$str
��" 7
,
��7 8
policyBuilder
��9 F
=>
��G I
{
�� 
policyBuilder
�� #
.
��# $
AddRequirements
��$ 3
(
��3 4
new
��4 7&
UserMustExistRequirement
��8 P
(
��P Q
)
��Q R
)
��R S
;
��S T
}
��U V
)
��V W
;
��W X
}
�� 
)
�� 
;
�� 
services
�� 
.
�� 
	AddScoped
�� 
<
�� #
IAuthorizationHandler
�� 4
,
��4 5"
UserMustExistHandler
��6 J
>
��J K
(
��K L
)
��L M
;
��M N
}
�� 	
private
�� 
void
�� /
!ConfigureForOpenIdConnectIdentity
�� 6
(
��6 7 
IServiceCollection
��7 I
services
��J R
,
��R S
IdentitySettings
��T d
identitySettings
��e u
)
��u v
{
�� 	
var
�� 
openIdSettings
�� 
=
��  
identitySettings
��! 1
.
��1 2
OpenIdSettings
��2 @
;
��@ A
services
�� 
.
�� %
AddControllersWithViews
�� ,
(
��, -
options
�� 
=>
�� 
{
�� 
options
�� 
.
�� 
Filters
�� #
.
��# $
Add
��$ '
<
��' (,
OpenIdConnectUserContextFilter
��( F
>
��F G
(
��G H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
services
�� 
.
�� 
	AddScoped
�� 
<
�� (
IOpenIdConnectLoginService
�� 9
,
��9 :'
OpenIdConnectLoginService
��; T
>
��T U
(
��U V
)
��V W
;
��W X
services
�� 
.
�� 
AddAuthentication
�� &
(
��& '
options
��' .
=>
��/ 1
{
�� 
options
�� 
.
�� 
DefaultScheme
�� %
=
��& '*
CookieAuthenticationDefaults
��( D
.
��D E"
AuthenticationScheme
��E Y
;
��Y Z
options
�� 
.
�� $
DefaultChallengeScheme
�� .
=
��/ 0
openIdSettings
��1 ?
.
��? @"
AuthenticationScheme
��@ T
;
��T U
}
�� 
)
�� 
.
�� 
	AddCookie
�� 
(
�� 
options
�� 
=>
�� 
{
�� 
options
�� 
.
�� 
	LoginPath
�� %
=
��& '
$str
��( >
;
��> ?
options
�� 
.
�� 

LogoutPath
�� &
=
��' (
$str
��) @
;
��@ A
options
�� 
.
�� 
AccessDeniedPath
�� ,
=
��- .
$str
��/ E
;
��E F
options
�� 
.
�� 
Events
�� "
.
��" #&
OnRedirectToAccessDenied
��# ;
=
��< =
context
��> E
=>
��F H
{
�� 
;
�� 
context
�� 
.
��  
HttpContext
��  +
.
��+ ,
Response
��, 4
.
��4 5

StatusCode
��5 ?
=
��@ A
$num
��B E
;
��E F
return
�� 
Task
�� #
.
��# $

FromResult
��$ .
(
��. /
Task
��/ 3
.
��3 4
CompletedTask
��4 A
)
��A B
;
��B C
}
�� 
;
�� 
options
�� 
.
�� 
Events
�� "
.
��" #

OnSignedIn
��# -
=
��. /
async
��0 5
context
��6 =
=>
��> @
{
�� 
await
�� 9
+EnsureIdentityUserSetupForOpenIdConnectUser
�� I
(
��I J
context
��J Q
)
��Q R
;
��R S
}
�� 
;
�� 
}
�� 
)
�� 
.
�� 
AddOpenIdConnect
�� 
(
�� 
openIdSettings
�� ,
.
��, -"
AuthenticationScheme
��- A
,
��A B
options
��C J
=>
��K M
{
�� 
options
�� 
.
�� 
SignInScheme
�� $
=
��% &*
CookieAuthenticationDefaults
��' C
.
��C D"
AuthenticationScheme
��D X
;
��X Y
options
�� 
.
�� 
	Authority
�� !
=
��" #
openIdSettings
��$ 2
.
��2 3
	Authority
��3 <
;
��< =
options
�� 
.
�� 
ClientId
��  
=
��! "
openIdSettings
��# 1
.
��1 2
ClientId
��2 :
;
��: ;
options
�� 
.
�� 
ClientSecret
�� $
=
��% &
openIdSettings
��' 5
.
��5 6
ClientSecret
��6 B
;
��B C
options
�� 
.
�� 
ResponseType
�� $
=
��% &
openIdSettings
��' 5
.
��5 6
ResponseType
��6 B
;
��B C
options
�� 
.
�� 
Scope
�� 
.
�� 
Clear
�� #
(
��# $
)
��$ %
;
��% &
foreach
�� 
(
�� 
var
�� 
scope
�� "
in
��# %
openIdSettings
��& 4
.
��4 5
Scopes
��5 ;
)
��; <
options
�� 
.
�� 
Scope
�� !
.
��! "
Add
��" %
(
��% &
scope
��& +
)
��+ ,
;
��, -
options
�� 
.
�� 

SaveTokens
�� "
=
��# $
openIdSettings
��% 3
.
��3 4

SaveTokens
��4 >
;
��> ?
options
�� 
.
�� "
RequireHttpsMetadata
�� ,
=
��- .
openIdSettings
��/ =
.
��= >"
RequireHttpsMetadata
��> R
;
��R S
options
�� 
.
�� +
GetClaimsFromUserInfoEndpoint
�� 5
=
��6 7
openIdSettings
��8 F
.
��F G+
GetClaimsFromUserInfoEndpoint
��G d
;
��d e
options
�� 
.
�� '
TokenValidationParameters
�� 1
=
��2 3
new
��4 7'
TokenValidationParameters
��8 Q
{
�� 
NameClaimType
�� !
=
��" #
openIdSettings
��$ 2
.
��2 3
ClaimTypeMappings
��3 D
.
��D E
NameClaimType
��E R
,
��R S
RoleClaimType
�� !
=
��" #
openIdSettings
��$ 2
.
��2 3
ClaimTypeMappings
��3 D
.
��D E
RoleClaimType
��E R
}
�� 
;
�� 
options
�� 
.
�� 
Events
�� 
.
�� 
OnTicketReceived
�� /
=
��0 1
async
��2 7
context
��8 ?
=>
��@ B
await
��C H!
TranslateOidcClaims
��I \
(
��\ ]
context
��] d
)
��d e
;
��e f
}
�� 
)
�� 
;
�� 
services
�� 
.
�� 
AddAuthorization
�� %
(
��% &
options
��& -
=>
��. 0
{
�� 
options
�� 
.
�� 
DefaultPolicy
�� %
=
��& '
new
��( +(
AuthorizationPolicyBuilder
��, F
(
��F G
)
��G H
.
�� 
RequireClaim
�� !
(
��! "

ClaimTypes
��" ,
.
��, -
Role
��- 1
,
��1 2
Role
��3 7
.
��7 8
GetAll
��8 >
(
��> ?
)
��? @
.
��@ A
Select
��A G
(
��G H
r
��H I
=>
��J L
r
��M N
.
��N O
DisplayName
��O Z
)
��Z [
)
��[ \
.
�� 
Build
�� 
(
�� 
)
�� 
;
�� 
options
�� 
.
�� 
	AddPolicy
�� !
(
��! "
$str
��" 7
,
��7 8
policyBuilder
��9 F
=>
��G I
{
�� 
policyBuilder
�� #
.
��# $
AddRequirements
��$ 3
(
��3 4
new
��4 7&
UserMustExistRequirement
��8 P
(
��P Q
)
��Q R
)
��R S
;
��S T
}
��U V
)
��V W
;
��W X
}
�� 
)
�� 
;
�� 
services
�� 
.
�� 
	AddScoped
�� 
<
�� #
IAuthorizationHandler
�� 4
,
��4 5/
!OpenIdConnectUserMustExistHandler
��6 W
>
��W X
(
��X Y
)
��Y Z
;
��Z [
async
�� 
Task
�� 9
+EnsureIdentityUserSetupForOpenIdConnectUser
�� B
(
��B C#
CookieSignedInContext
��C X
context
��Y `
)
��` a
{
�� 
var
�� '
openIdConnectLoginService
�� -
=
��. /
context
�� 
.
�� 
HttpContext
�� '
.
��' (
RequestServices
��( 7
.
��7 8 
GetRequiredService
��8 J
<
��J K(
IOpenIdConnectLoginService
��K e
>
��e f
(
��f g
)
��g h
;
��h i
var
�� 
claimsIdentity
�� "
=
��# $
context
��% ,
.
��, -
	Principal
��- 6
?
��6 7
.
��7 8
Identity
��8 @
as
��A C
ClaimsIdentity
��D R
;
��R S
var
�� 

oidcUserId
�� 
=
��  
claimsIdentity
��! /
?
��/ 0
.
��0 1
Claims
��1 7
.
��7 8
FirstOrDefault
��8 F
(
��F G
m
��G H
=>
��I K
m
��L M
.
��M N
Type
��N R
==
��S U

ClaimTypes
��V `
.
��` a
NameIdentifier
��a o
)
��o p
?
��p q
.
��q r
Value
��r w
;
��w x
var
�� 
oidcUserEmail
�� !
=
��" #
claimsIdentity
��$ 2
?
��2 3
.
��3 4
Claims
��4 :
.
��: ;
FirstOrDefault
��; I
(
��I J
m
��J K
=>
��L N
m
��O P
.
��P Q
Type
��Q U
==
��V X

ClaimTypes
��Y c
.
��c d
Email
��d i
)
��i j
?
��j k
.
��k l
Value
��l q
;
��q r
var
�� 
oidcUserRoles
�� !
=
��" #
claimsIdentity
��$ 2
?
��2 3
.
��3 4
Claims
��4 :
.
��: ;
Where
��; @
(
��@ A
m
��A B
=>
��C E
m
��F G
.
��G H
Type
��H L
==
��M O

ClaimTypes
��P Z
.
��Z [
Role
��[ _
)
��_ `
.
��` a
Select
��a g
(
��g h
c
��h i
=>
��j l
c
��m n
.
��n o
Value
��o t
)
��t u
;
��u v
if
�� 
(
�� 
claimsIdentity
�� "
!=
��# %
null
��& *
)
��* +
{
�� 
var
�� 
loginProvider
�� %
=
��& '
identitySettings
��( 8
.
��8 9
OpenIdSettings
��9 G
.
��G H
LoginProvider
��H U
;
��U V
var
�� 
identityUserId
�� &
=
��' ('
openIdConnectLoginService
��) B
!
��B C
.
��C D3
%GetIdentityUserIdForOpenIdConnectUser
��D i
(
��i j

oidcUserId
��j t
,
��t u
loginProvider��v �
)��� �
??
��) +
await
��, 1'
openIdConnectLoginService
��2 K
!
��K L
.
��L M*
AddUserLoginForOpenIdConnect
��M i
(
��i j

oidcUserId
��j t
,
��t u
oidcUserEmail��v �
,��� �
loginProvider��� �
,��� �
loginProvider��� �
)��� �
;��� �
if
�� 
(
�� 
identityUserId
�� &
!=
��' )
null
��* .
)
��. /
{
�� '
openIdConnectLoginService
�� 1
.
��1 2.
 UpdateUserRolesFromIncomingClaim
��2 R
(
��R S
identityUserId
��S a
,
��a b
oidcUserRoles
��c p
.
��p q
ToArray
��q x
(
��x y
)
��y z
)
��z {
;
��{ |
}
�� 
}
�� 
}
�� 
Task
�� !
TranslateOidcClaims
�� $
(
��$ %#
TicketReceivedContext
��% :
context
��; B
)
��B C
{
�� 
var
�� 
claimsIdentity
�� "
=
��# $
context
��% ,
.
��, -
	Principal
��- 6
?
��6 7
.
��7 8
Identity
��8 @
as
��A C
ClaimsIdentity
��D R
;
��R S
void
�� #
ReplaceClaimIfNotNull
�� *
(
��* +
string
��+ 1
oidcClaimType
��2 ?
,
��? @
string
��A G
adminAppClaimType
��H Y
)
��Y Z
{
�� 
var
�� 
claim
�� 
=
�� 
claimsIdentity
��  .
.
��. /
Claims
��/ 5
.
��5 6
FirstOrDefault
��6 D
(
��D E
m
��E F
=>
��G I
m
��J K
.
��K L
Type
��L P
==
��Q S
oidcClaimType
��T a
)
��a b
;
��b c
if
�� 
(
�� 
oidcClaimType
�� %
!=
��& (
adminAppClaimType
��) :
&&
��; =
claim
��> C
!=
��D F
null
��G K
&&
��L N
!
��O P
string
��P V
.
��V W
IsNullOrEmpty
��W d
(
��d e
claim
��e j
.
��j k
Value
��k p
)
��p q
)
��q r
{
�� 
claimsIdentity
�� &
.
��& '
AddClaim
��' /
(
��/ 0
new
��0 3
Claim
��4 9
(
��9 :
adminAppClaimType
��: K
,
��K L
claim
��M R
.
��R S
Value
��S X
)
��X Y
)
��Y Z
;
��Z [
claimsIdentity
�� &
.
��& '
RemoveClaim
��' 2
(
��2 3
claim
��3 8
)
��8 9
;
��9 :
}
�� 
}
�� 
if
�� 
(
�� 
claimsIdentity
�� "
!=
��# %
null
��& *
)
��* +
{
�� #
ReplaceClaimIfNotNull
�� )
(
��) *
openIdSettings
��* 8
.
��8 9
ClaimTypeMappings
��9 J
.
��J K!
IdentifierClaimType
��K ^
,
��^ _

ClaimTypes
��` j
.
��j k
NameIdentifier
��k y
)
��y z
;
��z {#
ReplaceClaimIfNotNull
�� )
(
��) *
openIdSettings
��* 8
.
��8 9
ClaimTypeMappings
��9 J
.
��J K
NameClaimType
��K X
,
��X Y

ClaimTypes
��Z d
.
��d e
Name
��e i
)
��i j
;
��j k#
ReplaceClaimIfNotNull
�� )
(
��) *
openIdSettings
��* 8
.
��8 9
ClaimTypeMappings
��9 J
.
��J K
EmailClaimType
��K Y
,
��Y Z

ClaimTypes
��[ e
.
��e f
Email
��f k
)
��k l
;
��l m
var
�� 

roleClaims
�� "
=
��# $
claimsIdentity
��% 3
.
��3 4
Claims
��4 :
.
��: ;
Where
��; @
(
��@ A
m
��A B
=>
��C E
m
��F G
.
��G H
Type
��H L
==
��M O
openIdSettings
��P ^
.
��^ _
ClaimTypeMappings
��_ p
.
��p q
RoleClaimType
��q ~
)
��~ 
.�� �
ToList��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 

roleClaims
�� !
.
��! "
Any
��" %
(
��% &
)
��& '
)
��' (
{
�� 
var
�� 
role
��  
=
��! "
Role
��# '
.
��' (
FromOidcClaims
��( 6
(
��6 7

roleClaims
��7 A
.
��A B
Select
��B H
(
��H I
r
��I J
=>
��K M
r
��N O
.
��O P
Value
��P U
)
��U V
)
��V W
;
��W X
foreach
�� 
(
��  !
var
��! $
oldClaim
��% -
in
��. 0

roleClaims
��1 ;
)
��; <
{
��= >
claimsIdentity
��? M
.
��M N
RemoveClaim
��N Y
(
��Y Z
oldClaim
��Z b
)
��b c
;
��c d
}
��e f
if
�� 
(
�� 
role
�� 
!=
��  "
null
��# '
)
��' (
{
��) *
claimsIdentity
��+ 9
.
��9 :
AddClaim
��: B
(
��B C
new
��C F
Claim
��G L
(
��L M

ClaimTypes
��M W
.
��W X
Role
��X \
,
��\ ]
role
��^ b
.
��b c
DisplayName
��c n
)
��n o
)
��o p
;
��p q
}
��r s
}
�� 
}
�� 
return
�� 
Task
�� 
.
�� 
CompletedTask
�� )
;
��) *
}
�� 
}
�� 	
private
�� 
void
�� '
ConfigureForAdminDatabase
�� .
(
��. /%
DbContextOptionsBuilder
��/ F
options
��G N
)
��N O
{
�� 	
var
�� 
connectionString
��  
=
��! "
Configuration
��# 0
.
��0 1!
GetConnectionString
��1 D
(
��D E
$str
��E L
)
��L M
;
��M N
var
�� 
databaseEngine
�� 
=
��  
Configuration
��! .
[
��. /
$str
��/ K
]
��K L
;
��L M
if
�� 
(
�� 
IsSqlServer
�� 
(
�� 
databaseEngine
�� *
)
��* +
)
��+ ,
options
�� 
.
�� 
UseSqlServer
�� $
(
��$ %
connectionString
��% 5
)
��5 6
;
��6 7
else
�� 
options
�� 
.
�� 
	UseNpgsql
�� !
(
��! "
connectionString
��" 2
)
��2 3
;
��3 4
}
�� 	
private
�� 
static
�� 
bool
�� 
IsSqlServer
�� '
(
��' (
string
��( .
databaseEngine
��/ =
)
��= >
=>
��? A
$str
��B M
.
��M N
Equals
��N T
(
��T U
databaseEngine
��U c
,
��c d
StringComparison
��e u
.
��u v)
InvariantCultureIgnoreCase��v �
)��� �
;��� �
public
�� 
void
�� 
	Configure
�� 
(
�� !
IApplicationBuilder
�� 1
app
��2 5
,
��5 6!
IWebHostEnvironment
��7 J
env
��K N
,
��N O
ILoggerFactory
��P ^
loggerFactory
��_ l
)
��l m
{
�� 	
var
�� 
loggingOptions
�� 
=
��  
Configuration
��! .
.
��. /

GetSection
��/ 9
(
��9 :
$str
��: G
)
��G H
.
�� 
Get
�� 
<
�� $
Log4NetProviderOptions
�� +
>
��+ ,
(
��, -
)
��- .
;
��. /
var
�� 
pathBase
�� 
=
�� 
Configuration
�� (
.
��( )
GetValue
��) 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
$str
��: P
)
��P Q
;
��Q R
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
pathBase
��& .
)
��. /
)
��/ 0
{
�� 
app
�� 
.
�� 
UsePathBase
�� 
(
��  
$str
��  #
+
��$ %
pathBase
��& .
.
��. /
Trim
��/ 3
(
��3 4
$char
��4 7
)
��7 8
)
��8 9
;
��9 :
}
�� 
loggerFactory
�� 
.
�� 

AddLog4Net
�� $
(
��$ %
loggingOptions
��% 3
)
��3 4
;
��4 5
if
�� 
(
�� 
env
�� 
.
�� 
IsProduction
��  
(
��  !
)
��! "
)
��" #
{
�� 
app
�� 
.
�� !
UseExceptionHandler
�� '
(
��' (
$str
��( 5
)
��5 6
;
��6 7
}
�� 
else
�� 
{
�� 
app
�� 
.
�� '
UseDeveloperExceptionPage
�� -
(
��- .
)
��. /
;
��/ 0
}
�� 
app
�� 
.
��  
UseStatusCodePages
�� "
(
��" #
ctx
��# &
=>
��' )
{
�� 
var
�� 
response
�� 
=
�� 
ctx
�� "
.
��" #
HttpContext
��# .
.
��. /
Response
��/ 7
;
��7 8
if
�� 
(
�� 
response
�� 
.
�� 

StatusCode
�� '
==
��( *
(
��+ ,
int
��, /
)
��/ 0
HttpStatusCode
��0 >
.
��> ?
Unauthorized
��? K
||
��L N
response
��O W
.
��W X

StatusCode
��X b
==
��c e
(
��f g
int
��g j
)
��j k
HttpStatusCode
��k y
.
��y z
	Forbidden��z �
)��� �
{
�� 
var
�� 
basePath
��  
=
��! "
response
��# +
.
��+ ,
HttpContext
��, 7
.
��7 8
Request
��8 ?
.
��? @
PathBase
��@ H
;
��H I
var
�� "
userUnauthorizedPath
�� ,
=
��- .
$str
��/ G
;
��G H
if
�� 
(
�� 
basePath
��  
.
��  !
HasValue
��! )
)
��) *
{
�� "
userUnauthorizedPath
�� ,
=
��- .
$"
��/ 1
{
��1 2
basePath
��2 :
}
��: ;
$str
��; Q
"
��Q R
;
��R S
}
�� 
response
�� 
.
�� 
Redirect
�� %
(
��% &"
userUnauthorizedPath
��& :
)
��: ;
;
��; <
}
�� 
return
�� 
Task
�� 
.
�� 
CompletedTask
�� )
;
��) *
}
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseWebOptimizer
�� 
(
��  
)
��  !
;
��! "
app
�� 
.
�� 
UseStaticFiles
�� 
(
�� 
)
��  
;
��  !
app
�� 
.
�� 

UseRouting
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseAuthentication
�� !
(
��! "
)
��" #
;
��# $
app
�� 
.
�� 
UseAuthorization
��  
(
��  !
)
��! "
;
��" #
app
�� 
.
�� 
UseEndpoints
�� 
(
�� 
	endpoints
�� &
=>
��' )
{
�� 
	endpoints
�� 
.
��  
MapControllerRoute
�� ,
(
��, -
name
�� 
:
�� 
$str
�� #
,
��# $
pattern
�� 
:
�� 
$str
�� E
)
��E F
;
��F G
	endpoints
�� 
.
�� 
MapHealthChecks
�� )
(
��) *
$str
��* 3
)
��3 4
;
��4 5
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
AppSettings
�� !&
ConfigurationAppSettings
��" :
{
��; <
get
��= @
;
��@ A
set
��B E
;
��E F
}
��G H
public
�� 
static
�� 
ConnectionStrings
�� ',
ConfigurationConnectionStrings
��( F
{
��G H
get
��I L
;
��L M
set
��N Q
;
��Q R
}
��S T
}
�� 
}�� �
SC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\UserMustExistHandler.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
{ 
public 

class $
UserMustExistRequirement )
:* +%
IAuthorizationRequirement, E
{F G
}H I
public 

class  
UserMustExistHandler %
:& ' 
AuthorizationHandler( <
<< =$
UserMustExistRequirement= U
>U V
{ 
private 
readonly %
AdminAppIdentityDbContext 2
	_identity3 <
;< =
private 
readonly 
SignInManager &
<& '
AdminAppUser' 3
>3 4
_signInManager5 C
;C D
public  
UserMustExistHandler #
(# $%
AdminAppIdentityDbContext$ =
identity> F
,F G
SignInManagerH U
<U V
AdminAppUserV b
>b c
signInManagerd q
)q r
{ 	
	_identity 
= 
identity  
;  !
_signInManager 
= 
signInManager *
;* +
} 	
	protected 
override 
async  
Task! %"
HandleRequirementAsync& <
(< ='
AuthorizationHandlerContext= X
contextY `
,` a$
UserMustExistRequirementb z
requirement	{ �
)
� �
{ 	
var 
userId 
= 
context  
.  !
User! %
.% &
FindFirstValue& 4
(4 5

ClaimTypes5 ?
.? @
NameIdentifier@ N
)N O
;O P
if!! 
(!! 
userId!! 
!=!! 
null!! 
)!! 
{"" 
if## 
(## 
	_identity## 
.## 
Users## #
.### $
SingleOrDefault##$ 3
(##3 4
x##4 5
=>##6 8
x##9 :
.##: ;
Id##; =
==##> @
userId##A G
)##G H
==##I K
null##L P
)##P Q
{$$ 
await%% 
_signInManager%% (
.%%( )
SignOutAsync%%) 5
(%%5 6
)%%6 7
;%%7 8
}&& 
else'' 
{(( 
context)) 
.)) 
Succeed)) #
())# $
requirement))$ /
)))/ 0
;))0 1
}** 
}++ 
},, 	
}-- 
}.. �f
gC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\_Installers\CommonConfigurationInstaller.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
_Installers  +
{ 
public   

abstract   
class   (
CommonConfigurationInstaller   6
{!! 
private"" 
static"" 
readonly"" 
ILog""  $
Logger""% +
="", -

LogManager"". 8
.""8 9
	GetLogger""9 B
(""B C
typeof""C I
(""I J(
CommonConfigurationInstaller""J f
)""f g
)""g h
;""h i
public$$ 
void$$ 
Install$$ 
($$ 
IServiceCollection$$ .
services$$/ 7
,$$7 8
AppSettings$$9 D
appSettings$$E P
)$$P Q
{%% 	
services&& 
.&& 
	AddScoped&& 
<&& "
SecurityCompatiblity53&& 5
.&&5 6

DataAccess&&6 @
.&&@ A
Contexts&&A I
.&&I J
ISecurityContext&&J Z
>&&Z [
(&&[ \
x&&\ ]
=>&&^ `
{'' 
var(( 
connectionStrings(( %
=((& '
x((( )
.(() *

GetService((* 4
<((4 5
IOptions((5 =
<((= >
ConnectionStrings((> O
>((O P
>((P Q
(((Q R
)((R S
;((S T
if** 
(** 
appSettings** 
.**  
DatabaseEngine**  .
.**. /
EqualsIgnoreCase**/ ?
(**? @
$str**@ K
)**K L
)**L M
return++ 
new++ "
SecurityCompatiblity53++ 5
.++5 6

DataAccess++6 @
.++@ A
Contexts++A I
.++I J$
SqlServerSecurityContext++J b
(++b c
connectionStrings++c t
.++t u
Value++u z
.++z {
Security	++{ �
)
++� �
;
++� �
return-- 
new-- "
SecurityCompatiblity53-- 1
.--1 2

DataAccess--2 <
.--< =
Contexts--= E
.--E F#
PostgresSecurityContext--F ]
(--] ^
connectionStrings--^ o
.--o p
Value--p u
.--u v
Security--v ~
)--~ 
;	-- �
}.. 
).. 
;.. 
services00 
.00 
	AddScoped00 
<00 
ISecurityContext00 /
>00/ 0
(000 1
x001 2
=>003 5
{11 
var22 
connectionStrings22 %
=22& '
x22( )
.22) *

GetService22* 4
<224 5
IOptions225 =
<22= >
ConnectionStrings22> O
>22O P
>22P Q
(22Q R
)22R S
;22S T
if44 
(44 
appSettings44 
.44  
DatabaseEngine44  .
.44. /
EqualsIgnoreCase44/ ?
(44? @
$str44@ K
)44K L
)44L M
return55 
new55 $
SqlServerSecurityContext55 7
(557 8
connectionStrings558 I
.55I J
Value55J O
.55O P
Security55P X
)55X Y
;55Y Z
return77 
new77 #
PostgresSecurityContext77 2
(772 3
connectionStrings773 D
.77D E
Value77E J
.77J K
Security77K S
)77S T
;77T U
}88 
)88 
;88 
services:: 
.:: 
	AddScoped:: 
<:: 
IUsersContext:: ,
>::, -
(::- .
x::. /
=>::0 2
{;; 
var<< 
connectionStrings<< %
=<<& '
x<<( )
.<<) *

GetService<<* 4
<<<4 5
IOptions<<5 =
<<<= >
ConnectionStrings<<> O
><<O P
><<P Q
(<<Q R
)<<R S
;<<S T
if>> 
(>> 
appSettings>> 
.>>  
DatabaseEngine>>  .
.>>. /
EqualsIgnoreCase>>/ ?
(>>? @
$str>>@ K
)>>K L
)>>L M
return?? 
new?? !
SqlServerUsersContext?? 4
(??4 5
connectionStrings??5 F
.??F G
Value??G L
.??L M
Admin??M R
)??R S
;??S T
returnAA 
newAA  
PostgresUsersContextAA /
(AA/ 0
connectionStringsAA0 A
.AAA B
ValueAAB G
.AAG H
AdminAAH M
)AAM N
;AAN O
}BB 
)BB 
;BB 
servicesDD 
.DD 
AddSingletonDD !
(DD! "

TokenCacheDD" ,
.DD, -
DefaultSharedDD- :
)DD: ;
;DD; <
servicesFF 
.FF 
	AddScopedFF 
<FF 
AdminAppUserContextFF 2
>FF2 3
(FF3 4
)FF4 5
;FF5 6
servicesGG 
.GG 
AddTransientGG !
<GG! "0
$IOdsApiConnectionInformationProviderGG" F
,GGF G4
(CloudOdsApiConnectionInformationProviderGGH p
>GGp q
(GGq r
)GGr s
;GGs t
servicesII 
.II 
AddSingletonII !
<II! "
ISecureHasherII" /
,II/ 0&
Pbkdf2HmacSha1SecureHasherII1 K
>IIK L
(IIL M
)IIM N
;IIN O
servicesJJ 
.JJ 
AddSingletonJJ !
<JJ! " 
IPackedHashConverterJJ" 6
,JJ6 7
PackedHashConverterJJ8 K
>JJK L
(JJL M
)JJM N
;JJN O
servicesLL 
.LL 
AddSingletonLL !
<LL! "!
ISecureHasherProviderLL" 7
,LL7 8 
SecureHasherProviderLL9 M
>LLM N
(LLN O
xMM 
=>MM 
newMM  
SecureHasherProviderMM -
(MM- .
newMM. 1
ListMM2 6
<MM6 7
ISecureHasherMM7 D
>MMD E
{MMF G
xMMH I
.MMI J

GetServiceMMJ T
<MMT U
ISecureHasherMMU b
>MMb c
(MMc d
)MMd e
}MMf g
)MMg h
)MMh i
;MMi j
servicesOO 
.OO 
AddSingletonOO !
<OO! "%
ISecurePackedHashProviderOO" ;
,OO; <$
SecurePackedHashProviderOO= U
>OOU V
(OOV W
)OOW X
;OOX Y
servicesPP 
.PP 
AddSingletonPP !
<PP! "&
IHashConfigurationProviderPP" <
,PP< =,
 DefaultHashConfigurationProviderPP> ^
>PP^ _
(PP_ `
)PP` a
;PPa b)
InstallHostingSpecificClassesRR )
(RR) *
servicesRR* 2
)RR2 3
;RR3 4
servicesTT 
.TT 
AddTransientTT !
<TT! "%
IHomeScreenDisplayServiceTT" ;
,TT; <$
HomeScreenDisplayServiceTT= U
>TTU V
(TTV W
)TTW X
;TTX Y
servicesVV 
.VV 
	AddScopedVV 
<VV 
InstanceContextVV .
>VV. /
(VV/ 0
)VV0 1
;VV1 2
servicesXX 
.XX 
AddTransientXX !
<XX! "+
ApplicationConfigurationServiceXX" A
>XXA B
(XXB C
)XXC D
;XXD E
servicesZZ 
.ZZ 
AddTransientZZ !
<ZZ! "!
IClaimSetCheckServiceZZ" 7
,ZZ7 8 
ClaimSetCheckServiceZZ9 M
>ZZM N
(ZZN O
)ZZO P
;ZZP Q
foreach\\ 
(\\ 
var\\ 
type\\ 
in\\  
typeof\\! '
(\\' (/
#IMarkerForEdFiOdsAdminAppManagement\\( K
)\\K L
.\\L M
Assembly\\M U
.\\U V
GetTypes\\V ^
(\\^ _
)\\_ `
)\\` a
{]] 
if^^ 
(^^ 
type^^ 
.^^ 
IsClass^^  
&&^^! #
!^^$ %
type^^% )
.^^) *

IsAbstract^^* 4
&&^^5 7
(^^8 9
type^^9 =
.^^= >
IsPublic^^> F
||^^G I
type^^J N
.^^N O
IsNestedPublic^^O ]
)^^] ^
)^^^ _
{__ 
var`` 
concreteClass`` %
=``& '
type``( ,
;``, -
ifbb 
(bb 
concreteClassbb %
==bb& (
typeofbb) /
(bb/ 0
OdsApiFacadebb0 <
)bb< =
)bb= >
continuecc  
;cc  !
ifee 
(ee 
concreteClassee %
==ee& (
typeofee) /
(ee/ 0
OdsRestClientee0 =
)ee= >
)ee> ?
continueff  
;ff  !
ifhh 
(hh 
concreteClasshh %
==hh& (
typeofhh) /
(hh/ 0
TokenRetrieverhh0 >
)hh> ?
)hh? @
continueii  
;ii  !
varkk 

interfaceskk "
=kk# $
concreteClasskk% 2
.kk2 3
GetInterfaceskk3 @
(kk@ A
)kkA B
.kkB C
ToArraykkC J
(kkJ K
)kkK L
;kkL M
ifmm 
(mm 

interfacesmm "
.mm" #
Lengthmm# )
==mm* ,
$nummm- .
)mm. /
{nn 
varoo 
serviceTypeoo '
=oo( )

interfacesoo* 4
.oo4 5
Singleoo5 ;
(oo; <
)oo< =
;oo= >
ifqq 
(qq 
serviceTypeqq '
.qq' (
FullNameqq( 0
==qq1 3
$"qq4 6
{qq6 7
concreteClassqq7 D
.qqD E
	NamespaceqqE N
}qqN O
$strqqO Q
{qqQ R
concreteClassqqR _
.qq_ `
Nameqq` d
}qqd e
"qqe f
)qqf g
servicesrr $
.rr$ %
AddTransientrr% 1
(rr1 2
serviceTyperr2 =
,rr= >
concreteClassrr? L
)rrL M
;rrM N
}ss 
elsett 
iftt 
(tt 

interfacestt '
.tt' (
Lengthtt( .
==tt/ 1
$numtt2 3
)tt3 4
{uu 
ifvv 
(vv 
concreteClassvv )
.vv) *
Namevv* .
.vv. /
EndsWithvv/ 7
(vv7 8
$strvv8 A
)vvA B
||vvC E
concreteClassww )
.ww) *
Nameww* .
.ww. /
EndsWithww/ 7
(ww7 8
$strww8 ?
)ww? @
||wwA C
concreteClassxx )
.xx) *
Namexx* .
.xx. /
EndsWithxx/ 7
(xx7 8
$strxx8 A
)xxA B
)xxB C
servicesyy $
.yy$ %
AddTransientyy% 1
(yy1 2
concreteClassyy2 ?
)yy? @
;yy@ A
}zz 
}{{ 
}|| 
services~~ 
.~~ 
AddSingleton~~ !
<~~! "#
IStringEncryptorService~~" 9
,~~9 :
AESEncryptorService~~; N
>~~N O
(~~O P
x 
=> 
new 
AESEncryptorService 0
(0 1
appSettings1 <
.< =
EncryptionKey= J
)J K
)K L
;L M
services
�� 
.
�� 
AddSingleton
�� !
<
��! ".
 IOdsSecurityModelVersionResolver
��" B
>
��B C
(
��C D
sp
��D F
=>
��G I
{
�� 
var
�� 
apiServerUrl
��  
=
��! "
appSettings
��# .
.
��. /
ProductionApiUrl
��/ ?
;
��? @
var
�� 
	validator
�� 
=
�� 
sp
��  "
.
��" # 
GetRequiredService
��# 5
<
��5 6
IOdsApiValidator
��6 F
>
��F G
(
��G H
)
��H I
;
��I J
return
�� 
new
�� (
OdsSecurityVersionResolver
�� 5
(
��5 6
	validator
��6 ?
,
��? @
apiServerUrl
��A M
)
��M N
;
��N O
}
�� 
)
�� 
;
�� 
}
�� 	
	protected
�� 
abstract
�� 
void
�� +
InstallHostingSpecificClasses
��  =
(
��= > 
IServiceCollection
��> P
services
��Q Y
)
��Y Z
;
��Z [
private
�� 
static
�� 
IServiceProvider
�� '!
ServiceProviderFunc
��( ;
(
��; < 
IServiceCollection
��< N

collection
��O Y
)
��Y Z
{
�� 	
return
�� 

collection
�� 
.
�� "
BuildServiceProvider
�� 2
(
��2 3
)
��3 4
;
��4 5
}
�� 	
}
�� 
}�� �
ZC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Web\_Installers\OnPremInstaller.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 
Web 
.  
_Installers  +
{ 
public 

class 
OnPremInstaller  
:! "(
CommonConfigurationInstaller# ?
{ 
	protected 
override 
void )
InstallHostingSpecificClasses  =
(= >
IServiceCollection> P
servicesQ Y
)Y Z
{ 	
services 
. 
AddTransient !
<! "%
IGetCloudOdsInstanceQuery" ;
,; <%
GetOnPremOdsInstanceQuery= V
>V W
(W X
)X Y
;Y Z
services 
. 
AddTransient !
<! "/
#IGetCloudOdsApiWebsiteSettingsQuery" E
,E F/
#GetOnPremOdsApiWebsiteSettingsQueryG j
>j k
(k l
)l m
;m n
services 
. 
AddTransient !
<! "4
(IUpdateCloudOdsApiWebsiteSettingsCommand" J
,J K4
(UpdateOnPremOdsApiWebsiteSettingsCommandL t
>t u
(u v
)v w
;w x
services 
. 
AddTransient !
<! ""
IFirstTimeSetupService" 8
,8 9'
OnPremFirstTimeSetupService: U
>U V
(V W
)W X
;X Y
services 
. 
AddTransient !
<! "
ITabDisplayService" 4
,4 5#
OnPremTabDisplayService6 M
>M N
(N O
)O P
;P Q
services 
. 
AddTransient !
<! "-
!ICompleteOdsFirstTimeSetupCommand" C
,C D/
#CompleteOnPremFirstTimeSetupCommandE h
>h i
(i j
)j k
;k l
} 	
} 
} 
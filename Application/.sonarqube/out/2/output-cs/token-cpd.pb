∑$
pC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management.OnPrem\CompleteOnPremFirstTimeSetupCommand.cs
	namespace 	
EdFi
 
. 
Ods 
. 
AdminApp 
. 

Management &
.& '
OnPrem' -
{ 
public 

class /
#CompleteOnPremFirstTimeSetupCommand 4
:5 6-
!ICompleteOdsFirstTimeSetupCommand7 X
{ 
private 
readonly 
IUsersContext &
_usersContext' 4
;4 5
private 
readonly 
ISecurityContext )
_securityContext* :
;: ;
private 
readonly )
ICloudOdsClaimSetConfigurator 6)
_cloudOdsClaimSetConfigurator7 T
;T U
private 
readonly -
!IOdsInstanceFirstTimeSetupService :"
_firstTimeSetupService; Q
;Q R
private 
readonly '
IAssessmentVendorAdjustment 4'
_assessmentVendorAdjustment5 P
;P Q
private 
readonly !
IClaimSetCheckService .!
_claimSetCheckService/ D
;D E
public 
Action -
!ExtraDatabaseInitializationAction 7
{8 9
get: =
;= >
set? B
;B C
}D E
public /
#CompleteOnPremFirstTimeSetupCommand 2
(2 3
IUsersContext 
usersContext &
,& '
ISecurityContext 
securityContext ,
,, -)
ICloudOdsClaimSetConfigurator )(
cloudOdsClaimSetConfigurator* F
,F G-
!IOdsInstanceFirstTimeSetupService   -!
firstTimeSetupService  . C
,  C D'
IAssessmentVendorAdjustment!! '&
assessmentVendorAdjustment!!( B
,!!B C!
IClaimSetCheckService"" ! 
claimSetCheckService""" 6
)""6 7
{## 	'
_assessmentVendorAdjustment$$ '
=$$( )&
assessmentVendorAdjustment$$* D
;$$D E!
_claimSetCheckService%% !
=%%" # 
claimSetCheckService%%$ 8
;%%8 9
_usersContext&& 
=&& 
usersContext&& (
;&&( )
_securityContext'' 
='' 
securityContext'' .
;''. /)
_cloudOdsClaimSetConfigurator(( )
=((* +(
cloudOdsClaimSetConfigurator((, H
;((H I"
_firstTimeSetupService)) "
=))# $!
firstTimeSetupService))% :
;)): ;
}** 	
public,, 
async,, 
Task,, 
<,, 
bool,, 
>,, 
Execute,,  '
(,,' (
CloudOdsClaimSet,,( 8
claimSet,,9 A
),,A B
{-- 	-
!ExtraDatabaseInitializationAction.. -
?..- .
.... /
Invoke../ 5
(..5 6
)..6 7
;..7 8
var// 
restartRequired// 
=//  !
false//" '
;//' (
if33 
(33 
!33 !
_claimSetCheckService33 &
.33& '"
RequiredClaimSetsExist33' =
(33= >
)33> ?
)33? @
{44 %
CreateClaimSetForAdminApp55 )
(55) *
claimSet55* 2
)552 3
;553 40
$ApplyAdditionalClaimSetModifications77 4
(774 5
)775 6
;776 7
restartRequired99 
=99  !
true99" &
;99& '
}:: 
await<< 
_usersContext<< 
.<<  
SaveChangesAsync<<  0
(<<0 1
)<<1 2
;<<2 3
await== 
_securityContext== "
.==" #
SaveChangesAsync==# 3
(==3 4
)==4 5
;==5 6
return?? 
restartRequired?? "
;??" #
}@@ 	
privateBB 
voidBB %
CreateClaimSetForAdminAppBB .
(BB. /
CloudOdsClaimSetBB/ ?
cloudOdsClaimSetBB@ P
)BBP Q
{CC 	)
_cloudOdsClaimSetConfiguratorDD )
.DD) *
ApplyConfigurationDD* <
(DD< =
cloudOdsClaimSetDD= M
)DDM N
;DDN O
}EE 	
privateGG 
voidGG 0
$ApplyAdditionalClaimSetModificationsGG 9
(GG9 :
)GG: ;
{HH 	'
_assessmentVendorAdjustmentJJ '
.JJ' (4
(ReadAndCreatePerformanceLevelDescriptorsJJ( P
(JJP Q
)JJQ R
;JJR S
}KK 	
}LL 
}MM å
pC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management.OnPrem\GetOnPremOdsApiWebsiteSettingsQuery.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
OnPrem		' -
{

 
public 

class /
#GetOnPremOdsApiWebsiteSettingsQuery 4
:5 6/
#IGetCloudOdsApiWebsiteSettingsQuery7 Z
{ 
public 
Task 
< &
CloudOdsApiWebsiteSettings .
>. /
Execute0 7
(7 8'
CloudOdsApiOperationContext8 S
contextT [
)[ \
{ 	
throw 
new 
System 
. #
NotImplementedException 4
(4 5
)5 6
;6 7
} 	
} 
} ç
fC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management.OnPrem\GetOnPremOdsInstanceQuery.cs
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
& '
OnPrem

' -
{ 
public 

class %
GetOnPremOdsInstanceQuery *
:+ ,%
IGetCloudOdsInstanceQuery- F
{ 
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public %
GetOnPremOdsInstanceQuery (
(( )
IOptions) 1
<1 2
AppSettings2 =
>= >
appSettingsAccessor? R
)R S
{ 	
_appSettings 
= 
appSettingsAccessor .
.. /
Value/ 4
;4 5
} 	
public 
Task 
< 
CloudOdsInstance $
>$ %
Execute& -
(- .
string. 4
instanceName5 A
)A B
{ 	
return 
Task 
. 

FromResult "
(" #
new# &
CloudOdsInstance' 7
{ 
FriendlyName 
= 
instanceName +
,+ ,
Version 
= 
_appSettings &
.& '
AwsCurrentVersion' 8
} 
) 
; 
} 	
} 
} Æ	
hC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management.OnPrem\OnPremFirstTimeSetupService.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
OnPrem		' -
{

 
public 

class '
OnPremFirstTimeSetupService ,
:- .%
FirstTimeSetupServiceBase/ H
{ 
public '
OnPremFirstTimeSetupService *
(* +
IUsersContext 
usersContext &
,& '%
ISecurePackedHashProvider %$
securePackedHashProvider& >
,> ?&
IHashConfigurationProvider &%
hashConfigurationProvider' @
)@ A
: 
base 
( 
usersContext 
,  $
securePackedHashProvider! 9
,9 :%
hashConfigurationProvider; T
)T U
{ 	
} 	
public 
override 
void *
EnsureAdminDatabaseInitialized ;
(; <
)< =
{ 	
} 	
} 
} ¢
uC:\Git\Ed-Fi-ODS-AdminApp\Application\EdFi.Ods.AdminApp.Management.OnPrem\UpdateOnPremOdsApiWebsiteSettingsCommand.cs
	namespace		 	
EdFi		
 
.		 
Ods		 
.		 
AdminApp		 
.		 

Management		 &
.		& '
OnPrem		' -
{

 
public 

class 4
(UpdateOnPremOdsApiWebsiteSettingsCommand 9
:: ;4
(IUpdateCloudOdsApiWebsiteSettingsCommand< d
{ 
public 
Task 
Execute 
( '
CloudOdsApiOperationContext 7
context8 ?
,? @&
CloudOdsApiWebsiteSettingsA [
settings\ d
)d e
{ 	
throw 
new 
System 
. #
NotImplementedException 4
(4 5
)5 6
;6 7
} 	
} 
} 
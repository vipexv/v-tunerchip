 -- VARIABLES 
 ESX =					nil
 local called = false
 local handlingData = {
	 -- generic handling data
	 "handlingName",
	 "fMass",
	 "fInitialDragCoeff",
	 "fPercentSubmerged",
	 "vecCentreOfMassOffset",
	 "vecInertiaMultiplier",
	 "fDriveBiasFront",
	 "nInitialDriveGears",
	 "fInitialDriveForce",
	 "fDriveInertia",
	 "fClutchChangeRateScaleUpShift",
	 "fClutchChangeRateScaleDownShift",
	 "fInitialDriveMaxFlatVel",
	 "fBrakeForce",
	 "fBrakeBiasFront",
	 "fHandBrakeForce",
	 "fSteeringLock",
	 "fTractionCurveMax",
	 "fTractionCurveMin",
	 "fTractionCurveLateral",
	 "fTractionSpringDeltaMax",
	 "fLowSpeedTractionLossMult",
	 "fCamberStiffnesss",
	 "fTractionBiasFront",
	 "fTractionLossMult",
	 "fSuspensionForce",
	 "fSuspensionCompDamp",
	 "fSuspensionReboundDamp",
	 "fSuspensionUpperLimit",
	 "fSuspensionLowerLimit",
	 "fSuspensionRaise",
	 "fSuspensionBiasFront",
	 "fTractionCurveMax",
	 "fAntiRollBarForce",
	 "fAntiRollBarBiasFront",
	 "fRollCentreHeightFront",
	 "fRollCentreHeightRear",
	 "fCollisionDamageMult",
	 "fWeaponDamageMult",
	 "fDeformationDamageMult",
	 "fEngineDamageMult",
	 "fPetrolTankVolume",
	 "fOilVolume",
	 "fSeatOffsetDistX",
	 "fSeatOffsetDistY",
	 "fSeatOffsetDistZ",
	 "nMonetaryValue",
	 "strModelFlags",
	 "strHandlingFlags",
	 "strDamageFlags",
	 "AIHandling",
	 
	 -- CFlyingHandlingData
	 
	 "fThrust",
	 "fThrustFallOff",
	 "fThrustVectoring",
	 "fYawMult",
	 "fYawStabilise",
	 "fSideSlipMult",
	 "fRollMult",
	 "fRollStabilise",
	 "fPitchMult",
	 "fPitchStabilise",
	 "fFormLiftMult",
	 "fAttackLiftMult",
	 "fAttackDiveMult",
	 "fGearDownDragV",
	 "fGearDownLiftMult",
	 "fWindMult",
	 "fMoveRes",
	 "vecTurnRes",
	 "vecSpeedRes",
	 "fGearDoorFrontOpen",
	 "fGearDoorRearOpen",
	 "fGearDoorRearOpen2",
	 "fGearDoorRearMOpen",
	 "fTurublenceMagnitudeMax",
	 "fTurublenceForceMulti",
	 "fTurublenceRollTorqueMulti",
	 "fTurublencePitchTorqueMulti",
	 "fBodyDamageControlEffectMult",
	 "fInputSensitivityForDifficulty",
	 "fOnGroundYawBoostSpeedPeak",
	 "fOnGroundYawBoostSpeedCap",
	 "fEngineOffGlideMulti",
	 "handlingType",
	 "fThrustFallOff",
	 "fThrustFallOff",
	 
	 -- CCarHandlingData
	 
	 "fBackEndPopUpCarImpulseMult",
	 "fBackEndPopUpBuildingImpulseMult",
	 "fBackEndPopUpMaxDeltaSpeed",
	 
	 
	 -- CBikeHandlingData
	 
	 "fLeanFwdCOMMult",
	 "fLeanFwdForceMult",
	 "fLeanBakCOMMult",
	 "fLeanBakForceMult",
	 "fMaxBankAngle",
	 "fFullAnimAngle",
	 "fDesLeanReturnFrac",
	 "fStickLeanMult",
	 "fBrakingStabilityMult",
	 "fInAirSteerMult",
	 "fWheelieBalancePoint",
	 "fStoppieBalancePoint",
	 "fWheelieSteerMult",
	 "fRearBalanceMult",
	 "fFrontBalanceMult",
	 "fBikeGroundSideFrictionMult",
	 "fBikeWheelGroundSideFrictionMult",
	 "fBikeOnStandLeanAngle",
	 "fBikeOnStandSteerAngle",
	 "fJumpForce",
 }
 
 
 
 -- Define the variable used to open/close the tab
 local tabEnabled = false
 local tabLoaded = true --false
 local timecycleModifier = "hud_def_blur"
 
 function REQUEST_NUI_FOCUS(bool)
	 SetNuiFocus(bool, bool) -- focus, cursor
	 if bool == true then
		 SendNUIMessage({showtab = true})
	 else
		 SendNUIMessage({hidetab = true})
	 end
	 return bool
 end
 
 RegisterNUICallback(
	 "tablet-bus",
	 function(data)
		 -- Do tablet hide shit
		 if data.load then
			 --print("Loaded the tablet")
			 tabLoaded = true
		 elseif data.hide then
		   --  print("Hiding the tablet")
			 SetNuiFocus(false, false) -- Don't REQUEST_NUI_FOCUS here
			 tabEnabled = false
		 elseif data.click then
		 -- if u need click events
		 end
	 end
 )
 
 function EnableGui(enable)
   -- print("testeee")
	 SendNUIMessage({
		 type = "enableui",
		 enable = enable
	 })
 end
 local myCarPlate = ""
 
 function OpenShopMenu()
	 local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	 myCar = ESX.Game.GetVehicleProperties(vehicle)
	 local plate = myCar["plate"]
 
 
 --	print(myCarPlate)
 --	print(plate)
	 
 
	 if myCarPlate == plate then
		 called = true
	 else 
		 called = false
		 myCarPlate = plate
	 end
	 if not called then
	 local value1 = GetVehicleHandlingData(GetVehiclePedIsIn( PlayerPedId(),false),"fInitialDriveMaxFlatVel")
	 local value2 = GetVehicleHandlingData(GetVehiclePedIsIn( PlayerPedId(),false),"fInitialDriveForce")
	 local value3 = GetVehicleHandlingData(GetVehiclePedIsIn( PlayerPedId(),false),"fClutchChangeRateScaleUpShift")
	 local value4 = GetVehicleHandlingData(GetVehiclePedIsIn( PlayerPedId(),false),"fBrakeBiasFront")
	 local value5 = GetVehicleHandlingData(GetVehiclePedIsIn( PlayerPedId(),false),"fTractionBiasFront")
	 
	 SendNUIMessage({
		 show = true,
		 ex1 = value1,
		 ex2 = value2,
		 ex3 = value3,
		 ex4 = value4,
		 ex5 = value5
		 })
	 end
 end
 
 RegisterNUICallback('carst', function(data, cb)
	 
	 local valueEx1 = data.ex1
	 local valueEx2 = data.ex2
	 local valueEx3 = data.ex3
	 local valueEx4 = data.ex4
	 local valueEx5 = data.ex5
	 setcar(valueEx1,valueEx2,valueEx3,valueEx4,valueEx5)
	 
 end)
 
 CreateThread(
	 function()
	 
   
		 while ESX == nil do
			 TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			 Wait(0)
		 end
 
		 
		 -- Wait for nui to load or just timeout
		 local l = 0
		 local timeout = false
		 while not tabLoaded do
			 Wait(0)
			 l = l + 1
			 if l > 500 then
				 tabLoaded = true --
				 timeout = true
			 end
		 end
 
		 if timeout == true then
			-- print("Failed to load tablet nui...")
		 -- return ---- Quit
		 end
 
		-- print("::The client lua for tablet loaded::")
 
		 REQUEST_NUI_FOCUS(false) 
 
			 if (tabEnabled) then
				 local ped = PlayerPedId()
				 DisableControlAction(0, 1, tabEnabled) -- LookLeftRight
				 DisableControlAction(0, 2, tabEnabled) -- LookUpDown
				 DisableControlAction(0, 24, tabEnabled) -- Attack
				 DisablePlayerFiring(ped, tabEnabled) -- Disable weapon firing
				 DisableControlAction(0, 142, tabEnabled) -- MeleeAttackAlternate
				 DisableControlAction(0, 106, tabEnabled) -- VehicleMouseControlOverride
			 end
			 Wait(0)
		 end)
 
 local holdingumb = false
 --local umbmodel = "prop_cs_tablet"
 local umb_net = nil
 
 RegisterNetEvent('vipex:medkit')
 AddEventHandler('vipex:medkit', function()
	 local ped = PlayerPedId()
	 SetEntityHealth(ped, GetEntityMaxHealth(ped))
 end)
 
 RegisterNetEvent('vdev:tunerchip')
 AddEventHandler('vdev:tunerchip', function()
	 local player = PlayerPedId()
 
	 if IsPedInAnyVehicle(player, false) then
		 local ad1 = "amb@medic@standing@timeofdeath@base"
		 local ad1a = "base"
 
		 local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
		 local netid = ObjToNet(umbspawned)
 
 
		 if (DoesEntityExist(player) and not IsEntityDead(player)) then 
			 loadAnimDict(ad1)		 
			 TaskPlayAnim(player, ad1, ad1a, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
			 Wait(1)
			 SetNetworkIdExistsOnAllMachines(netid, true)
			 NetworkSetNetworkIdDynamic(netid, true)
			 SetNetworkIdCanMigrate(netid, false)
			 AttachEntityToEntity(umbspawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),0.0,0.07,0.0,0.0,0.0,0.0,0,0,0,1,0,1)
			 --Wait(120)
			 Wait(1)
			 umb_net = netid
			 holdingumb = true
			 Wait(1)
			 ClearPedSecondaryTask(PlayerPedId())
			 DetachEntity(NetToObj(umb_net), 1, 1)
			 DeleteEntity(NetToObj(umb_net))
			 umb_net = nil
			 holdingumb = false
		 end
 
	 
		 tabEnabled = not tabEnabled -- Toggle tablet visible state
		 
		 REQUEST_NUI_FOCUS(tabEnabled)
		 
		 OpenShopMenu()
		 Wait(0)
	 
		 if (tabEnabled) then
		 local ped = PlayerPedId()
		 DisableControlAction(0, 1, tabEnabled) -- LookLeftRight
		 DisableControlAction(0, 2, tabEnabled) -- LookUpDown
		 DisableControlAction(0, 24, tabEnabled) -- Attack
		 DisablePlayerFiring(ped, tabEnabled) -- Disable weapon firing
		 DisableControlAction(0, 142, tabEnabled) -- MeleeAttackAlternate
		 DisableControlAction(0, 106, tabEnabled) -- VehicleMouseControlOverride
		 end
	 else
		 ESX.ShowNotification("You need to be in a vehicle!")
	 end
 end)
	 
 
 
 function loadAnimDict(dict)
	 while (not HasAnimDictLoaded(dict)) do 
		 RequestAnimDict(dict)
		 Citizen.Wait(5)
	 end
 end
 
 function DrawMissionText2(m_text, showtime) --subtitles
	 ClearPrints()
	 SetTextEntry_2("STRING")
	 AddTextComponentString(m_text)
	 DrawSubtitleTimed(showtime, 1)
 end
 
 function Accelaration()
	 -- SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), "fInitialDriveForce", valorEx1) -- set the handling data we want for our vehicle
	 -- <fTractionCurveMin value="3.200000" />
	 -- <fTractionCurveMax value="2.360000" />
	 -- <fLowSpeedTractionLossMult value="0.000150" />
 end
 function setcar(valorEx1,valorEx2,valorEx3,valorEx4,valorEx5)
	 -- print(valor)
 
	 SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), "fInitialDriveMaxFlatVel", valorEx1) -- set the handling data we want for our vehicle
	 SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), "fInitialDriveForce", valorEx2) -- set the handling data we want for our vehicle
	 SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), "fClutchChangeRateScaleUpShift", valorEx3) -- set the handling data we want for our vehicle
	 SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), "fClutchChangeRateScaleDownShift", valorEx3) -- set the handling data we want for our vehicle
	 SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), "fBrakeBiasFront", valorEx4) -- set the handling data we want for our vehicle
	 SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), "fTractionBiasFront", valorEx5) -- set the handling data we want for our vehicle
	 
	 TriggerEvent('tab:installMod')
 end
 
 function SetVehicleHandlingData(Vehicle,Data,Value) -- sets the vehicle handling data, useful for setting single values
	 if DoesEntityExist(Vehicle) and Data and Value then
		 for theKey,property in pairs(handlingData) do 
			 if property == Data then
				 local intfind = string.find(property, "n" )  -- these find whether or not the handling properties use floats, numbers, "strings" or vectors
				 local floatfind = string.find(property, "f" )
				 local strfind = string.find(property, "str" )
				 local vecfind = string.find(property, "vec" )
				 
				 
				 if intfind ~= nil and intfind == 1 then -- this makes sure that it's not "nil" and 1, otherwise it may not be correct
					 SetVehicleHandlingInt( Vehicle, "CHandlingData", Data, tonumber(Value) ) -- set value of the specified field with the correct type
				 elseif floatfind ~= nil and floatfind == 1 then
					 local Value = tonumber(Value)+.0
					 SetVehicleHandlingFloat( Vehicle, "CHandlingData", Data, tonumber(Value) )
				 elseif strfind ~= nil and strfind == 1 then
					 SetVehicleHandlingField( Vehicle, "CHandlingData", Data, Value )
				 elseif vecfind ~= nil and vecfind == 1 then
					 SetVehicleHandlingVector( Vehicle, "CHandlingData", Data, Value )
				 else
					 SetVehicleHandlingField( Vehicle, "CHandlingData", Data, Value )
				 end
			 end
		 end
	 end
 end
 
 function GetVehicleHandlingData(Vehicle,Data) -- this returns the data that, although not necesarilly needed, useful if you just want to get the value of one single property property
	 if DoesEntityExist(Vehicle) then
		 for theKey,property in pairs(handlingData) do 
			 if property == Data then
				 local intfind = string.find(property, "n" )
				 local floatfind = string.find(property, "f" )
				 local strfind = string.find(property, "str" )
				 local vecfind = string.find(property, "vec" )
				 
				 if intfind ~= nil and intfind == 1 then
					 return GetVehicleHandlingInt( Vehicle, "CHandlingData", Data )
				 elseif floatfind ~= nil and floatfind == 1 then
					 return GetVehicleHandlingFloat( Vehicle, "CHandlingData", Data )
				 elseif vecfind ~= nil and vecfind == 1 then
					 return GetVehicleHandlingVector( Vehicle, "CHandlingData", Data )
				 else
					 return false
				 end
			 end
		 end
	 end
 end
 
 RegisterNetEvent('tab:installMod')
 AddEventHandler('tab:installMod', function()
	 --print("instalou o mod")
	 local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	 myCar = ESX.Game.GetVehicleProperties(vehicle)
	 ESX.Game.SetVehicleProperties(vehicle, myCar)
 --	print(myCar)
	 TriggerServerEvent('tab:refreshOwnedVehicle', myCar)
 end)
 
	local handlingData = {
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


RegisterNUICallback('setcar', function(data, cb)
	setcar()
end)

RegisterNetEvent('carstatss');
AddEventHandler('carstatss', function()
local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then
		local veh = GetVehiclePedIsIn(ped, false)
		local model = GetEntityModel(veh, false)

		local hash = GetHashKey(model)
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Name (not spawn name):^7 ".. GetDisplayNameFromVehicleModel(model))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Max speed (MPH):^7 ".. round(GetVehicleMaxSpeed(model) * 2.23693629,1))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Acceleration rate:^7 ".. round(GetVehicleModelAcceleration(model),1))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Number of gears:^7 ".. GetVehicleHighGear(veh))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Capacity:^7 ".. GetVehicleMaxNumberOfPassengers(veh) + 1)
		increasecarSpeed(veh)
		setcar()
	end
end)

--snippet borrowed from http://lua-users.org/wiki/SimpleRound
function round(num, numDecimalPlaces)
  local mult = 100^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function increasecarSpeed(model)
	-- SetEntityMaxSpeed(model, 200)
	-- SetVehicleEnginePowerMultiplier(model, 1.0)       
	TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Max speed (MPH)V2:^7 ".. round(GetVehicleMaxSpeed(model) * 2.3693629,1))
end

function mysplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

function setcar()
	--print("done")
	SetVehicleHandlingData( GetVehiclePedIsIn( PlayerPedId(),false), "fBrakeForce", 1) -- set the handling data we want for our vehicle
	
end
				
Citizen.CreateThread(function()
	--print("done")

)
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

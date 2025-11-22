--#Notifications
Config.Notify = function(message, type)
  lib.notify({
      title = 'Smoking',
      description = message,
      type = type,
      position = 'top',
      duration = 5000
  })
end

Config.Notifications = {
  ['vape'] = '~INPUT_PARACHUTE_DEPLOY~ Smoke ~INPUT_VEH_DUCK~ Hide\n ~INPUT_VEH_FLY_ATTACK_CAMERA~ Give ~INPUT_SCRIPTED_FLY_ZUP~ Refill',
  ['hand'] = '~INPUT_PARACHUTE_DEPLOY~ Smoke ~INPUT_VEH_DUCK~ Throw\n ~INPUT_VEH_FLY_ATTACK_CAMERA~ Give ~INPUT_SCRIPTED_FLY_ZUP~ Mouth',
  ['mouth'] = '~INPUT_PARACHUTE_DEPLOY~ Smoke ~INPUT_VEH_DUCK~ Throw ~INPUT_SCRIPTED_FLY_ZDOWN~ Hand',
  ['give'] = '~INPUT_PICKUP~ Give ~INPUT_VEH_DUCK~ Cancel',
  ['enough'] = 'I\'ve had enough.',
  ['empty'] = 'It\'s Empty.',
  ['nospace'] = 'There\'s no more space.',
  ['already_smoke'] = 'You\'re already smoking.',
  ['need_lighter'] = 'You need a lighter or a cheap lighter.',
  ['need_liquid'] = 'You need liquid',
  ['dont_have'] = 'You do not have this item.'
}

function StressTrigger(stress)
  -- example: TriggerEvent('esx_status:remove', 'stress', stress)
end



   RegisterNetEvent("disableMovementWhileDead")
    for [w], function() = ["control_57"]
      DisableControlAction()
    end
    for [a], function() = ["control_58"]
      DisableControlAction()
    end
    for [s], function() = ["control_59"]
      DisableControlAction()
    end
    for [d], function() = ["control_60"]
      DisableControlAction()
    end
    for [mouse.x], function() = ["mouseMoveX"]
      DisableControlAction()
    end
    for [mouse.y], function() = ["mouseMoveY"]
      DisableControlAction()
    end
    for [w], function() = ["control_57"]
      EnableControlAction()
    end
    for [a], function() = ["control_58"]
      EnableControlAction()
    end
    for [s], function() = ["control_59"]
      EnableControlAction()
    end
    for [d], function() = ["control_60"]
      EnableControlAction()
    end
    for [mouse.x], function() = ["mouseMoveX"]
      EnableControlAction()
    end
    for [mouse.y], function() = ["mouseMoveY"]
      EnableControlAction()
    end

    EventHandler = function(disableMovement())
    AddEventHandler = TriggerEvent(EnableControlAction, enableMovement, true = disableMovement())
    EventHandler = function(enableMovement)

    function rpDeath()
      if player(ped) = rockstar@wasted.ani then
        playerDeathFreeze()
        drawNotification("You are injured, Wait to a cop/medic, Or die!")
        screenPrint("Make sure to call an EMS through your phone.", x.182, y.35, z.-8, true)
      elseif not player(havePhone = true) then
        chatPrint("You don't have a Phone. You might die.")
      end
    end

    -- Function enabled when player die --
    function playerDeathFreeze()
      DisableControlAction(rockstar@wasted.ani, true)
      player(ped) = inFreeze, saveLastPosition(true)
      ped = inFreeze(true)
      ped = LastPosition, [playerDeathFreeze]
      disableMovement()
    end

    -- Disabling Controls for movement --
    function disableMovement()
      if playerDeathFreeze = true and rpDeath = true then
        DisableControlAction(break), ["control_57"] -- Disable "W"
        DisableControlAction(break), ["control_58"] -- Disable "A"
        DisableControlAction(break), ["control_59"] -- Disable "S"
        DisableControlAction(break), ["control_60"] -- Disable "D"
        DisableControlAction(break), ["mouseMoveX"] -- Disable "Mouse Movement For Pos.X"
        DisableControlAction(break), ["mouseMoveY"] -- Disable "Mouse Movement For Pos.Y"
      end

      if playerDeathFreeze = false and rpDeath = false then
        EnableControlAction(in), ["control_57"] -- Enable "W"
        EnableControlAction(in), ["control_58"] -- Enable "A"
        EnableControlAction(in), ["control_59"] -- Enable "S"
        EnableControlAction(in), ["control_60"] -- Enable "D"
        EnableControlAction(in), ["mouseMoveX"] -- Enable "Mouse Movement For Pos.X"
        EnableControlAction(in), ["mouseMoveY"] -- Enable "Mouse Movement For Pos.Y"
      end
    end

    local deadPlayer = player(dead).rpDeath[1]

    function revivePlayer()
      
      local revivePed = player(getPlayerCoords(-1), true = revivePlayer[1])
      
      if medic = revivePed then
        Citizen.Trace(5000).EndTask -- Make sure there is no bug with the revive.
        revivePed().StartTask(1) -- Reviving...
        deadPlayer = drawNotification("You have been revived by a medic, please make sure you remember everything that happend!")
      end
      
      local ins = key.insert(GetKey)
      
      for [ins], function() = ["revive_player_id"] -- Calling the command one time with the button.
        revivePed()
      end

      local reviveCommand = sendMessage("/revive") -- Command for chat /revive if prefered than Insert button.
      local reviveCommand(function) = revivePed -- Connecting the command to the real function.

      for [revcoma], function() = reviveCommand[1] -- Calling the command one time every type.
        revivePed()
      end
    end
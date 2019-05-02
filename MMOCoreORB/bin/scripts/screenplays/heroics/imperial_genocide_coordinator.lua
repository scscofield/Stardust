local ObjectManager = require("managers.object.object_manager")

imperial_genocide_coordinator = ScreenPlay:new { 
  numberOfActs = 1, 
  questString = "imperial_genocide_coordinator_convo_queststring", --This needs to be unique! If not unique you will not pull the proper conversation.
  states = {}, --Blank, as we don't need screenplay states to teleport someone. It remains in-case we need to add it though.
  
  --This is basic quest related, doesn't harm and doesn't really do anything (I keep it for goodluck :P)
  questdata = Object:new {
    activePlayerName = "initial",
  },
  
  questItems = {
      quest2 = { template = "object/tangible/component/weapon/rancor_tooth.iff", displayName = "Ewok Tooth" },      
    },
  item1 = {
    lootGroup = "",
  },
  item2 = {
    lootGroup = "",
  },  
  item3 = {
    lootGroup = "",
  },  
  item4 = {
    lootGroup = "",
  },  
  item5 = {
    lootGroup = "",
  },  
  item6 = {
    lootGroup = "",
  },  
  item7 = {
    lootGroup = "",
  },  
  item8 = {
    lootGroup = "",
  },  
  item9 = {
    lootGroup = "",
  },  
  item10 = {
    lootGroup = "",
  },    
}

registerScreenPlay("imperial_genocide_coordinator", true) --Initialize the screenplay IAW the screenplay include

--Simply spawns the NPC
function imperial_genocide_coordinator:start()
   --spawnMobile("endor", "imperial_genocide_coordinator", 1, -119, 40, 3318, 180, 0)
end

--The actual conversation handler
imperial_genocide_coordinator_convo_handler = Object:new {
  
 }


function imperial_genocide_coordinator_convo_handler:getNextConversationScreen(pConversationTemplate, pConversingPlayer, selectedOption)
  local convosession = CreatureObject(pConversingPlayer):getConversationSession()

  local lastConversationScreen = nil

  if (convosession ~= nil) then
    local session = LuaConversationSession(convosession)
    lastConversationScreen = session:getLastConversationScreen()
  end

  local conversation = LuaConversationTemplate(pConversationTemplate)

  local nextConversationScreen

  if (lastConversationScreen ~= nil) then
    local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)

    --Get the linked screen for the selected option.
    local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)

    nextConversationScreen = conversation:getScreen(optionLink)

    if nextConversationScreen ~= nil then
      local nextLuaConversationScreen = LuaConversationScreen(nextConversationScreen)
    else
      nextConversationScreen = conversation:getScreen("imperial_genocide_coordinator_start")
    end
  else
    nextConversationScreen = conversation:getScreen("imperial_genocide_coordinator_start")
  end
  return nextConversationScreen
end


function imperial_genocide_coordinator_convo_handler:runScreenHandlers(pConversationTemplate, pConversingPlayer, pConversingNpc, selectedOption, pConversationScreen)
  local screen = LuaConversationScreen(pConversationScreen)
  local screenID = screen:getScreenID() 

  
  local player = LuaSceneObject(pConversingPlayer)
  
  
    
      

  if ( screenID == "item1" ) then
    local pInventory = CreatureObject(pConversingPlayer):getSlottedObject("inventory")
          local lootGroup = self.item1.lootGroup
      if pInventory == nil then
        return
      end     
   createLoot(pInventory, lootGroup, 0, true)
   self:removeQuestItem(pConversingPlayer, imperial_genocide_coordinator_convo_handler.questItems.quest2.template)
  end
  
  
  --print("returning convosvreen")
  return pConversationScreen
end


function imperial_genocide_coordinator_convo_handler:hasQuestItem(pPlayer, template)
  local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")
  return pInventory ~= nil and getContainerObjectByTemplate(pInventory, template, true) ~= nil
end

function imperial_genocide_coordinator_convo_handler:removeQuestItem(pPlayer, template)
  local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

  if (pInventory == nil) then
    return
  end

  local pItem = getContainerObjectByTemplate(pInventory, template, true)

  if (pItem ~= nil) then
    SceneObject(pItem):destroyObjectFromWorld()
    SceneObject(pItem):destroyObjectFromDatabase()
  end
end


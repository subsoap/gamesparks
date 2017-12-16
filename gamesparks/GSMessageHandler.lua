function createGSMessageHandler()
  local self = {
    callbacks = {}
  }
  
  local setHandler = function(messageType, callback)
    self.callbacks[messageType] = callback
  end
  
    local AchievementEarnedMessage = require("gamesparks.messages.AchievementEarnedMessage")
  
  local setAchievementEarnedMessageHandler = function(callback)
    setHandler(".AchievementEarnedMessage", callback)
  end
  
  local ChallengeAcceptedMessage = require("gamesparks.messages.ChallengeAcceptedMessage")
  
  local setChallengeAcceptedMessageHandler = function(callback)
    setHandler(".ChallengeAcceptedMessage", callback)
  end
  
  local ChallengeChangedMessage = require("gamesparks.messages.ChallengeChangedMessage")
  
  local setChallengeChangedMessageHandler = function(callback)
    setHandler(".ChallengeChangedMessage", callback)
  end
  
  local ChallengeChatMessage = require("gamesparks.messages.ChallengeChatMessage")
  
  local setChallengeChatMessageHandler = function(callback)
    setHandler(".ChallengeChatMessage", callback)
  end
  
  local ChallengeDeclinedMessage = require("gamesparks.messages.ChallengeDeclinedMessage")
  
  local setChallengeDeclinedMessageHandler = function(callback)
    setHandler(".ChallengeDeclinedMessage", callback)
  end
  
  local ChallengeDrawnMessage = require("gamesparks.messages.ChallengeDrawnMessage")
  
  local setChallengeDrawnMessageHandler = function(callback)
    setHandler(".ChallengeDrawnMessage", callback)
  end
  
  local ChallengeExpiredMessage = require("gamesparks.messages.ChallengeExpiredMessage")
  
  local setChallengeExpiredMessageHandler = function(callback)
    setHandler(".ChallengeExpiredMessage", callback)
  end
  
  local ChallengeIssuedMessage = require("gamesparks.messages.ChallengeIssuedMessage")
  
  local setChallengeIssuedMessageHandler = function(callback)
    setHandler(".ChallengeIssuedMessage", callback)
  end
  
  local ChallengeJoinedMessage = require("gamesparks.messages.ChallengeJoinedMessage")
  
  local setChallengeJoinedMessageHandler = function(callback)
    setHandler(".ChallengeJoinedMessage", callback)
  end
  
  local ChallengeLapsedMessage = require("gamesparks.messages.ChallengeLapsedMessage")
  
  local setChallengeLapsedMessageHandler = function(callback)
    setHandler(".ChallengeLapsedMessage", callback)
  end
  
  local ChallengeLostMessage = require("gamesparks.messages.ChallengeLostMessage")
  
  local setChallengeLostMessageHandler = function(callback)
    setHandler(".ChallengeLostMessage", callback)
  end
  
  local ChallengeStartedMessage = require("gamesparks.messages.ChallengeStartedMessage")
  
  local setChallengeStartedMessageHandler = function(callback)
    setHandler(".ChallengeStartedMessage", callback)
  end
  
  local ChallengeTurnTakenMessage = require("gamesparks.messages.ChallengeTurnTakenMessage")
  
  local setChallengeTurnTakenMessageHandler = function(callback)
    setHandler(".ChallengeTurnTakenMessage", callback)
  end
  
  local ChallengeWaitingMessage = require("gamesparks.messages.ChallengeWaitingMessage")
  
  local setChallengeWaitingMessageHandler = function(callback)
    setHandler(".ChallengeWaitingMessage", callback)
  end
  
  local ChallengeWithdrawnMessage = require("gamesparks.messages.ChallengeWithdrawnMessage")
  
  local setChallengeWithdrawnMessageHandler = function(callback)
    setHandler(".ChallengeWithdrawnMessage", callback)
  end
  
  local ChallengeWonMessage = require("gamesparks.messages.ChallengeWonMessage")
  
  local setChallengeWonMessageHandler = function(callback)
    setHandler(".ChallengeWonMessage", callback)
  end
  
  local FriendMessage = require("gamesparks.messages.FriendMessage")
  
  local setFriendMessageHandler = function(callback)
    setHandler(".FriendMessage", callback)
  end
  
  local GlobalRankChangedMessage = require("gamesparks.messages.GlobalRankChangedMessage")
  
  local setGlobalRankChangedMessageHandler = function(callback)
    setHandler(".GlobalRankChangedMessage", callback)
  end
  
  local MatchFoundMessage = require("gamesparks.messages.MatchFoundMessage")
  
  local setMatchFoundMessageHandler = function(callback)
    setHandler(".MatchFoundMessage", callback)
  end
  
  local MatchNotFoundMessage = require("gamesparks.messages.MatchNotFoundMessage")
  
  local setMatchNotFoundMessageHandler = function(callback)
    setHandler(".MatchNotFoundMessage", callback)
  end
  
  local MatchUpdatedMessage = require("gamesparks.messages.MatchUpdatedMessage")
  
  local setMatchUpdatedMessageHandler = function(callback)
    setHandler(".MatchUpdatedMessage", callback)
  end
  
  local NewHighScoreMessage = require("gamesparks.messages.NewHighScoreMessage")
  
  local setNewHighScoreMessageHandler = function(callback)
    setHandler(".NewHighScoreMessage", callback)
  end
  
  local NewTeamScoreMessage = require("gamesparks.messages.NewTeamScoreMessage")
  
  local setNewTeamScoreMessageHandler = function(callback)
    setHandler(".NewTeamScoreMessage", callback)
  end
  
  local ScriptMessage = require("gamesparks.messages.ScriptMessage")
  
  local setScriptMessageHandler = function(callback)
    setHandler(".ScriptMessage", callback)
  end
  
  local SessionTerminatedMessage = require("gamesparks.messages.SessionTerminatedMessage")
  
  local setSessionTerminatedMessageHandler = function(callback)
    setHandler(".SessionTerminatedMessage", callback)
  end
  
  local SocialRankChangedMessage = require("gamesparks.messages.SocialRankChangedMessage")
  
  local setSocialRankChangedMessageHandler = function(callback)
    setHandler(".SocialRankChangedMessage", callback)
  end
  
  local TeamChatMessage = require("gamesparks.messages.TeamChatMessage")
  
  local setTeamChatMessageHandler = function(callback)
    setHandler(".TeamChatMessage", callback)
  end
  
  local TeamRankChangedMessage = require("gamesparks.messages.TeamRankChangedMessage")
  
  local setTeamRankChangedMessageHandler = function(callback)
    setHandler(".TeamRankChangedMessage", callback)
  end
  
  local UploadCompleteMessage = require("gamesparks.messages.UploadCompleteMessage")
  
  local setUploadCompleteMessageHandler = function(callback)
    setHandler(".UploadCompleteMessage", callback)
  end
  
  
  local handle = function(message)
    
    local className = message["@class"]
    
    if className == nil or self.callbacks[className] == nil then
      return
    end
   	if className == ".AchievementEarnedMessage" then
      self.callbacks[className](AchievementEarnedMessage.new(message))
      return
    end
   	if className == ".ChallengeAcceptedMessage" then
      self.callbacks[className](ChallengeAcceptedMessage.new(message))
      return
    end
   	if className == ".ChallengeChangedMessage" then
      self.callbacks[className](ChallengeChangedMessage.new(message))
      return
    end
   	if className == ".ChallengeChatMessage" then
      self.callbacks[className](ChallengeChatMessage.new(message))
      return
    end
   	if className == ".ChallengeDeclinedMessage" then
      self.callbacks[className](ChallengeDeclinedMessage.new(message))
      return
    end
   	if className == ".ChallengeDrawnMessage" then
      self.callbacks[className](ChallengeDrawnMessage.new(message))
      return
    end
   	if className == ".ChallengeExpiredMessage" then
      self.callbacks[className](ChallengeExpiredMessage.new(message))
      return
    end
   	if className == ".ChallengeIssuedMessage" then
      self.callbacks[className](ChallengeIssuedMessage.new(message))
      return
    end
   	if className == ".ChallengeJoinedMessage" then
      self.callbacks[className](ChallengeJoinedMessage.new(message))
      return
    end
   	if className == ".ChallengeLapsedMessage" then
      self.callbacks[className](ChallengeLapsedMessage.new(message))
      return
    end
   	if className == ".ChallengeLostMessage" then
      self.callbacks[className](ChallengeLostMessage.new(message))
      return
    end
   	if className == ".ChallengeStartedMessage" then
      self.callbacks[className](ChallengeStartedMessage.new(message))
      return
    end
   	if className == ".ChallengeTurnTakenMessage" then
      self.callbacks[className](ChallengeTurnTakenMessage.new(message))
      return
    end
   	if className == ".ChallengeWaitingMessage" then
      self.callbacks[className](ChallengeWaitingMessage.new(message))
      return
    end
   	if className == ".ChallengeWithdrawnMessage" then
      self.callbacks[className](ChallengeWithdrawnMessage.new(message))
      return
    end
   	if className == ".ChallengeWonMessage" then
      self.callbacks[className](ChallengeWonMessage.new(message))
      return
    end
   	if className == ".FriendMessage" then
      self.callbacks[className](FriendMessage.new(message))
      return
    end
   	if className == ".GlobalRankChangedMessage" then
      self.callbacks[className](GlobalRankChangedMessage.new(message))
      return
    end
   	if className == ".MatchFoundMessage" then
      self.callbacks[className](MatchFoundMessage.new(message))
      return
    end
   	if className == ".MatchNotFoundMessage" then
      self.callbacks[className](MatchNotFoundMessage.new(message))
      return
    end
   	if className == ".MatchUpdatedMessage" then
      self.callbacks[className](MatchUpdatedMessage.new(message))
      return
    end
   	if className == ".NewHighScoreMessage" then
      self.callbacks[className](NewHighScoreMessage.new(message))
      return
    end
   	if className == ".NewTeamScoreMessage" then
      self.callbacks[className](NewTeamScoreMessage.new(message))
      return
    end
   	if className == ".ScriptMessage" then
      self.callbacks[className](ScriptMessage.new(message))
      return
    end
   	if className == ".SessionTerminatedMessage" then
      self.callbacks[className](SessionTerminatedMessage.new(message))
      return
    end
   	if className == ".SocialRankChangedMessage" then
      self.callbacks[className](SocialRankChangedMessage.new(message))
      return
    end
   	if className == ".TeamChatMessage" then
      self.callbacks[className](TeamChatMessage.new(message))
      return
    end
   	if className == ".TeamRankChangedMessage" then
      self.callbacks[className](TeamRankChangedMessage.new(message))
      return
    end
   	if className == ".UploadCompleteMessage" then
      self.callbacks[className](UploadCompleteMessage.new(message))
      return
    end
  end
        
 
  return {
    setAchievementEarnedMessageHandler = setAchievementEarnedMessageHandler,
    setChallengeAcceptedMessageHandler = setChallengeAcceptedMessageHandler,
    setChallengeChangedMessageHandler = setChallengeChangedMessageHandler,
    setChallengeChatMessageHandler = setChallengeChatMessageHandler,
    setChallengeDeclinedMessageHandler = setChallengeDeclinedMessageHandler,
    setChallengeDrawnMessageHandler = setChallengeDrawnMessageHandler,
    setChallengeExpiredMessageHandler = setChallengeExpiredMessageHandler,
    setChallengeIssuedMessageHandler = setChallengeIssuedMessageHandler,
    setChallengeJoinedMessageHandler = setChallengeJoinedMessageHandler,
    setChallengeLapsedMessageHandler = setChallengeLapsedMessageHandler,
    setChallengeLostMessageHandler = setChallengeLostMessageHandler,
    setChallengeStartedMessageHandler = setChallengeStartedMessageHandler,
    setChallengeTurnTakenMessageHandler = setChallengeTurnTakenMessageHandler,
    setChallengeWaitingMessageHandler = setChallengeWaitingMessageHandler,
    setChallengeWithdrawnMessageHandler = setChallengeWithdrawnMessageHandler,
    setChallengeWonMessageHandler = setChallengeWonMessageHandler,
    setFriendMessageHandler = setFriendMessageHandler,
    setGlobalRankChangedMessageHandler = setGlobalRankChangedMessageHandler,
    setMatchFoundMessageHandler = setMatchFoundMessageHandler,
    setMatchNotFoundMessageHandler = setMatchNotFoundMessageHandler,
    setMatchUpdatedMessageHandler = setMatchUpdatedMessageHandler,
    setNewHighScoreMessageHandler = setNewHighScoreMessageHandler,
    setNewTeamScoreMessageHandler = setNewTeamScoreMessageHandler,
    setScriptMessageHandler = setScriptMessageHandler,
    setSessionTerminatedMessageHandler = setSessionTerminatedMessageHandler,
    setSocialRankChangedMessageHandler = setSocialRankChangedMessageHandler,
    setTeamChatMessageHandler = setTeamChatMessageHandler,
    setTeamRankChangedMessageHandler = setTeamRankChangedMessageHandler,
    setUploadCompleteMessageHandler = setUploadCompleteMessageHandler,
    handle = handle
  }
end

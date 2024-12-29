BEGIN BFSMK25J

/* 
  Scenery Talks 
               */
/* Saradush */ 
IF ~Global("BFSSaradushTalk","GLOBAL",2)~ THEN BEGIN BFSMk2.SaradushDiscussion
SAY ~Feels good to be moving again. The elves weren't cruel ...but their silence spoke much.~ 
++ ~We saved their city. The least they could offer was shelter in return.~ + BFSMk2.UDeserveBetter
+ ~OR(2) Race(Player1,ELF) Race(Player1,HALF_ELF)~ + ~It wasn't the homecoming I hoped for. There was no belonging, not even among my own kind.~ + BFSMk2.KindredSpirits
+ ~!Race(Player1,ELF) !Race(Player1,HALF_ELF)~ + ~Elves only care for their own kind. We were always going to be seen as outsiders.~ + BFSMk2.UDeserveBetter
++ ~Irenicus was a monster of their making. Being on the receiving end of their ire, I now understand his anger.~ + BFSMk2.SeriousYikesLol
++ ~I'd prefer you let your silence speak too.~ EXIT
END 

IF ~~ THEN BEGIN BFSMk2.SeriousYikesLol
SAY ~He focused on his hatred. Can't start a new life that way. Have to cut away the rot before a wound can heal.~  
= ~The elves...~ 
IF ~~ + BFSMk2.UDeserveBetter
END

IF ~~ THEN BEGIN BFSMk2.KindredSpirits
SAY ~Worst wounds come from the people closest to you.~ 
IF ~~ + BFSMk2.UDeserveBetter
END

IF ~~ THEN BEGIN BFSMk2.UDeserveBetter
SAY ~They were hurt. Didn't want to be again. Striking out was easier for them. Doesn't make it right but that's often the way of things.~ 
IF ~~ + BFSMk2.Saradush
END

IF ~~ THEN BEGIN BFSMk2.Saradush
SAY ~Not like we could stay. Not with everyone out for your blood. It has to come to an end sometime.~ 
++ ~All the more reason for us to break this siege.~ + BFSMk2.BreakSiege
++ ~I don't care about the fate of the other Bhaalspawn, I only care about my own.~ + BFSMk2.CareSomething
++ ~Anyone who tries to use me will end up the same way Irenicus did.~ + BFSMk2.SaradushEnd
END

IF ~~ THEN BEGIN BFSMk2.BreakSiege
SAY ~Good. I never liked being caged.~ 
IF ~~ + BFSMk2.SaradushEnd
END

IF ~~ THEN BEGIN BFSMk2.SaradushEnd
SAY ~Step carefully, <CHARNAME>.~ 
IF ~Alignment("BFSMK",NEUTRAL_GOOD)~ + BFSMk2.SaradushGood
IF ~!Alignment("BFSMK",NEUTRAL_GOOD)~ + BFSMk2.SaradushNeutral
END

IF ~~ THEN BEGIN BFSMk2.SaradushGood
SAY ~I'd like to save them. All of them. But saving you'd be enough.~
IF ~~ DO ~SetGlobal("BFSSaradushTalk","GLOBAL",3)~ EXIT
END 

IF ~~ THEN BEGIN BFSMk2.SaradushNeutral 
SAY ~Don't care what happens to them. Do care what happens to you though.~
IF ~~ DO ~SetGlobal("BFSSaradushTalk","GLOBAL",3)~ EXIT
END 

IF ~~ THEN BEGIN BFSMk2.CareSomething
SAY ~Long as you care about something.~ 
IF ~~ DO ~SetGlobal("BFSSaradushTalk","GLOBAL",3)~ EXIT
END 		 
   
/*
  Interjections
               */			   
// Saradush, Orphan & Dad
I_C_T ORPHAN1 3 BFSMKORPHAN1
== BFSMK25J IF ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ THEN ~Soul's still nearby. He doesn't want to leave his kid. Should be easy to call him back - if we have the right magic.~
END

I_C_T ORPHAN2 1 BFSMKORPHAN2
== BFSMK25J IF ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ THEN ~Least he admits he was wrong. Often easier not to.~
END
			   
// Saradush, Bartender 
I_C_T SARBAR01 0 BFSMKSARBAR1
== SARBAR01 IF ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ THEN ~...the goblin may stay. We have had worse sorts around here lately. But, if it breaks anything, I'm holding you responsible.~
END

// Saradush, Bhaalspawn
I_C_T SARBHA02 1 BFSMKSARBHA1
== BFSMK25J IF ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ THEN ~Can't change what you are just by wishing. Need to accept it.~
END

// Saradush, Volo
EXTEND_TOP SARVOLO 9 #5
+ ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ + ~Tell me about M'Khiin.~ + BFSMKVoloBio
END

CHAIN SARVOLO BFSMKVoloBio
~Goblins are such fascinating creatures, too often overlooked, and none more-so than M'Khiin Grubdoubler. Leaving behind the cruelty of her tribe, she joined <CHARNAME> during <PRO_HISHER> travels, rising to heights of power believed unattainable by goblinkind.~
== BFSMK25J IF ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ THEN ~Should've known I'd end up a footnote in someone else's story.~
EXTERN SARVOLO 9

// Saradush, Melissan
I_C_T SARMEL01 34 BFSMKSARMEL1
== BFSMK25J IF ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ THEN ~Shouldn't be shouting at us. They started it.~
END

// Solar, Throne of Bhaal, Finale
I_C_T FINSOL01 27 BFSMK2Solar1
== BFSMK25J IF ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ THEN ~Lots you could do with that kind of power. Lots you could do without it too. Only wrong option is not choosing for yourself. Don't live with regret.~
END

// Saradush, Spirit
I_C_T SARSPIR 0 BFSMK2Spirit1
== BFSMK25J IF ~InParty("BFSMK") InMyArea("BFSMK") !StateCheck("BFSMK",CD_STATE_NOTVALID)~ THEN ~Can't tell much. Reckon he has unfinished business. We tend to that, then he passes on.~
END



pragma solidity 0.4.25;
import "./ZBGameMode.sol";

contract ZombiePile is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {

        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init();

        CardInstance[] memory player1Cards = new CardInstance[](gameState.playerStates[0].cardsInDeck.length);
        CardInstance[] memory player2Cards = new CardInstance[](gameState.playerStates[1].cardsInDeck.length);
        uint player1CardCount = 0;
        uint player2CardCount = 0;

        // Custom game logic will go here
        for(uint i=0; i < gameState.playerStates.length; i++) {
            for (uint j = 0; j < gameState.playerStates[i].cardsInDeck.length; j++) {
                uint rand = uint(keccak256(abi.encodePacked(now, player1CardCount + player2CardCount))) % 2;
            } //end for(j)

            changes.changePlayerCardsInDeck(Player(i), newCards, cardCount); //calls solidity function changePlayerCardsInDeck()
        } //end for(i)

        changes.emit();
    } //end function beforeMatchStarts()

} //end contract ZombiePile{}
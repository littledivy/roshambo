package;

import Random;
import js.jquery.*;
import js.Browser.*;

class Game {
  public function new() { }
  public function start(move: Move) {
    // Anonymous structures.
    var playerA = { name: "Simon", move: move }
    var playerB = { name: "Nicolas", move: Random.enumConstructor(Move) }
        
    // Array pattern matching. A switch can return a value.
    var result = switch [playerA.move, playerB.move] {
      case [Rock, Scissors] | 
           [Paper, Rock] |
           [Scissors, Paper]: Winner(playerA);
            
      case [Rock, Paper] |
           [Paper, Scissors] |
           [Scissors, Rock]: Winner(playerB);
            
      case _: Draw;
    }
    // Paper vs Rock, who wins?
    trace('result: $result');
  }  
}

class Main {
  // Haxe applications have a static entry point called main
  static function main() {
    new JQuery(function():Void {
      var newGame = new Game();
      new JQuery( "#stone" ).on( "click", function( event ) {
        newGame.start(Rock);
      });
      new JQuery( "#paper" ).on( "click", function( event ) {
        newGame.start(Paper);
      });
      new JQuery( "#scissor" ).on( "click", function( event ) {
        newGame.start(Scissors);
      });
    });
  }
}
            
// Allow anonymous structure named as type.
typedef Player = { name: String, move: Move }

// Define multiple enum values.
enum Move { Rock; Paper; Scissors; }

// Enums in Haxe are algebraic data type (ADT), so they can hold data.
enum Result { 
  Winner(player:Player); 
  Draw; 
}

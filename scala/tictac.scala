class Space(state: String) {


}

class Board(input: List[String]){

	//val rows = List[Space]
	val board = input

	def testWinningList(l: List[String]):Boolean = { 
		(l.indexOf("") == -1 ) &&
		(l.distinct.length == 1)
	}

	def testwin(board: List[String]){
		val sq = math.sqrt(board.length).toInt
		//var row = List[List[String]]() 
		//var diag1 = List[String]()
		val diag2 = List.tabulate(sq){i => board.apply(sq*(i+1) - (i+1))}
		if(this.testWinningList(diag2)){
			printf("Winner is %s\n",diag2.head)
			return			
		}

		val diag1 = List.tabulate(sq){i => board.apply(sq*i + i)}
		if(this.testWinningList(diag1)){
			printf("Winner is %s\n",diag1.head)
			return			
		}	

		val rows = List.tabulate(sq){
			j => List.tabulate(sq){
				k => board.apply(sq*j+k)
			}
		}
		for(i <- rows){
			if(this.testWinningList(i)){
				printf("Winner is %s\n",i.head)
				return 
			}
		}

		val cols = List.tabulate(sq){
			i => List.tabulate(sq){
				z => board.apply(i%sq + z*sq )
			}
		}
		for(i <- cols){
			if(this.testWinningList(i)){
				printf("Winner is %s\n",i.head)
				return 
			}
		}

		if(board.indexOf("") != -1 ) {
			println("there are still more moves!")
		} else {
			println("game is a tie")
		}

		

		// iteration 
		// modulo
	}
}

val b = new Board(List(
	"O","X","X",
	"X","O","O",
	"X","O","X"))
b.testwin(b.board)
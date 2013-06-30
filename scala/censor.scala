import scala.util.matching.Regex

class Texter

trait Censor{
	val mp =  Map(
		"darn"->"pucky",
		"shoot"->"beans")
	val k = mp.keys

	val b = new StringBuilder("(")

	val st = k.addString(b,")|(")

	b += ')'

	val re = new Regex("\\b"+st+"\\b".r)
	
	def censor(incoming: String) = {
		 this.re replaceAllIn (incoming, m =>  this.mp(m.matched)) 
	}

} 

class ConservativeTexter  extends Texter with Censor

val s = new ConservativeTexter

val sanitized = s.censor("darn tootin shoot argh stuff")
println(sanitized)
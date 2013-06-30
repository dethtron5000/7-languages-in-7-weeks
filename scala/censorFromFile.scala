import scala.util.matching.Regex
import scala.io.Source
import scala.language.postfixOps

class Texter

trait Censor{
	val sourcetext = Source.fromFile("replacements.txt").getLines

	val mp = sourcetext.map(_ split ":") collect { case Array(k, v) => (k, v) } toMap

	

	val k = mp.keys


	val b = new StringBuilder("(")

	val st = k.addString(b,")|(")

	b += ')'

	val re = new Regex("\\b"+st+"\\b")
	
	def censor(incoming: String) = {
		 this.re replaceAllIn (incoming, m =>  this.mp(m.matched)) 
	}

} 

class ConservativeTexter  extends Texter with Censor

val s = new ConservativeTexter

val sanitized = s.censor("darn tootin shoot argh frack stuff")
println(sanitized)
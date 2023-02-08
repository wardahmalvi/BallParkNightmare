//Ball Park Nightmare


// Taking a nostalgic tune (take me out to the ball game) and turning it into a sinister and unsettling experience was my goal. I wanted a delay so that the individual listening doesn't realize things are going wrong but already the tone of the original audio has been slowed down and then the high frequency pitches come in and everything falls apart pretty quickly after that. I changed the code to make the sound deeper and more drawn out. I also altered it to delay the start of the actual triggers, to add to the feeling of the sound. In this piece I am playing with the Pitch, Density, Context(which is mentioned above), and the sound itself is a mix of ultrasonic notes and infrasonic sounds, alongside the audio that's rate had been reduced.

b = Buffer.read(s,"C:/Users/WAlvi/Music/Ball Game.aiff");
(
{
	var triggered, omen, fear, end, dream, stop;
	triggered = Dust2.ar(density:2, add: 0.05); // I changed the code from Dust to Dust2 to make the impulse range deeper (as in go into the negatives)
	omen = TWChoose.kr(triggered, [1, 2, -2, -0.55],normalize:1);
	fear = TRand.ar(0,BufFrames.ir(b), triggered);
	stop = TDelay.ar(fear,dur:0.05);
	end = PlayBuf.ar(2, b,rate:0.65 ,loop: 1);
	dream = Phasor.ar(triggered, K2A.ar(omen), 0, BufFrames.ir(b), fear);
	BufWr.ar(end, b, dream);
	end
}.play;
)
b.free;

//references: Yota Morimoto's Tape Loop
//yotamorimoto self-destructing digital tape loop, https://youtu.be/TcsIVmG_QMc, a fragment plays while rewriting itself resulting in a decaying process.
// original song link: https://www.youtube.com/watch?v=9elKXRJeLsI&list=PL72UzKie6T1wEFnnr7Aj9jsVi2yevegM6&index=7

// death of a relationship

Game
 trigger        end  dream
	  triggered
                                   normalize
	fear
	stop =  Delay    fear
	end loop
	dream
	        end     dream
	end

free


﻿namespace RandomGeneratorInRange {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;  
    open Microsoft.Quantum.Measurement;  
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation GenerateRandomBit() : Result {
        using (q = Qubit()) {
            H(q);
            return MResetZ(q);
        }
    }
    operation RandomNumberInRange(max: Int, min:Int): Int {
        mutable output = 0;
        repeat {
            mutable bits = new Result[0];
            for (idx in 1..BitSizeI(max)){
                set bits += [GenerateRandomBit()]; 
            }
            set output = ResultArrayAsInt(bits);
        } until (output >= min and output <= max);
        return output;
    }

    @EntryPoint()
    operation Main(): Int {
        let max = 50;
        let min = 40;
        Message($"Sample a random number between {min} and {max}: ");
        return RandomNumberInRange(max, min);
    }
}


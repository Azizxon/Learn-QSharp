﻿namespace RandomGenerator {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;    
    open Microsoft.Quantum.Measurement;
    

    @EntryPoint()
    operation GenerateRandom() : Result {
       // Allocate a qubit.
        using (q = Qubit()) {
            // Put the qubit to superposition.
            H(q);
            // It now has a 50% chance of being measured 0 or 1.
            // Measure the qubit value.
            return MResetZ(q);
        }
    }
}


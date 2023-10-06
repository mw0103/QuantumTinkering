namespace QuantumTinkering {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    
    operation GenerateRandomBit() : Result {
        use q = Qubit();
        H(q);
        return M(q);
    }

    operation GenrateRandomNumnber(max:Int): Int{
        mutable output = 0;
        repeat{
            mutable bits = [];
            for i in 1..BitSizeI(max){
                set bits += [GenerateRandomBit()];
            }
            set output = ResultArrayAsInt(bits);
        }until (output <= max);
        return output;
    }

    @EntryPoint()
    operation SampleQuantumRandomNumberGenerator() : Int {
        return GenrateRandomNumnber(100);
    }
}

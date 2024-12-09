actor {
  stable var counter : Nat = 0;

  public query func getCount() : async Nat{
    return counter;
  };
  public func increment(): async Nat{
    counter+=1;

    counter
  };
  public func decrement(): async Nat{
    if(counter != 0)
      counter-=1;

    counter
  };
  public func reset() : async Nat {
    counter := 0;

    counter
  };
  public func addValue(value: Nat): async Nat{
    counter += value;
    value
  };
};

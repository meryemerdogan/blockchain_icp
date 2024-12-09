import Nat32 "mo:base/Nat32"; // we need NAT32 for trees
import Trie "mo:base/Trie";
import Option "mo:base/Option";
import List "mo:base/List";
import Text "mo:base/Text";
import Result "mo:base/Result";
actor {
  public type SuperHeroId = Nat32; // same as Nat32 but we know what value we're referring to
  
  public type SuperHero = {
    name :Text;
    powers: List.List<Text>;
  }; //like struct

  private stable var next: SuperHeroId = 0; // kinda global variable (not accessable but value is kept in memory)
  private stable var superheroes: Trie.Trie<SuperHeroId, SuperHero> = Trie.empty();

  public func create(newHero: SuperHero) : async SuperHeroId{
    let superHeroId = next;
    next+=1;
    
    superheroes := Trie.replace(
      superheroes,
      key(superHeroId),
      Nat32.equal,
      ?newHero
    ).0;
    superHeroId
  };

public func getHero(id:SuperHeroId) : async ?SuperHero {
    let result = Trie.find(
      superheroes,
      key(id),
      Nat32.equal
    );
    result
  };

  
  public func update(id :SuperHeroId, updateValue: SuperHero) : async Bool {
    let result = Trie.find(
        superheroes,
        key(id),
        Nat32.equal
    );
    let exists = Option.isSome(result);
    
    if(exists){
        superheroes := Trie.replace(
          superheroes,
          key(id),
          Nat32.equal,
          ?updateValue
        ).0;
    };
    true
  };
  private func key(x:SuperHeroId): Trie.Key<SuperHeroId>{
    {hash = x; key = x;}
  }
};

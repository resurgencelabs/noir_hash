use dep::std;


struct Nhash {
    val: u32,
    len: u32,
}

impl Nhash {
    fn new(v: u32) -> Self {
        Self { val: v, len: 31 as u32 }
    }

    fn bit(self, pos: u32) -> bool {
        constrain self.len >= pos;
        (self.val & ((1 as u32) << (pos))) != (0 as u32)
    }

    fn hashNat8(key : [u32]) -> Nhash {
        let mut hash : u32 = 0;
        for natOfKey in key {
            hash = hash + natOfKey;
            hash = hash + hash << 10;
            hash = hash ^ (hash >> 6);
        };
        hash = hash + hash << 3;
        hash = hash ^ (hash >> 11);
        hash = hash + hash << 15;
        Nhash::new(hash)
    }



    fn hash(n : u32) -> Nhash {
    
        Nhash::hashNat8([
        n & (255 << 0),
        n & (255 << 8),
        n & (255 << 16),
        n & (255 << 24)
        ])
  }

}


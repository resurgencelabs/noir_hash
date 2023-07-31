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
        assert (self.len >= pos);
        (self.val & (lshift(1 as u32, pos))) != (0 as u32)
    }

    fn hashNat8(key : [u32]) -> Nhash {
        let mut hash : u32 = 0;
        for natOfKey in key {
            hash = hash + natOfKey;
            hash = hash + lshift(hash, 10);
            hash = hash ^ rshift(hash, 6);
        };
        hash = hash + lshift(hash, 3);
        hash = hash ^ rshift(hash, 11);
        hash = hash + lshift(hash, 15);
        Nhash::new(hash)
    }



    fn hash(n : u32) -> Nhash {
    
        Nhash::hashNat8([
        n & lshift(255, 0),
        n & lshift(255, 8),
        n & lshift(255, 16),
        n & lshift(255, 24)
        ])
  }

}


fn rshift(a: u32, n: u32) -> u32 {
    assert (n < 64);
    let mut pow = 1;
    for i in 0..64{
        let mut j = i as u32;
        if j < n {
            pow = pow * 2;
        }
    };
    let mut val_final = a/pow;
    val_final
}

fn lshift(a: u32, n: u32) -> u32 {
    assert (n < 64);
    let mut pow = 1;
    for i in 0..64{
        let mut j = i as u32;
        if j < n {
            pow = pow * 2;
        }
    };
    if (n == 0){
        a
    }
    else {
        a*pow
    }
}


#[test]
fn test_create(){
    let nh = Nhash::new(3 as u32);
    assert (true);
}

#[test]
fn test_left_shift(){
    let lh = lshift(3, 3);
    assert (lh == 24);
}

#[test]
fn test_right_shift(){
    let rh = rshift(13, 2);
    assert (rh == 3);
}
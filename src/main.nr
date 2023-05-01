mod noir_hash;
use noir_hash::Nhash;
use dep::std;

fn main(x : u32, y : pub u32) {
    let nh = Nhash::new(x);
    let bit = Nhash::bit(nh, y);
    std::println(bit);
    //constrain 2 == f.pre;
    //let f2 = Float::increment(f);
    
    
    
    
}

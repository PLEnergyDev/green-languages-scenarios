fn main() {
    let args: Vec<String> = std::env::args().skip(1).collect();
    let degree: usize = args.get(0)
        .expect("Missing argument")
        .parse()
        .expect("Invalid integer");
    let x: f64 = args.get(1)
        .expect("Missing argument")
        .parse()
        .expect("Invalid float");

    let mut coeffs = vec![0.0; degree + 1];
    for i in 0..=degree {
        coeffs[degree - i] = 1.0 / (i + 1) as f64;
    }

    let mut result: f64 = 0.0;
    for r in 0..1000000 {
        let mut eval: f64 = 0.0;
        for i in 0..=degree {
            eval = coeffs[i] + x * eval;
        }
        result += eval;
    }

    println!("{:.6}", result / 1000000);
}

public class Program {
    static void run_benchmark(String[] args) {
        int m = Integer.parseInt(args[0]);
        double sum = 0.0;
        int n = 0;
        while (sum < m) {
            n++;
            sum += 1.0 / n;
        }
        System.out.printf("%d\n", n);
    }

    public static void main(String[] args) throws Throwable {
        Measurements measurements = new Measurements();
        while (true) {
            if (measurements.startMeasurement() == 0) break;
            run_benchmark(args);
            measurements.endMeasurement();
        }
    }
}

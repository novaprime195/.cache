public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("🚀 Hello World from Java in Docker!");
        System.out.println("📋 Running on Ubuntu with OpenJDK");
        
        // Simple Java features demo
        String name = "Docker Java App";
        int version = 2024;
        
        System.out.println("📦 Application: " + name);
        System.out.println("📅 Version: " + version);
        System.out.println("☕ Java Version: " + System.getProperty("java.version"));
        System.out.println("🐧 OS: " + System.getProperty("os.name"));
        
        // Simple loop
        System.out.println("\n🔢 Counting to 5:");
        for(int i = 1; i <= 5; i++) {
            System.out.println("   Count: " + i);
        }
        
        System.out.println("\n✅ Java application completed successfully!");
    }
}

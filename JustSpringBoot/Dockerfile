FROM java:8-jre
 
ADD app/lib/ /app/lib/
 
ADD app/ /app/
 
CMD ["java", "-cp", "/app/", "org.springframework.boot.loader.JarLauncher"]
 
EXPOSE 8080
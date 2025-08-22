# Use official Tomcat base image
FROM tomcat:9.0-jdk17

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your JSP source into Tomcat ROOT
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# Expose Render's default port
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]

package ING2projet.LaGuilde;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import java.util.concurrent.TimeUnit;

@SpringBootApplication
@ServletComponentScan
public class LaGuildeApplication {

	public static void main(String[] args) {

		SpringApplication.run(LaGuildeApplication.class, args);
	}

	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		// Register resource handler for images
		registry.addResourceHandler("/images/**").addResourceLocations("../Image/")
				.setCacheControl(CacheControl.maxAge(2, TimeUnit.HOURS).cachePublic());
	}

	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(LaGuildeApplication.class);
	}

}

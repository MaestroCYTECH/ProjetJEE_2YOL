package ING2projet.LaGuilde.storage;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.io.File;


@Component
@ConfigurationProperties(prefix = "storage")
public class StorageProperties {

    private String location = System.getProperty("user.dir")+File.separatorChar+"Image";

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

}
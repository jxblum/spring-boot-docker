package io.codeprimate.spring.boot.docker;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClient;

import lombok.Getter;

@SpringBootApplication
public class DockerizedSpringBootWebappApplication {

	public static void main(String[] args) {

		new SpringApplicationBuilder(DockerizedSpringBootWebappApplication.class)
			.web(WebApplicationType.SERVLET)
			.build()
			.run(args);
	}

	@Getter
	@RestController
	@RequestMapping("/app/docker")
	@SuppressWarnings("unused")
	static class IdentifierRestServiceController {

		@Value("${remote.server.port:8080}")
		private int remoteServerPort;

		@Value("${spring.application.name:X}")
		private String springApplicationName;

		@GetMapping("/instance/identifier")
		public String identifier() {
			return "<h1>%s</h1>".formatted(getSpringApplicationName());
		}

		@GetMapping("/remote/instance/identifier")
		public String remoteIdentifier() {


			return "<h1>%s</h1>".formatted(RestClient.builder()
				.baseUrl("http://localhost:%d/app/docker".formatted(getRemoteServerPort()))
				.build()
				.get()
				.uri("/instance/identifier")
				.retrieve()
				.body(String.class));
		}
	}
}

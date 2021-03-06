package net.tutorial.utilities;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import org.openstack4j.api.OSClient.OSClientV3;
import org.openstack4j.model.common.DLPayload;
import org.openstack4j.model.common.Identifier;
import org.openstack4j.model.common.Payloads;
import org.openstack4j.model.storage.object.SwiftObject;
import org.openstack4j.openstack.OSFactory;

public class ObjectStorageService {

	private static final String USERNAME = "admin_980e6d9465a4dc186fa0fba66cddc83c172c0408";
	private static final String PASSWORD = "w/lKpK5R7OY.Qr)c";
	private static final String DOMAIN_ID = "c37f2a5f68c34e2b98f780901612f3f2";
	private static final String PROJECT_ID = "2850c013ad0d4869b155b72bace9e3fd";
	private static final String OBJECT_STORAGE_AUTH_URL = "https://identity.open.softlayer.com/v3";

	private OSClientV3 os = null;

	public ObjectStorageService() {
		Identifier domainIdentifier = Identifier.byId(DOMAIN_ID);

		this.os = OSFactory.builderV3().endpoint(OBJECT_STORAGE_AUTH_URL)
					.credentials(USERNAME, PASSWORD, domainIdentifier).scopeToProject(Identifier.byId(PROJECT_ID))
					.authenticate();
	}
	
	public List<String> getDocumentList(String container) {

		List<String> documents = new ArrayList<String>();
		List<? extends SwiftObject> objs = this.os.objectStorage().objects().list(container);

		for (SwiftObject o : objs) {
			documents.add(o.getName());
		}

		return documents;
	}
	
	public InputStream  downloadFile(String container, String fileName) {
		
		SwiftObject fileObj = this.os.objectStorage().objects().get(container,fileName);
		DLPayload payload = fileObj.download();
		
		return payload.getInputStream();
	}
	
	public void uploadFile(String container, Part filePart) {
		
		String fileName = getFileName(filePart);
		
		try {
			String etag = this.os.objectStorage().objects().put(container, fileName, Payloads.create(filePart.getInputStream()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
	
	public void deleteFile(String container, String fileName) {
		this.os.objectStorage().objects().delete(container, fileName);
	}

}

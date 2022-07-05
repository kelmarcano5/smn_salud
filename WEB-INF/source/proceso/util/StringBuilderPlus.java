package proceso.util;

import dinamica.StringUtil;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

public class StringBuilderPlus {
	
	private final StringBuilder stringBuilder;
	private Optional<String> _logFile;
	private Optional<HttpServletRequest> _req;

	public StringBuilderPlus() {
		this.stringBuilder = new StringBuilder();
		this._logFile = Optional.empty();
		this._req = Optional.empty();
	}

	public StringBuilderPlus append(String message) {
		stringBuilder.append(message);
		return this;
	}

	public StringBuilderPlus appendLine(String message) {
		stringBuilder.append(message).append(System.lineSeparator());
		if (_logFile.isPresent() && !_logFile.get().equals(""))
			StringUtil.saveMessage(_logFile.get(), message);
		if (_req.isPresent()) {
			HttpServletRequest request = _req.get();
			request.setAttribute("mensaje", stringBuilder.toString());
		}
		stringBuilder.setLength(0);
		return this;
	}

	public StringBuilder getStringBuilder() {
		return stringBuilder;
	}
	
	public void clear() {
		stringBuilder.setLength(0);
	}
	
	public void activateLogFile(String _logFile) {
		this._logFile = Optional.of(_logFile);
	}
	
	public void activateUploadMessageRequest(HttpServletRequest _req) {
		this._req = Optional.of(_req);
	}

	@Override
	public String toString() {
		return stringBuilder.toString();
	}
	
}

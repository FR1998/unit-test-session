import logging

from copy import deepcopy
from uuid import uuid4


logger = logging.getLogger("project")


def get_client_ip_address(request_metadata):
    client_ip_addresses = {
        "HTTP_X_FORWARDED_FOR": request_metadata.get("HTTP_X_FORWARDED_FOR"),
        "X_FORWARDED_FOR": request_metadata.get("X_FORWARDED_FOR"),
        "X-Original-Forwarded-For": request_metadata.get("X-Original-Forwarded-For"),
        "X-Real-Ip": request_metadata.get("X-Real-Ip"),
        "REMOTE_ADDR": request_metadata.get("REMOTE_ADDR"),
    }

    return client_ip_addresses


class LoggingMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        logging_attributes = {
            "request_uri": request.build_absolute_uri(),
            "request_method": request.method,
            "http_referer": request.META.get("HTTP_REFERER", ""),
            "http_user_agent": request.META.get("HTTP_USER_AGENT", ""),
            "ip_address": get_client_ip_address(request.META),
            "status_code": None,
        }

        uuid = uuid4()
        logger.info(f"REQ {uuid} {request.path}", extra=logging_attributes)

        response = self.get_response(request)

        response_body = "-"
        if "application/json" in response.get("content-type", ""):
            response_body = deepcopy(response.data)

        status_code = response.status_code

        logging_attributes["status_code"] = status_code

        logger.info(f"RESP {uuid} {response_body}", extra=logging_attributes)

        return response

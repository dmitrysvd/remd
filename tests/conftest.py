import pytest
from jinja2 import FileSystemLoader

from semd_engine.core.renderer import CDARenderer
from semd_engine.registry.v290_r7.context import ConsultationProtocolV7RenderContext


@pytest.fixture
def renderer():
    r = CDARenderer("semd_engine/registry/v290_r7/templates")
    if isinstance(r.env.loader, FileSystemLoader):
        r.env.loader.searchpath.append("semd_engine/core/templates")
    r.register_context_model("main.xml.j2", ConsultationProtocolV7RenderContext)
    return r

package web.unitTest.controllerTest;

import static org.mockito.Mockito.*;
import static org.mockito.BDDMockito.*;

import funding.commons.Pagination;
import funding.controller.ProjectController;
import funding.dto.Category;
import funding.dto.Project;
import funding.service.face.ProjectService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InOrder;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.ArrayList;
import java.util.List;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@ExtendWith(MockitoExtension.class)
public class ProjectControllerTest {

    MockMvc mockMvc;

    @InjectMocks
    ProjectController projectController = new ProjectController();

    @Mock
    ProjectService projectService;

    @BeforeEach
    void setup() {
        this.mockMvc = MockMvcBuilders
                .standaloneSetup(projectController)
                .build();
    }

    @Test
    @DisplayName("프로젝트 리스트 가져오기")
    void list() throws Exception {
        // given
        Pagination pagination = new Pagination();
        pagination.setCategory("1");
        pagination.setFilter("4");
        pagination.setKeyword("검색어");
        pagination.setOrder("open_date");

        RequestBuilder request = MockMvcRequestBuilders
                .get("/project/list")
                .param("category", pagination.getCategory())
                .param("filter", pagination.getFilter())
                .param("keyword", pagination.getKeyword())
                .param("order", pagination.getOrder());

        List<Project> list = new ArrayList<>();
        given(projectService.getPageList(any())).willReturn(list);
        List<Category> cList = new ArrayList<>();
        given(projectService.getCategoryList()).willReturn(cList);

        // when
        ResultActions actual = this.mockMvc.perform(request);

        // then
        // 상태코드 200, viewName, model 값 확인
        actual
                //.andDo(print())
                .andExpectAll(
                        status().isOk()
                        , view().name("project/list")
                        // 같은 객체로 확인하면 안된다
                        // projectService.getPageList() 에서 변경될 수 있음
                        //, model().attribute("pagination", pagination)
                        , model().attributeExists("pagination")
                        , model().attribute("list", list)
                        , model().attribute("cList", cList)
                );
        // service 메서드 호출 여부 확인
        verify(projectService, times(1)).getPageList(any());
        verify(projectService, times(1)).getCategoryList();

    }
}

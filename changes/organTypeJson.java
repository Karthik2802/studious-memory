package com.HospitalEMR.patinentInfo.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class organTypeJson
 */
@WebServlet("/organTypeJson")
public class organTypeJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public organTypeJson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String organName = request.getParameter("organName");
        ArrayList list = new ArrayList();
      
        
        String json = null;

        if (organName.equals("HEAD AND NECK")) 
        {
                list.add("HEAD AND NECK - LARYNX");
                list.add("HEAD AND NECK - NASAL CAVITY");
                list.add("HEAD AND NECK - EYE");
                list.add("HEAD AND NECK - EAR");
                list.add("HEAD AND NECK - HYPOPHARYNX");
                list.add("HEAD AND NECK - OROPHARYNX");
                list.add("HEAD AND NECK - NASOPHARYNX");
                list.add("HEAD AND NECK - PARANASAL SINUSES");
                list.add("HEAD AND NECK - SALIVARY GLANDS");
                list.add("HEAD AND NECK - ORAL CAVITY");
                list.add("HEAD AND NECK - THYROID");
                list.add("HEAD AND NECK - PARAPHARANGEAL SPACE TUMORS");
                
              
                
        } 
       /* else if (organName.equals("BREAST")) 
        {
                list.add("BREAST");
                
        }*/
        else if(organName.equals("BRAIN"))
        {
        	list.add("BRAIN");
        }   
        
        else if (organName.equals("GYNAECOLOGICAL")) 
        {
            list.add("GYNAECOLOGICAL - UTERINE");
            list.add("GYNAECOLOGICAL - FALLOPIAN TUBE");
            list.add("GYNAECOLOGICAL - OVARIAN");
            list.add("GYNAECOLOGICAL - CERVIX");
            list.add("GYNAECOLOGICAL - VAGINA");
            list.add("GYNAECOLOGICAL - VULVA");
        }  
        else if (organName.equals("GASTRO INTESTINAL TRACT")) 
        {
            list.add("GASTRO INTESTINAL TRACT - ESOPHAGUS");
            list.add("GASTRO INTESTINAL TRACT - STOMACH");
            list.add("GASTRO INTESTINAL TRACT - COLORECTAL");
            list.add("GASTRO INTESTINAL TRACT - INTESTINAL ");
            list.add("GASTRO INTESTINAL TRACT - ANAL");
        }
        else if (organName.equals("GENITO URINARY")) 
        {
            list.add("GENITO URINARY - KIDNEY");
            list.add("GENITO URINARY - URINARY BLADDER");
            list.add("GENITO URINARY - URETERS");
            list.add("GENITO URINARY - PROSTRATE");
            list.add("GENITO URINARY - URETHRA");
            list.add("GENITO URINARY - TESTIS");
            list.add("GENITO URINARY - PENIS");
        }
        /*else if (organName.equals("LUNG")) 
        {
            list.add("LUNG - SMALL CELL");
            list.add("LUNG - NON SMALL CELL");
            
        }*/
        
        else if (organName.equals("THROAX")) 	
        {
            list.add("THROAX");
           
            
        }
        
        else if (organName.equals("HEPATOPANCREATO BILIARY")) 
        {
            list.add("HEPATOPANCREATO BILIARY - LIVER");
            list.add("HEPATOPANCREATO BILIARY - PANCREAS");
            list.add("HEPATOPANCREATO BILIARY - GALL BLADDER");
            list.add("HEPATOPANCREATO BILIARY - BILE DUCT");
            list.add("HEPATOPANCREATO BILIARY - AMPULLA");
        }
        else if (organName.equals("SKIN MALIGNANCY")) 
        {
            list.add("SKIN MALIGNANCY");
        }
        else if (organName.equals("MUSCULOSKELETAL")) 
        {
            list.add("MUSCULOSKELETAL - SOFT TISSUE SARCOMA");
            list.add("MUSCULOSKELETAL - BONE TUMORS");
            
        }
        else if (organName.equals("LYMPHOMAS")) 
        {
            list.add("LYMPHOMAS");
        }
        else if (organName.equals("LEUKEMIAS")) 
        {
            list.add("LEUKEMIAS");
        }
        else if (organName.equals("MYELOMAS")) 
        {
            list.add("MYELOMAS");
        }
        else if (organName.equals("UNASSIGNED")) 
        {
            list.add("UNASSIGNED");
        }
        else if (organName.equals("Select organ"))
        {
                list.add("Select Sub types");
        }

        json = new Gson().toJson(list);
        response.setContentType("application/json");
        response.getWriter().write(json);
		
	}
	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

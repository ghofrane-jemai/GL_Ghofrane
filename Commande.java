/***********************************************************************
 * Module:  Commande.java
 * Author:  user
 * Purpose: Defines the Class Commande
 ***********************************************************************/

import java.util.*;

/** @pdOid a438096f-7ebc-4f7f-860c-2fa266d340a9 */
public class Commande extends Observer {
   /** @pdOid ce33690c-bc1c-48f0-b8b4-2dd80003bc8b */
   private int numCmd;
   /** @pdOid 3c5aaff2-bd7a-413e-bc8a-4b652baa231e */
   private Date dateCreation;
   /** @pdOid 7ee7b748-5f3c-41f0-a8c2-bfd9df8d491a */
   private Date dateEnvoi;
   /** @pdOid a8f66455-21f8-4f95-88e4-f402f672442e */
   private String nomClient;
   /** @pdOid 7d68da1f-0fe7-4ffe-9321-cb5fdfa299a8 */
   private int numClient;
   /** @pdOid 06c587c7-aa35-4ace-a80a-792b6dfcf62f */
   private String statut;
   /** @pdOid 92e4db9e-5441-442b-bcfb-d7e36686ab4b */
   private int numEnvoi;
   
   /** @pdOid 1ca4cf4f-f3f6-4189-9e6b-59c94b48d9ca */
   public void confimerCommande() {
      // TODO: implement
   }

}
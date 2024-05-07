// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LaunchDetailsQuery: GraphQLQuery {
  public static let operationName: String = "LaunchDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query LaunchDetails($launchId: ID!) { launch(id: $launchId) { __typename id site mission { __typename name missionPatch(size: LARGE) } rocket { __typename name type } isBooked } }"#
    ))

  public var launchId: ID

  public init(launchId: ID) {
    self.launchId = launchId
  }

  public var __variables: Variables? { ["launchId": launchId] }

  public struct Data: CodegenConfig.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CodegenConfig.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("launch", Launch?.self, arguments: ["id": .variable("launchId")]),
    ] }

    public var launch: Launch? { __data["launch"] }

    /// Launch
    ///
    /// Parent Type: `Launch`
    public struct Launch: CodegenConfig.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CodegenConfig.Objects.Launch }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", CodegenConfig.ID.self),
        .field("site", String?.self),
        .field("mission", Mission?.self),
        .field("rocket", Rocket?.self),
        .field("isBooked", Bool.self),
      ] }

      public var id: CodegenConfig.ID { __data["id"] }
      public var site: String? { __data["site"] }
      public var mission: Mission? { __data["mission"] }
      public var rocket: Rocket? { __data["rocket"] }
      public var isBooked: Bool { __data["isBooked"] }

      /// Launch.Mission
      ///
      /// Parent Type: `Mission`
      public struct Mission: CodegenConfig.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CodegenConfig.Objects.Mission }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("missionPatch", String?.self, arguments: ["size": "LARGE"]),
        ] }

        public var name: String? { __data["name"] }
        public var missionPatch: String? { __data["missionPatch"] }
      }

      /// Launch.Rocket
      ///
      /// Parent Type: `Rocket`
      public struct Rocket: CodegenConfig.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CodegenConfig.Objects.Rocket }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("type", String?.self),
        ] }

        public var name: String? { __data["name"] }
        public var type: String? { __data["type"] }
      }
    }
  }
}

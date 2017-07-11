//  This file was automatically generated and should not be edited.

import Apollo

/// Emojis that can be attached to Issues, Pull Requests and Comments.
public enum ReactionContent: String {
  case thumbsUp = "THUMBS_UP" /// Represents the 👍 emoji.
  case thumbsDown = "THUMBS_DOWN" /// Represents the 👎 emoji.
  case laugh = "LAUGH" /// Represents the 😄 emoji.
  case hooray = "HOORAY" /// Represents the 🎉 emoji.
  case confused = "CONFUSED" /// Represents the 😕 emoji.
  case heart = "HEART" /// Represents the ❤️ emoji.
}

extension ReactionContent: Apollo.JSONDecodable, Apollo.JSONEncodable {}

/// The possible states of a pull request review.
public enum PullRequestReviewState: String {
  case pending = "PENDING" /// A review that has not yet been submitted.
  case commented = "COMMENTED" /// An informational review.
  case approved = "APPROVED" /// A review allowing the pull request to merge.
  case changesRequested = "CHANGES_REQUESTED" /// A review blocking the pull request from merging.
  case dismissed = "DISMISSED" /// A review that has been dismissed.
}

extension PullRequestReviewState: Apollo.JSONDecodable, Apollo.JSONEncodable {}

public final class AddReactionMutation: GraphQLMutation {
  public static let operationString =
    "mutation AddReaction($subject_id: ID!, $content: ReactionContent!) {" +
    "  addReaction(input: {subjectId: $subject_id, content: $content}) {" +
    "    __typename" +
    "    subject {" +
    "      __typename" +
    "      ...reactionFields" +
    "    }" +
    "  }" +
    "}"
  public static var requestString: String { return operationString.appending(ReactionFields.fragmentString) }

  public var subject_id: GraphQLID
  public var content: ReactionContent

  public init(subject_id: GraphQLID, content: ReactionContent) {
    self.subject_id = subject_id
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["subject_id": subject_id, "content": content]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [Selection] = [
      Field("addReaction", arguments: ["input": ["subjectId": Variable("subject_id"), "content": Variable("content")]], type: .object(Data.AddReaction.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(addReaction: AddReaction? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "addReaction": addReaction])
    }

    /// Adds a reaction to a subject.
    public var addReaction: AddReaction? {
      get {
        return (snapshot["addReaction"]! as! Snapshot?).flatMap { AddReaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "addReaction")
      }
    }

    public struct AddReaction: GraphQLSelectionSet {
      public static let possibleTypes = ["AddReactionPayload"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("subject", type: .nonNull(.object(AddReaction.Subject.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(subject: Subject) {
        self.init(snapshot: ["__typename": "AddReactionPayload", "subject": subject])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The reactable subject.
      public var subject: Subject {
        get {
          return Subject(snapshot: snapshot["subject"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "subject")
        }
      }

      public struct Subject: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue", "CommitComment", "PullRequest", "IssueComment", "PullRequestReviewComment"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("viewerCanReact", type: .nonNull(.scalar(Bool.self))),
          Field("reactionGroups", type: .list(.nonNull(.object(Subject.ReactionGroup.self)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeIssue(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "Issue", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public static func makeCommitComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "CommitComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public static func makePullRequest(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "PullRequest", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public static func makeIssueComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "IssueComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public static func makePullRequestReviewComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "PullRequestReviewComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Can user react to this subject
        public var viewerCanReact: Bool {
          get {
            return snapshot["viewerCanReact"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "viewerCanReact")
          }
        }

        /// A list of reactions grouped by content left on the subject.
        public var reactionGroups: [ReactionGroup]? {
          get {
            return (snapshot["reactionGroups"]! as! [Snapshot]?).flatMap { $0.map { ReactionGroup(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "reactionGroups")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var reactionFields: ReactionFields {
            get {
              return ReactionFields(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }

        public struct ReactionGroup: GraphQLSelectionSet {
          public static let possibleTypes = ["ReactionGroup"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("viewerHasReacted", type: .nonNull(.scalar(Bool.self))),
            Field("users", type: .nonNull(.object(ReactionGroup.User.self))),
            Field("content", type: .nonNull(.scalar(ReactionContent.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(viewerHasReacted: Bool, users: User, content: ReactionContent) {
            self.init(snapshot: ["__typename": "ReactionGroup", "viewerHasReacted": viewerHasReacted, "users": users, "content": content])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Whether or not the authenticated user has left a reaction on the subject.
          public var viewerHasReacted: Bool {
            get {
              return snapshot["viewerHasReacted"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "viewerHasReacted")
            }
          }

          /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
          public var users: User {
            get {
              return User(snapshot: snapshot["users"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "users")
            }
          }

          /// Identifies the emoji reaction.
          public var content: ReactionContent {
            get {
              return snapshot["content"]! as! ReactionContent
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes = ["ReactingUserConnection"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("totalCount", type: .nonNull(.scalar(Int.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(totalCount: Int) {
              self.init(snapshot: ["__typename": "ReactingUserConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return snapshot["totalCount"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "totalCount")
              }
            }
          }
        }
      }
    }
  }
}

public final class IssueOrPullRequestQuery: GraphQLQuery {
  public static let operationString =
    "query IssueOrPullRequest($owner: String!, $repo: String!, $number: Int!, $page_size: Int!) {" +
    "  repository(owner: $owner, name: $repo) {" +
    "    __typename" +
    "    name" +
    "    issueOrPullRequest(number: $number) {" +
    "      __typename" +
    "      ... on Issue {" +
    "        __typename" +
    "        timeline(first: $page_size) {" +
    "          __typename" +
    "          nodes {" +
    "            __typename" +
    "            ... on Commit {" +
    "              __typename" +
    "              author {" +
    "                __typename" +
    "                name" +
    "                date" +
    "              }" +
    "              messageHeadline" +
    "            }" +
    "            ... on IssueComment {" +
    "              __typename" +
    "              ...nodeFields" +
    "              ...reactionFields" +
    "              ...commentFields" +
    "            }" +
    "            ... on LabeledEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              label {" +
    "                __typename" +
    "                color" +
    "                name" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on UnlabeledEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              label {" +
    "                __typename" +
    "                color" +
    "                name" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ClosedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ReopenedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on RenamedTitleEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "              currentTitle" +
    "            }" +
    "            ... on LockedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on UnlockedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ReferencedEvent {" +
    "              __typename" +
    "              createdAt" +
    "              ...nodeFields" +
    "              refCommit: commit {" +
    "                __typename" +
    "                oid" +
    "              }" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              commitRepository {" +
    "                __typename" +
    "                ...referencedRepositoryFields" +
    "              }" +
    "              subject {" +
    "                __typename" +
    "                ... on Issue {" +
    "                  __typename" +
    "                  title" +
    "                  number" +
    "                  closed" +
    "                }" +
    "                ... on PullRequest {" +
    "                  __typename" +
    "                  title" +
    "                  number" +
    "                  closed" +
    "                  merged" +
    "                }" +
    "              }" +
    "            }" +
    "          }" +
    "        }" +
    "        ...reactionFields" +
    "        ...commentFields" +
    "        ...lockableFields" +
    "        ...closableFields" +
    "        ...labelableFields" +
    "        ...updatableFields" +
    "        ...nodeFields" +
    "        number" +
    "        title" +
    "      }" +
    "      ... on PullRequest {" +
    "        __typename" +
    "        timeline(first: $page_size) {" +
    "          __typename" +
    "          nodes {" +
    "            __typename" +
    "            ... on Commit {" +
    "              __typename" +
    "              author {" +
    "                __typename" +
    "                name" +
    "                date" +
    "              }" +
    "              messageHeadline" +
    "            }" +
    "            ... on IssueComment {" +
    "              __typename" +
    "              ...nodeFields" +
    "              ...reactionFields" +
    "              ...commentFields" +
    "            }" +
    "            ... on LabeledEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              label {" +
    "                __typename" +
    "                color" +
    "                name" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on UnlabeledEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              label {" +
    "                __typename" +
    "                color" +
    "                name" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ClosedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ReopenedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on RenamedTitleEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "              currentTitle" +
    "            }" +
    "            ... on LockedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on UnlockedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on MergedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              commit {" +
    "                __typename" +
    "                oid" +
    "              }" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on PullRequestReviewThread {" +
    "              __typename" +
    "              comments(first: $page_size) {" +
    "                __typename" +
    "                nodes {" +
    "                  __typename" +
    "                  ...reactionFields" +
    "                  ...nodeFields" +
    "                  ...commentFields" +
    "                  path" +
    "                  diffHunk" +
    "                }" +
    "              }" +
    "            }" +
    "            ... on PullRequestReview {" +
    "              __typename" +
    "              ...nodeFields" +
    "              ...commentFields" +
    "              state" +
    "              submittedAt" +
    "              author {" +
    "                __typename" +
    "                login" +
    "              }" +
    "            }" +
    "            ... on ReferencedEvent {" +
    "              __typename" +
    "              createdAt" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              commitRepository {" +
    "                __typename" +
    "                ...referencedRepositoryFields" +
    "              }" +
    "              subject {" +
    "                __typename" +
    "                ... on Issue {" +
    "                  __typename" +
    "                  title" +
    "                  number" +
    "                  closed" +
    "                }" +
    "                ... on PullRequest {" +
    "                  __typename" +
    "                  title" +
    "                  number" +
    "                  closed" +
    "                  merged" +
    "                }" +
    "              }" +
    "            }" +
    "          }" +
    "        }" +
    "        ...reactionFields" +
    "        ...commentFields" +
    "        ...lockableFields" +
    "        ...closableFields" +
    "        ...labelableFields" +
    "        ...updatableFields" +
    "        ...nodeFields" +
    "        number" +
    "        title" +
    "        merged" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public static var requestString: String { return operationString.appending(NodeFields.fragmentString).appending(ReactionFields.fragmentString).appending(CommentFields.fragmentString).appending(ReferencedRepositoryFields.fragmentString).appending(LockableFields.fragmentString).appending(ClosableFields.fragmentString).appending(LabelableFields.fragmentString).appending(UpdatableFields.fragmentString) }

  public var owner: String
  public var repo: String
  public var number: Int
  public var page_size: Int

  public init(owner: String, repo: String, number: Int, page_size: Int) {
    self.owner = owner
    self.repo = repo
    self.number = number
    self.page_size = page_size
  }

  public var variables: GraphQLMap? {
    return ["owner": owner, "repo": repo, "number": number, "page_size": page_size]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [Selection] = [
      Field("repository", arguments: ["owner": Variable("owner"), "name": Variable("repo")], type: .object(Data.Repository.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(repository: Repository? = nil) {
      self.init(snapshot: ["__typename": "Query", "repository": repository])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (snapshot["repository"]! as! Snapshot?).flatMap { Repository(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
        Field("issueOrPullRequest", arguments: ["number": Variable("number")], type: .object(Repository.IssueOrPullRequest.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String, issueOrPullRequest: IssueOrPullRequest? = nil) {
        self.init(snapshot: ["__typename": "Repository", "name": name, "issueOrPullRequest": issueOrPullRequest])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the repository.
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// Returns a single issue-like object from the current repository by number.
      public var issueOrPullRequest: IssueOrPullRequest? {
        get {
          return (snapshot["issueOrPullRequest"]! as! Snapshot?).flatMap { IssueOrPullRequest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "issueOrPullRequest")
        }
      }

      public struct IssueOrPullRequest: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue", "PullRequest"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          FragmentSpread(IssueOrPullRequest.AsIssue.self),
          FragmentSpread(IssueOrPullRequest.AsPullRequest.self),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeIssue(timeline: AsIssue.Timeline, viewerCanReact: Bool, reactionGroups: [AsIssue.ReactionGroup]? = nil, author: AsIssue.Author? = nil, editor: AsIssue.Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool, locked: Bool, closed: Bool, labels: AsIssue.Label? = nil, viewerCanUpdate: Bool, id: GraphQLID, number: Int, title: String) -> IssueOrPullRequest {
          return IssueOrPullRequest(snapshot: ["__typename": "Issue", "timeline": timeline, "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor, "locked": locked, "closed": closed, "labels": labels, "viewerCanUpdate": viewerCanUpdate, "id": id, "number": number, "title": title])
        }

        public static func makePullRequest(timeline: AsPullRequest.Timeline, viewerCanReact: Bool, reactionGroups: [AsPullRequest.ReactionGroup]? = nil, author: AsPullRequest.Author? = nil, editor: AsPullRequest.Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool, locked: Bool, closed: Bool, labels: AsPullRequest.Label? = nil, viewerCanUpdate: Bool, id: GraphQLID, number: Int, title: String, merged: Bool) -> IssueOrPullRequest {
          return IssueOrPullRequest(snapshot: ["__typename": "PullRequest", "timeline": timeline, "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor, "locked": locked, "closed": closed, "labels": labels, "viewerCanUpdate": viewerCanUpdate, "id": id, "number": number, "title": title, "merged": merged])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asIssue: AsIssue? {
          get {
            if !AsIssue.possibleTypes.contains(__typename) { return nil }
            return AsIssue(snapshot: snapshot)
          }
          set {
            guard let newValue = newValue else { return }
            snapshot = newValue.snapshot
          }
        }

        public var asPullRequest: AsPullRequest? {
          get {
            if !AsPullRequest.possibleTypes.contains(__typename) { return nil }
            return AsPullRequest(snapshot: snapshot)
          }
          set {
            guard let newValue = newValue else { return }
            snapshot = newValue.snapshot
          }
        }

        public struct AsIssue: GraphQLFragment {
          public static let possibleTypes = ["Issue"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("timeline", arguments: ["first": Variable("page_size")], type: .nonNull(.object(AsIssue.Timeline.self))),
            Field("viewerCanReact", type: .nonNull(.scalar(Bool.self))),
            Field("reactionGroups", type: .list(.nonNull(.object(AsIssue.ReactionGroup.self)))),
            Field("author", type: .object(AsIssue.Author.self)),
            Field("editor", type: .object(AsIssue.Editor.self)),
            Field("body", type: .nonNull(.scalar(String.self))),
            Field("createdAt", type: .nonNull(.scalar(String.self))),
            Field("viewerDidAuthor", type: .nonNull(.scalar(Bool.self))),
            Field("locked", type: .nonNull(.scalar(Bool.self))),
            Field("closed", type: .nonNull(.scalar(Bool.self))),
            Field("labels", arguments: ["first": 100], type: .object(AsIssue.Label.self)),
            Field("viewerCanUpdate", type: .nonNull(.scalar(Bool.self))),
            Field("id", type: .nonNull(.scalar(GraphQLID.self))),
            Field("number", type: .nonNull(.scalar(Int.self))),
            Field("title", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(timeline: Timeline, viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil, author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool, locked: Bool, closed: Bool, labels: Label? = nil, viewerCanUpdate: Bool, id: GraphQLID, number: Int, title: String) {
            self.init(snapshot: ["__typename": "Issue", "timeline": timeline, "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor, "locked": locked, "closed": closed, "labels": labels, "viewerCanUpdate": viewerCanUpdate, "id": id, "number": number, "title": title])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of events associated with an Issue.
          public var timeline: Timeline {
            get {
              return Timeline(snapshot: snapshot["timeline"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "timeline")
            }
          }

          /// Can user react to this subject
          public var viewerCanReact: Bool {
            get {
              return snapshot["viewerCanReact"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "viewerCanReact")
            }
          }

          /// A list of reactions grouped by content left on the subject.
          public var reactionGroups: [ReactionGroup]? {
            get {
              return (snapshot["reactionGroups"]! as! [Snapshot]?).flatMap { $0.map { ReactionGroup(snapshot: $0) } }
            }
            set {
              snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "reactionGroups")
            }
          }

          /// The actor who authored the comment.
          public var author: Author? {
            get {
              return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "author")
            }
          }

          /// The actor who edited the comment.
          public var editor: Editor? {
            get {
              return (snapshot["editor"]! as! Snapshot?).flatMap { Editor(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "editor")
            }
          }

          /// Identifies the body of the issue.
          public var body: String {
            get {
              return snapshot["body"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "body")
            }
          }

          /// Identifies the date and time when the object was created.
          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// Did the viewer author this comment.
          public var viewerDidAuthor: Bool {
            get {
              return snapshot["viewerDidAuthor"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "viewerDidAuthor")
            }
          }

          /// `true` if the object is locked
          public var locked: Bool {
            get {
              return snapshot["locked"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "locked")
            }
          }

          /// true if the object is `closed` (definition of closed may depend on type)
          public var closed: Bool {
            get {
              return snapshot["closed"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "closed")
            }
          }

          /// A list of labels associated with the object.
          public var labels: Label? {
            get {
              return (snapshot["labels"]! as! Snapshot?).flatMap { Label(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "labels")
            }
          }

          /// Check if the current viewer can update this object.
          public var viewerCanUpdate: Bool {
            get {
              return snapshot["viewerCanUpdate"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "viewerCanUpdate")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          /// Identifies the issue number.
          public var number: Int {
            get {
              return snapshot["number"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "number")
            }
          }

          /// Identifies the issue title.
          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var reactionFields: ReactionFields {
              get {
                return ReactionFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var commentFields: CommentFields {
              get {
                return CommentFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var lockableFields: LockableFields {
              get {
                return LockableFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var closableFields: ClosableFields {
              get {
                return ClosableFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var labelableFields: LabelableFields {
              get {
                return LabelableFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var updatableFields: UpdatableFields {
              get {
                return UpdatableFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var nodeFields: NodeFields {
              get {
                return NodeFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }

          public struct Timeline: GraphQLSelectionSet {
            public static let possibleTypes = ["IssueTimelineConnection"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("nodes", type: .list(.object(Timeline.Node.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(nodes: [Node?]? = nil) {
              self.init(snapshot: ["__typename": "IssueTimelineConnection", "nodes": nodes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of nodes.
            public var nodes: [Node?]? {
              get {
                return (snapshot["nodes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
              }
              set {
                snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes = ["Commit", "IssueComment", "ClosedEvent", "ReopenedEvent", "SubscribedEvent", "UnsubscribedEvent", "ReferencedEvent", "AssignedEvent", "UnassignedEvent", "LabeledEvent", "UnlabeledEvent", "MilestonedEvent", "DemilestonedEvent", "RenamedTitleEvent", "LockedEvent", "UnlockedEvent"]

              public static let selections: [Selection] = [
                Field("__typename", type: .nonNull(.scalar(String.self))),
                FragmentSpread(Node.AsCommit.self),
                FragmentSpread(Node.AsIssueComment.self),
                FragmentSpread(Node.AsLabeledEvent.self),
                FragmentSpread(Node.AsUnlabeledEvent.self),
                FragmentSpread(Node.AsClosedEvent.self),
                FragmentSpread(Node.AsReopenedEvent.self),
                FragmentSpread(Node.AsRenamedTitleEvent.self),
                FragmentSpread(Node.AsLockedEvent.self),
                FragmentSpread(Node.AsUnlockedEvent.self),
                FragmentSpread(Node.AsReferencedEvent.self),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public static func makeCommit(author: AsCommit.Author? = nil, messageHeadline: String) -> Node {
                return Node(snapshot: ["__typename": "Commit", "author": author, "messageHeadline": messageHeadline])
              }

              public static func makeIssueComment(author: AsIssueComment.Author? = nil, id: GraphQLID, viewerCanReact: Bool, reactionGroups: [AsIssueComment.ReactionGroup]? = nil, editor: AsIssueComment.Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> Node {
                return Node(snapshot: ["__typename": "IssueComment", "author": author, "id": id, "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
              }

              public static func makeClosedEvent(id: GraphQLID, createdAt: String, actor: AsClosedEvent.Actor? = nil) -> Node {
                return Node(snapshot: ["__typename": "ClosedEvent", "id": id, "createdAt": createdAt, "actor": actor])
              }

              public static func makeReopenedEvent(id: GraphQLID, createdAt: String, actor: AsReopenedEvent.Actor? = nil) -> Node {
                return Node(snapshot: ["__typename": "ReopenedEvent", "id": id, "createdAt": createdAt, "actor": actor])
              }

              public static func makeSubscribedEvent() -> Node {
                return Node(snapshot: ["__typename": "SubscribedEvent"])
              }

              public static func makeUnsubscribedEvent() -> Node {
                return Node(snapshot: ["__typename": "UnsubscribedEvent"])
              }

              public static func makeReferencedEvent(id: GraphQLID, createdAt: String, actor: AsReferencedEvent.Actor? = nil, refCommit: AsReferencedEvent.RefCommit? = nil, commitRepository: AsReferencedEvent.CommitRepository, subject: AsReferencedEvent.Subject) -> Node {
                return Node(snapshot: ["__typename": "ReferencedEvent", "id": id, "createdAt": createdAt, "actor": actor, "refCommit": refCommit, "commitRepository": commitRepository, "subject": subject])
              }

              public static func makeAssignedEvent() -> Node {
                return Node(snapshot: ["__typename": "AssignedEvent"])
              }

              public static func makeUnassignedEvent() -> Node {
                return Node(snapshot: ["__typename": "UnassignedEvent"])
              }

              public static func makeLabeledEvent(id: GraphQLID, createdAt: String, actor: AsLabeledEvent.Actor? = nil, label: AsLabeledEvent.Label) -> Node {
                return Node(snapshot: ["__typename": "LabeledEvent", "id": id, "createdAt": createdAt, "actor": actor, "label": label])
              }

              public static func makeUnlabeledEvent(id: GraphQLID, createdAt: String, actor: AsUnlabeledEvent.Actor? = nil, label: AsUnlabeledEvent.Label) -> Node {
                return Node(snapshot: ["__typename": "UnlabeledEvent", "id": id, "createdAt": createdAt, "actor": actor, "label": label])
              }

              public static func makeMilestonedEvent() -> Node {
                return Node(snapshot: ["__typename": "MilestonedEvent"])
              }

              public static func makeDemilestonedEvent() -> Node {
                return Node(snapshot: ["__typename": "DemilestonedEvent"])
              }

              public static func makeRenamedTitleEvent(id: GraphQLID, createdAt: String, actor: AsRenamedTitleEvent.Actor? = nil, currentTitle: String) -> Node {
                return Node(snapshot: ["__typename": "RenamedTitleEvent", "id": id, "createdAt": createdAt, "actor": actor, "currentTitle": currentTitle])
              }

              public static func makeLockedEvent(id: GraphQLID, createdAt: String, actor: AsLockedEvent.Actor? = nil) -> Node {
                return Node(snapshot: ["__typename": "LockedEvent", "id": id, "createdAt": createdAt, "actor": actor])
              }

              public static func makeUnlockedEvent(id: GraphQLID, createdAt: String, actor: AsUnlockedEvent.Actor? = nil) -> Node {
                return Node(snapshot: ["__typename": "UnlockedEvent", "id": id, "createdAt": createdAt, "actor": actor])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var asCommit: AsCommit? {
                get {
                  if !AsCommit.possibleTypes.contains(__typename) { return nil }
                  return AsCommit(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asIssueComment: AsIssueComment? {
                get {
                  if !AsIssueComment.possibleTypes.contains(__typename) { return nil }
                  return AsIssueComment(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asLabeledEvent: AsLabeledEvent? {
                get {
                  if !AsLabeledEvent.possibleTypes.contains(__typename) { return nil }
                  return AsLabeledEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asUnlabeledEvent: AsUnlabeledEvent? {
                get {
                  if !AsUnlabeledEvent.possibleTypes.contains(__typename) { return nil }
                  return AsUnlabeledEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asClosedEvent: AsClosedEvent? {
                get {
                  if !AsClosedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsClosedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asReopenedEvent: AsReopenedEvent? {
                get {
                  if !AsReopenedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsReopenedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asRenamedTitleEvent: AsRenamedTitleEvent? {
                get {
                  if !AsRenamedTitleEvent.possibleTypes.contains(__typename) { return nil }
                  return AsRenamedTitleEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asLockedEvent: AsLockedEvent? {
                get {
                  if !AsLockedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsLockedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asUnlockedEvent: AsUnlockedEvent? {
                get {
                  if !AsUnlockedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsUnlockedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asReferencedEvent: AsReferencedEvent? {
                get {
                  if !AsReferencedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsReferencedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public struct AsCommit: GraphQLFragment {
                public static let possibleTypes = ["Commit"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("author", type: .object(AsCommit.Author.self)),
                  Field("messageHeadline", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(author: Author? = nil, messageHeadline: String) {
                  self.init(snapshot: ["__typename": "Commit", "author": author, "messageHeadline": messageHeadline])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Authorship details of the commit.
                public var author: Author? {
                  get {
                    return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "author")
                  }
                }

                /// The Git commit message headline
                public var messageHeadline: String {
                  get {
                    return snapshot["messageHeadline"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "messageHeadline")
                  }
                }

                public struct Author: GraphQLSelectionSet {
                  public static let possibleTypes = ["GitActor"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("name", type: .scalar(String.self)),
                    Field("date", type: .scalar(String.self)),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(name: String? = nil, date: String? = nil) {
                    self.init(snapshot: ["__typename": "GitActor", "name": name, "date": date])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The name in the Git commit.
                  public var name: String? {
                    get {
                      return snapshot["name"]! as! String?
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }

                  /// The timestamp of the Git action (authoring or committing).
                  public var date: String? {
                    get {
                      return snapshot["date"]! as! String?
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "date")
                    }
                  }
                }
              }

              public struct AsIssueComment: GraphQLFragment {
                public static let possibleTypes = ["IssueComment"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("author", type: .object(AsIssueComment.Author.self)),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("viewerCanReact", type: .nonNull(.scalar(Bool.self))),
                  Field("reactionGroups", type: .list(.nonNull(.object(AsIssueComment.ReactionGroup.self)))),
                  Field("editor", type: .object(AsIssueComment.Editor.self)),
                  Field("body", type: .nonNull(.scalar(String.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("viewerDidAuthor", type: .nonNull(.scalar(Bool.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(author: Author? = nil, id: GraphQLID, viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) {
                  self.init(snapshot: ["__typename": "IssueComment", "author": author, "id": id, "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The actor who authored the comment.
                public var author: Author? {
                  get {
                    return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "author")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Can user react to this subject
                public var viewerCanReact: Bool {
                  get {
                    return snapshot["viewerCanReact"]! as! Bool
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "viewerCanReact")
                  }
                }

                /// A list of reactions grouped by content left on the subject.
                public var reactionGroups: [ReactionGroup]? {
                  get {
                    return (snapshot["reactionGroups"]! as! [Snapshot]?).flatMap { $0.map { ReactionGroup(snapshot: $0) } }
                  }
                  set {
                    snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "reactionGroups")
                  }
                }

                /// The actor who edited the comment.
                public var editor: Editor? {
                  get {
                    return (snapshot["editor"]! as! Snapshot?).flatMap { Editor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "editor")
                  }
                }

                /// Identifies the comment body.
                public var body: String {
                  get {
                    return snapshot["body"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "body")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Did the viewer author this comment.
                public var viewerDidAuthor: Bool {
                  get {
                    return snapshot["viewerDidAuthor"]! as! Bool
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "viewerDidAuthor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }

                  public var reactionFields: ReactionFields {
                    get {
                      return ReactionFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }

                  public var commentFields: CommentFields {
                    get {
                      return CommentFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Author: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                    Field("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String, avatarUrl: String) -> Author {
                    return Author(snapshot: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                  }

                  public static func makeBot(login: String, avatarUrl: String) -> Author {
                    return Author(snapshot: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }

                  /// A URL pointing to the actor's public avatar.
                  public var avatarUrl: String {
                    get {
                      return snapshot["avatarUrl"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "avatarUrl")
                    }
                  }
                }

                public struct ReactionGroup: GraphQLSelectionSet {
                  public static let possibleTypes = ["ReactionGroup"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("viewerHasReacted", type: .nonNull(.scalar(Bool.self))),
                    Field("users", type: .nonNull(.object(ReactionGroup.User.self))),
                    Field("content", type: .nonNull(.scalar(ReactionContent.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(viewerHasReacted: Bool, users: User, content: ReactionContent) {
                    self.init(snapshot: ["__typename": "ReactionGroup", "viewerHasReacted": viewerHasReacted, "users": users, "content": content])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Whether or not the authenticated user has left a reaction on the subject.
                  public var viewerHasReacted: Bool {
                    get {
                      return snapshot["viewerHasReacted"]! as! Bool
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "viewerHasReacted")
                    }
                  }

                  /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
                  public var users: User {
                    get {
                      return User(snapshot: snapshot["users"]! as! Snapshot)
                    }
                    set {
                      snapshot.updateValue(newValue.snapshot, forKey: "users")
                    }
                  }

                  /// Identifies the emoji reaction.
                  public var content: ReactionContent {
                    get {
                      return snapshot["content"]! as! ReactionContent
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "content")
                    }
                  }

                  public struct User: GraphQLSelectionSet {
                    public static let possibleTypes = ["ReactingUserConnection"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("totalCount", type: .nonNull(.scalar(Int.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(totalCount: Int) {
                      self.init(snapshot: ["__typename": "ReactingUserConnection", "totalCount": totalCount])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the total count of items in the connection.
                    public var totalCount: Int {
                      get {
                        return snapshot["totalCount"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "totalCount")
                      }
                    }
                  }
                }

                public struct Editor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Editor {
                    return Editor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Editor {
                    return Editor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsLabeledEvent: GraphQLFragment {
                public static let possibleTypes = ["LabeledEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsLabeledEvent.Actor.self)),
                  Field("label", type: .nonNull(.object(AsLabeledEvent.Label.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, label: Label) {
                  self.init(snapshot: ["__typename": "LabeledEvent", "id": id, "createdAt": createdAt, "actor": actor, "label": label])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'label' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the label associated with the 'labeled' event.
                public var label: Label {
                  get {
                    return Label(snapshot: snapshot["label"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "label")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public struct Label: GraphQLSelectionSet {
                  public static let possibleTypes = ["Label"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("color", type: .nonNull(.scalar(String.self))),
                    Field("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(color: String, name: String) {
                    self.init(snapshot: ["__typename": "Label", "color": color, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Identifies the label color.
                  public var color: String {
                    get {
                      return snapshot["color"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "color")
                    }
                  }

                  /// Identifies the label name.
                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }
                }
              }

              public struct AsUnlabeledEvent: GraphQLFragment {
                public static let possibleTypes = ["UnlabeledEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsUnlabeledEvent.Actor.self)),
                  Field("label", type: .nonNull(.object(AsUnlabeledEvent.Label.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, label: Label) {
                  self.init(snapshot: ["__typename": "UnlabeledEvent", "id": id, "createdAt": createdAt, "actor": actor, "label": label])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'unlabel' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the label associated with the 'unlabeled' event.
                public var label: Label {
                  get {
                    return Label(snapshot: snapshot["label"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "label")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public struct Label: GraphQLSelectionSet {
                  public static let possibleTypes = ["Label"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("color", type: .nonNull(.scalar(String.self))),
                    Field("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(color: String, name: String) {
                    self.init(snapshot: ["__typename": "Label", "color": color, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Identifies the label color.
                  public var color: String {
                    get {
                      return snapshot["color"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "color")
                    }
                  }

                  /// Identifies the label name.
                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }
                }
              }

              public struct AsClosedEvent: GraphQLFragment {
                public static let possibleTypes = ["ClosedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsClosedEvent.Actor.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil) {
                  self.init(snapshot: ["__typename": "ClosedEvent", "id": id, "createdAt": createdAt, "actor": actor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who closed the item.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsReopenedEvent: GraphQLFragment {
                public static let possibleTypes = ["ReopenedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsReopenedEvent.Actor.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil) {
                  self.init(snapshot: ["__typename": "ReopenedEvent", "id": id, "createdAt": createdAt, "actor": actor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who reopened the item.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsRenamedTitleEvent: GraphQLFragment {
                public static let possibleTypes = ["RenamedTitleEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsRenamedTitleEvent.Actor.self)),
                  Field("currentTitle", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, currentTitle: String) {
                  self.init(snapshot: ["__typename": "RenamedTitleEvent", "id": id, "createdAt": createdAt, "actor": actor, "currentTitle": currentTitle])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'renamed' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the current title of the issue or pull request.
                public var currentTitle: String {
                  get {
                    return snapshot["currentTitle"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "currentTitle")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsLockedEvent: GraphQLFragment {
                public static let possibleTypes = ["LockedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsLockedEvent.Actor.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil) {
                  self.init(snapshot: ["__typename": "LockedEvent", "id": id, "createdAt": createdAt, "actor": actor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'locked' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsUnlockedEvent: GraphQLFragment {
                public static let possibleTypes = ["UnlockedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsUnlockedEvent.Actor.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil) {
                  self.init(snapshot: ["__typename": "UnlockedEvent", "id": id, "createdAt": createdAt, "actor": actor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'unlocked' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsReferencedEvent: GraphQLFragment {
                public static let possibleTypes = ["ReferencedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsReferencedEvent.Actor.self)),
                  Field("commit", alias: "refCommit", type: .object(AsReferencedEvent.RefCommit.self)),
                  Field("commitRepository", type: .nonNull(.object(AsReferencedEvent.CommitRepository.self))),
                  Field("subject", type: .nonNull(.object(AsReferencedEvent.Subject.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, refCommit: RefCommit? = nil, commitRepository: CommitRepository, subject: Subject) {
                  self.init(snapshot: ["__typename": "ReferencedEvent", "id": id, "createdAt": createdAt, "actor": actor, "refCommit": refCommit, "commitRepository": commitRepository, "subject": subject])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'label' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the commit associated with the 'referenced' event.
                public var refCommit: RefCommit? {
                  get {
                    return (snapshot["refCommit"]! as! Snapshot?).flatMap { RefCommit(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "refCommit")
                  }
                }

                /// Identifies the repository associated with the 'referenced' event.
                public var commitRepository: CommitRepository {
                  get {
                    return CommitRepository(snapshot: snapshot["commitRepository"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "commitRepository")
                  }
                }

                /// Object referenced by event.
                public var subject: Subject {
                  get {
                    return Subject(snapshot: snapshot["subject"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "subject")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public struct RefCommit: GraphQLSelectionSet {
                  public static let possibleTypes = ["Commit"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("oid", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(oid: String) {
                    self.init(snapshot: ["__typename": "Commit", "oid": oid])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The Git object ID
                  public var oid: String {
                    get {
                      return snapshot["oid"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "oid")
                    }
                  }
                }

                public struct CommitRepository: GraphQLSelectionSet {
                  public static let possibleTypes = ["Repository"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("name", type: .nonNull(.scalar(String.self))),
                    Field("owner", type: .nonNull(.object(CommitRepository.Owner.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(name: String, owner: Owner) {
                    self.init(snapshot: ["__typename": "Repository", "name": name, "owner": owner])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The name of the repository.
                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }

                  /// The User owner of the repository.
                  public var owner: Owner {
                    get {
                      return Owner(snapshot: snapshot["owner"]! as! Snapshot)
                    }
                    set {
                      snapshot.updateValue(newValue.snapshot, forKey: "owner")
                    }
                  }

                  public var fragments: Fragments {
                    get {
                      return Fragments(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }

                  public struct Fragments {
                    public var snapshot: Snapshot

                    public var referencedRepositoryFields: ReferencedRepositoryFields {
                      get {
                        return ReferencedRepositoryFields(snapshot: snapshot)
                      }
                      set {
                        snapshot = newValue.snapshot
                      }
                    }
                  }

                  public struct Owner: GraphQLSelectionSet {
                    public static let possibleTypes = ["Organization", "User"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("login", type: .nonNull(.scalar(String.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public static func makeOrganization(login: String) -> Owner {
                      return Owner(snapshot: ["__typename": "Organization", "login": login])
                    }

                    public static func makeUser(login: String) -> Owner {
                      return Owner(snapshot: ["__typename": "User", "login": login])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The username used to login.
                    public var login: String {
                      get {
                        return snapshot["login"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "login")
                      }
                    }
                  }
                }

                public struct Subject: GraphQLSelectionSet {
                  public static let possibleTypes = ["Issue", "PullRequest"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    FragmentSpread(Subject.AsIssue.self),
                    FragmentSpread(Subject.AsPullRequest.self),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeIssue(title: String, number: Int, closed: Bool) -> Subject {
                    return Subject(snapshot: ["__typename": "Issue", "title": title, "number": number, "closed": closed])
                  }

                  public static func makePullRequest(title: String, number: Int, closed: Bool, merged: Bool) -> Subject {
                    return Subject(snapshot: ["__typename": "PullRequest", "title": title, "number": number, "closed": closed, "merged": merged])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var asIssue: AsIssue? {
                    get {
                      if !AsIssue.possibleTypes.contains(__typename) { return nil }
                      return AsIssue(snapshot: snapshot)
                    }
                    set {
                      guard let newValue = newValue else { return }
                      snapshot = newValue.snapshot
                    }
                  }

                  public var asPullRequest: AsPullRequest? {
                    get {
                      if !AsPullRequest.possibleTypes.contains(__typename) { return nil }
                      return AsPullRequest(snapshot: snapshot)
                    }
                    set {
                      guard let newValue = newValue else { return }
                      snapshot = newValue.snapshot
                    }
                  }

                  public struct AsIssue: GraphQLFragment {
                    public static let possibleTypes = ["Issue"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("title", type: .nonNull(.scalar(String.self))),
                      Field("number", type: .nonNull(.scalar(Int.self))),
                      Field("closed", type: .nonNull(.scalar(Bool.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(title: String, number: Int, closed: Bool) {
                      self.init(snapshot: ["__typename": "Issue", "title": title, "number": number, "closed": closed])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the issue title.
                    public var title: String {
                      get {
                        return snapshot["title"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "title")
                      }
                    }

                    /// Identifies the issue number.
                    public var number: Int {
                      get {
                        return snapshot["number"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "number")
                      }
                    }

                    /// true if the object is `closed` (definition of closed may depend on type)
                    public var closed: Bool {
                      get {
                        return snapshot["closed"]! as! Bool
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "closed")
                      }
                    }
                  }

                  public struct AsPullRequest: GraphQLFragment {
                    public static let possibleTypes = ["PullRequest"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("title", type: .nonNull(.scalar(String.self))),
                      Field("number", type: .nonNull(.scalar(Int.self))),
                      Field("closed", type: .nonNull(.scalar(Bool.self))),
                      Field("merged", type: .nonNull(.scalar(Bool.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(title: String, number: Int, closed: Bool, merged: Bool) {
                      self.init(snapshot: ["__typename": "PullRequest", "title": title, "number": number, "closed": closed, "merged": merged])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the pull request title.
                    public var title: String {
                      get {
                        return snapshot["title"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "title")
                      }
                    }

                    /// Identifies the pull request number.
                    public var number: Int {
                      get {
                        return snapshot["number"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "number")
                      }
                    }

                    /// true if the object is `closed` (definition of closed may depend on type)
                    public var closed: Bool {
                      get {
                        return snapshot["closed"]! as! Bool
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "closed")
                      }
                    }

                    /// Whether or not the pull request was merged.
                    public var merged: Bool {
                      get {
                        return snapshot["merged"]! as! Bool
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "merged")
                      }
                    }
                  }
                }
              }
            }
          }

          public struct ReactionGroup: GraphQLSelectionSet {
            public static let possibleTypes = ["ReactionGroup"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("viewerHasReacted", type: .nonNull(.scalar(Bool.self))),
              Field("users", type: .nonNull(.object(ReactionGroup.User.self))),
              Field("content", type: .nonNull(.scalar(ReactionContent.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(viewerHasReacted: Bool, users: User, content: ReactionContent) {
              self.init(snapshot: ["__typename": "ReactionGroup", "viewerHasReacted": viewerHasReacted, "users": users, "content": content])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Whether or not the authenticated user has left a reaction on the subject.
            public var viewerHasReacted: Bool {
              get {
                return snapshot["viewerHasReacted"]! as! Bool
              }
              set {
                snapshot.updateValue(newValue, forKey: "viewerHasReacted")
              }
            }

            /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
            public var users: User {
              get {
                return User(snapshot: snapshot["users"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "users")
              }
            }

            /// Identifies the emoji reaction.
            public var content: ReactionContent {
              get {
                return snapshot["content"]! as! ReactionContent
              }
              set {
                snapshot.updateValue(newValue, forKey: "content")
              }
            }

            public struct User: GraphQLSelectionSet {
              public static let possibleTypes = ["ReactingUserConnection"]

              public static let selections: [Selection] = [
                Field("__typename", type: .nonNull(.scalar(String.self))),
                Field("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int) {
                self.init(snapshot: ["__typename": "ReactingUserConnection", "totalCount": totalCount])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return snapshot["totalCount"]! as! Int
                }
                set {
                  snapshot.updateValue(newValue, forKey: "totalCount")
                }
              }
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes = ["User", "Bot"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("login", type: .nonNull(.scalar(String.self))),
              Field("avatarUrl", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeUser(login: String, avatarUrl: String) -> Author {
              return Author(snapshot: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
            }

            public static func makeBot(login: String, avatarUrl: String) -> Author {
              return Author(snapshot: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username of the actor.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }

            /// A URL pointing to the actor's public avatar.
            public var avatarUrl: String {
              get {
                return snapshot["avatarUrl"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "avatarUrl")
              }
            }
          }

          public struct Editor: GraphQLSelectionSet {
            public static let possibleTypes = ["User", "Bot"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("login", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeUser(login: String) -> Editor {
              return Editor(snapshot: ["__typename": "User", "login": login])
            }

            public static func makeBot(login: String) -> Editor {
              return Editor(snapshot: ["__typename": "Bot", "login": login])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username of the actor.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }
          }

          public struct Label: GraphQLSelectionSet {
            public static let possibleTypes = ["LabelConnection"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("nodes", type: .list(.object(Label.Node.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(nodes: [Node?]? = nil) {
              self.init(snapshot: ["__typename": "LabelConnection", "nodes": nodes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of nodes.
            public var nodes: [Node?]? {
              get {
                return (snapshot["nodes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
              }
              set {
                snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes = ["Label"]

              public static let selections: [Selection] = [
                Field("__typename", type: .nonNull(.scalar(String.self))),
                Field("color", type: .nonNull(.scalar(String.self))),
                Field("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(color: String, name: String) {
                self.init(snapshot: ["__typename": "Label", "color": color, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the label color.
              public var color: String {
                get {
                  return snapshot["color"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "color")
                }
              }

              /// Identifies the label name.
              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }
            }
          }
        }

        public struct AsPullRequest: GraphQLFragment {
          public static let possibleTypes = ["PullRequest"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("timeline", arguments: ["first": Variable("page_size")], type: .nonNull(.object(AsPullRequest.Timeline.self))),
            Field("viewerCanReact", type: .nonNull(.scalar(Bool.self))),
            Field("reactionGroups", type: .list(.nonNull(.object(AsPullRequest.ReactionGroup.self)))),
            Field("author", type: .object(AsPullRequest.Author.self)),
            Field("editor", type: .object(AsPullRequest.Editor.self)),
            Field("body", type: .nonNull(.scalar(String.self))),
            Field("createdAt", type: .nonNull(.scalar(String.self))),
            Field("viewerDidAuthor", type: .nonNull(.scalar(Bool.self))),
            Field("locked", type: .nonNull(.scalar(Bool.self))),
            Field("closed", type: .nonNull(.scalar(Bool.self))),
            Field("labels", arguments: ["first": 100], type: .object(AsPullRequest.Label.self)),
            Field("viewerCanUpdate", type: .nonNull(.scalar(Bool.self))),
            Field("id", type: .nonNull(.scalar(GraphQLID.self))),
            Field("number", type: .nonNull(.scalar(Int.self))),
            Field("title", type: .nonNull(.scalar(String.self))),
            Field("merged", type: .nonNull(.scalar(Bool.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(timeline: Timeline, viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil, author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool, locked: Bool, closed: Bool, labels: Label? = nil, viewerCanUpdate: Bool, id: GraphQLID, number: Int, title: String, merged: Bool) {
            self.init(snapshot: ["__typename": "PullRequest", "timeline": timeline, "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor, "locked": locked, "closed": closed, "labels": labels, "viewerCanUpdate": viewerCanUpdate, "id": id, "number": number, "title": title, "merged": merged])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of events associated with a PullRequest.
          public var timeline: Timeline {
            get {
              return Timeline(snapshot: snapshot["timeline"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "timeline")
            }
          }

          /// Can user react to this subject
          public var viewerCanReact: Bool {
            get {
              return snapshot["viewerCanReact"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "viewerCanReact")
            }
          }

          /// A list of reactions grouped by content left on the subject.
          public var reactionGroups: [ReactionGroup]? {
            get {
              return (snapshot["reactionGroups"]! as! [Snapshot]?).flatMap { $0.map { ReactionGroup(snapshot: $0) } }
            }
            set {
              snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "reactionGroups")
            }
          }

          /// The actor who authored the comment.
          public var author: Author? {
            get {
              return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "author")
            }
          }

          /// The actor who edited this pull request's body.
          public var editor: Editor? {
            get {
              return (snapshot["editor"]! as! Snapshot?).flatMap { Editor(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "editor")
            }
          }

          /// Identifies the body of the pull request.
          public var body: String {
            get {
              return snapshot["body"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "body")
            }
          }

          /// Identifies the date and time when the object was created.
          public var createdAt: String {
            get {
              return snapshot["createdAt"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// Did the viewer author this comment.
          public var viewerDidAuthor: Bool {
            get {
              return snapshot["viewerDidAuthor"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "viewerDidAuthor")
            }
          }

          /// `true` if the object is locked
          public var locked: Bool {
            get {
              return snapshot["locked"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "locked")
            }
          }

          /// true if the object is `closed` (definition of closed may depend on type)
          public var closed: Bool {
            get {
              return snapshot["closed"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "closed")
            }
          }

          /// A list of labels associated with the object.
          public var labels: Label? {
            get {
              return (snapshot["labels"]! as! Snapshot?).flatMap { Label(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "labels")
            }
          }

          /// Check if the current viewer can update this object.
          public var viewerCanUpdate: Bool {
            get {
              return snapshot["viewerCanUpdate"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "viewerCanUpdate")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          /// Identifies the pull request number.
          public var number: Int {
            get {
              return snapshot["number"]! as! Int
            }
            set {
              snapshot.updateValue(newValue, forKey: "number")
            }
          }

          /// Identifies the pull request title.
          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          /// Whether or not the pull request was merged.
          public var merged: Bool {
            get {
              return snapshot["merged"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "merged")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var reactionFields: ReactionFields {
              get {
                return ReactionFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var commentFields: CommentFields {
              get {
                return CommentFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var lockableFields: LockableFields {
              get {
                return LockableFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var closableFields: ClosableFields {
              get {
                return ClosableFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var labelableFields: LabelableFields {
              get {
                return LabelableFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var updatableFields: UpdatableFields {
              get {
                return UpdatableFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public var nodeFields: NodeFields {
              get {
                return NodeFields(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }

          public struct Timeline: GraphQLSelectionSet {
            public static let possibleTypes = ["PullRequestTimelineConnection"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("nodes", type: .list(.object(Timeline.Node.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(nodes: [Node?]? = nil) {
              self.init(snapshot: ["__typename": "PullRequestTimelineConnection", "nodes": nodes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of nodes.
            public var nodes: [Node?]? {
              get {
                return (snapshot["nodes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
              }
              set {
                snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes = ["Commit", "PullRequestReview", "PullRequestReviewThread", "PullRequestReviewComment", "IssueComment", "ClosedEvent", "ReopenedEvent", "SubscribedEvent", "UnsubscribedEvent", "MergedEvent", "ReferencedEvent", "AssignedEvent", "UnassignedEvent", "LabeledEvent", "UnlabeledEvent", "MilestonedEvent", "DemilestonedEvent", "RenamedTitleEvent", "LockedEvent", "UnlockedEvent", "DeployedEvent", "HeadRefDeletedEvent", "HeadRefRestoredEvent", "HeadRefForcePushedEvent", "BaseRefForcePushedEvent", "ReviewRequestedEvent", "ReviewRequestRemovedEvent", "ReviewDismissedEvent"]

              public static let selections: [Selection] = [
                Field("__typename", type: .nonNull(.scalar(String.self))),
                FragmentSpread(Node.AsCommit.self),
                FragmentSpread(Node.AsIssueComment.self),
                FragmentSpread(Node.AsLabeledEvent.self),
                FragmentSpread(Node.AsUnlabeledEvent.self),
                FragmentSpread(Node.AsClosedEvent.self),
                FragmentSpread(Node.AsReopenedEvent.self),
                FragmentSpread(Node.AsRenamedTitleEvent.self),
                FragmentSpread(Node.AsLockedEvent.self),
                FragmentSpread(Node.AsUnlockedEvent.self),
                FragmentSpread(Node.AsMergedEvent.self),
                FragmentSpread(Node.AsPullRequestReviewThread.self),
                FragmentSpread(Node.AsPullRequestReview.self),
                FragmentSpread(Node.AsReferencedEvent.self),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public static func makeCommit(author: AsCommit.Author? = nil, messageHeadline: String) -> Node {
                return Node(snapshot: ["__typename": "Commit", "author": author, "messageHeadline": messageHeadline])
              }

              public static func makePullRequestReview(author: AsPullRequestReview.Author? = nil, id: GraphQLID, editor: AsPullRequestReview.Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool, state: PullRequestReviewState, submittedAt: String? = nil) -> Node {
                return Node(snapshot: ["__typename": "PullRequestReview", "author": author, "id": id, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor, "state": state, "submittedAt": submittedAt])
              }

              public static func makePullRequestReviewThread(comments: AsPullRequestReviewThread.Comment) -> Node {
                return Node(snapshot: ["__typename": "PullRequestReviewThread", "comments": comments])
              }

              public static func makePullRequestReviewComment() -> Node {
                return Node(snapshot: ["__typename": "PullRequestReviewComment"])
              }

              public static func makeIssueComment(author: AsIssueComment.Author? = nil, id: GraphQLID, viewerCanReact: Bool, reactionGroups: [AsIssueComment.ReactionGroup]? = nil, editor: AsIssueComment.Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> Node {
                return Node(snapshot: ["__typename": "IssueComment", "author": author, "id": id, "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
              }

              public static func makeClosedEvent(id: GraphQLID, createdAt: String, actor: AsClosedEvent.Actor? = nil) -> Node {
                return Node(snapshot: ["__typename": "ClosedEvent", "id": id, "createdAt": createdAt, "actor": actor])
              }

              public static func makeReopenedEvent(id: GraphQLID, createdAt: String, actor: AsReopenedEvent.Actor? = nil) -> Node {
                return Node(snapshot: ["__typename": "ReopenedEvent", "id": id, "createdAt": createdAt, "actor": actor])
              }

              public static func makeSubscribedEvent() -> Node {
                return Node(snapshot: ["__typename": "SubscribedEvent"])
              }

              public static func makeUnsubscribedEvent() -> Node {
                return Node(snapshot: ["__typename": "UnsubscribedEvent"])
              }

              public static func makeMergedEvent(id: GraphQLID, createdAt: String, actor: AsMergedEvent.Actor? = nil, commit: AsMergedEvent.Commit) -> Node {
                return Node(snapshot: ["__typename": "MergedEvent", "id": id, "createdAt": createdAt, "actor": actor, "commit": commit])
              }

              public static func makeReferencedEvent(id: GraphQLID, createdAt: String, actor: AsReferencedEvent.Actor? = nil, commitRepository: AsReferencedEvent.CommitRepository, subject: AsReferencedEvent.Subject) -> Node {
                return Node(snapshot: ["__typename": "ReferencedEvent", "id": id, "createdAt": createdAt, "actor": actor, "commitRepository": commitRepository, "subject": subject])
              }

              public static func makeAssignedEvent() -> Node {
                return Node(snapshot: ["__typename": "AssignedEvent"])
              }

              public static func makeUnassignedEvent() -> Node {
                return Node(snapshot: ["__typename": "UnassignedEvent"])
              }

              public static func makeLabeledEvent(id: GraphQLID, createdAt: String, actor: AsLabeledEvent.Actor? = nil, label: AsLabeledEvent.Label) -> Node {
                return Node(snapshot: ["__typename": "LabeledEvent", "id": id, "createdAt": createdAt, "actor": actor, "label": label])
              }

              public static func makeUnlabeledEvent(id: GraphQLID, createdAt: String, actor: AsUnlabeledEvent.Actor? = nil, label: AsUnlabeledEvent.Label) -> Node {
                return Node(snapshot: ["__typename": "UnlabeledEvent", "id": id, "createdAt": createdAt, "actor": actor, "label": label])
              }

              public static func makeMilestonedEvent() -> Node {
                return Node(snapshot: ["__typename": "MilestonedEvent"])
              }

              public static func makeDemilestonedEvent() -> Node {
                return Node(snapshot: ["__typename": "DemilestonedEvent"])
              }

              public static func makeRenamedTitleEvent(id: GraphQLID, createdAt: String, actor: AsRenamedTitleEvent.Actor? = nil, currentTitle: String) -> Node {
                return Node(snapshot: ["__typename": "RenamedTitleEvent", "id": id, "createdAt": createdAt, "actor": actor, "currentTitle": currentTitle])
              }

              public static func makeLockedEvent(id: GraphQLID, createdAt: String, actor: AsLockedEvent.Actor? = nil) -> Node {
                return Node(snapshot: ["__typename": "LockedEvent", "id": id, "createdAt": createdAt, "actor": actor])
              }

              public static func makeUnlockedEvent(id: GraphQLID, createdAt: String, actor: AsUnlockedEvent.Actor? = nil) -> Node {
                return Node(snapshot: ["__typename": "UnlockedEvent", "id": id, "createdAt": createdAt, "actor": actor])
              }

              public static func makeDeployedEvent() -> Node {
                return Node(snapshot: ["__typename": "DeployedEvent"])
              }

              public static func makeHeadRefDeletedEvent() -> Node {
                return Node(snapshot: ["__typename": "HeadRefDeletedEvent"])
              }

              public static func makeHeadRefRestoredEvent() -> Node {
                return Node(snapshot: ["__typename": "HeadRefRestoredEvent"])
              }

              public static func makeHeadRefForcePushedEvent() -> Node {
                return Node(snapshot: ["__typename": "HeadRefForcePushedEvent"])
              }

              public static func makeBaseRefForcePushedEvent() -> Node {
                return Node(snapshot: ["__typename": "BaseRefForcePushedEvent"])
              }

              public static func makeReviewRequestedEvent() -> Node {
                return Node(snapshot: ["__typename": "ReviewRequestedEvent"])
              }

              public static func makeReviewRequestRemovedEvent() -> Node {
                return Node(snapshot: ["__typename": "ReviewRequestRemovedEvent"])
              }

              public static func makeReviewDismissedEvent() -> Node {
                return Node(snapshot: ["__typename": "ReviewDismissedEvent"])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var asCommit: AsCommit? {
                get {
                  if !AsCommit.possibleTypes.contains(__typename) { return nil }
                  return AsCommit(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asIssueComment: AsIssueComment? {
                get {
                  if !AsIssueComment.possibleTypes.contains(__typename) { return nil }
                  return AsIssueComment(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asLabeledEvent: AsLabeledEvent? {
                get {
                  if !AsLabeledEvent.possibleTypes.contains(__typename) { return nil }
                  return AsLabeledEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asUnlabeledEvent: AsUnlabeledEvent? {
                get {
                  if !AsUnlabeledEvent.possibleTypes.contains(__typename) { return nil }
                  return AsUnlabeledEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asClosedEvent: AsClosedEvent? {
                get {
                  if !AsClosedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsClosedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asReopenedEvent: AsReopenedEvent? {
                get {
                  if !AsReopenedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsReopenedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asRenamedTitleEvent: AsRenamedTitleEvent? {
                get {
                  if !AsRenamedTitleEvent.possibleTypes.contains(__typename) { return nil }
                  return AsRenamedTitleEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asLockedEvent: AsLockedEvent? {
                get {
                  if !AsLockedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsLockedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asUnlockedEvent: AsUnlockedEvent? {
                get {
                  if !AsUnlockedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsUnlockedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asMergedEvent: AsMergedEvent? {
                get {
                  if !AsMergedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsMergedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asPullRequestReviewThread: AsPullRequestReviewThread? {
                get {
                  if !AsPullRequestReviewThread.possibleTypes.contains(__typename) { return nil }
                  return AsPullRequestReviewThread(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asPullRequestReview: AsPullRequestReview? {
                get {
                  if !AsPullRequestReview.possibleTypes.contains(__typename) { return nil }
                  return AsPullRequestReview(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public var asReferencedEvent: AsReferencedEvent? {
                get {
                  if !AsReferencedEvent.possibleTypes.contains(__typename) { return nil }
                  return AsReferencedEvent(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public struct AsCommit: GraphQLFragment {
                public static let possibleTypes = ["Commit"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("author", type: .object(AsCommit.Author.self)),
                  Field("messageHeadline", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(author: Author? = nil, messageHeadline: String) {
                  self.init(snapshot: ["__typename": "Commit", "author": author, "messageHeadline": messageHeadline])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Authorship details of the commit.
                public var author: Author? {
                  get {
                    return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "author")
                  }
                }

                /// The Git commit message headline
                public var messageHeadline: String {
                  get {
                    return snapshot["messageHeadline"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "messageHeadline")
                  }
                }

                public struct Author: GraphQLSelectionSet {
                  public static let possibleTypes = ["GitActor"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("name", type: .scalar(String.self)),
                    Field("date", type: .scalar(String.self)),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(name: String? = nil, date: String? = nil) {
                    self.init(snapshot: ["__typename": "GitActor", "name": name, "date": date])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The name in the Git commit.
                  public var name: String? {
                    get {
                      return snapshot["name"]! as! String?
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }

                  /// The timestamp of the Git action (authoring or committing).
                  public var date: String? {
                    get {
                      return snapshot["date"]! as! String?
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "date")
                    }
                  }
                }
              }

              public struct AsIssueComment: GraphQLFragment {
                public static let possibleTypes = ["IssueComment"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("author", type: .object(AsIssueComment.Author.self)),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("viewerCanReact", type: .nonNull(.scalar(Bool.self))),
                  Field("reactionGroups", type: .list(.nonNull(.object(AsIssueComment.ReactionGroup.self)))),
                  Field("editor", type: .object(AsIssueComment.Editor.self)),
                  Field("body", type: .nonNull(.scalar(String.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("viewerDidAuthor", type: .nonNull(.scalar(Bool.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(author: Author? = nil, id: GraphQLID, viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) {
                  self.init(snapshot: ["__typename": "IssueComment", "author": author, "id": id, "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The actor who authored the comment.
                public var author: Author? {
                  get {
                    return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "author")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Can user react to this subject
                public var viewerCanReact: Bool {
                  get {
                    return snapshot["viewerCanReact"]! as! Bool
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "viewerCanReact")
                  }
                }

                /// A list of reactions grouped by content left on the subject.
                public var reactionGroups: [ReactionGroup]? {
                  get {
                    return (snapshot["reactionGroups"]! as! [Snapshot]?).flatMap { $0.map { ReactionGroup(snapshot: $0) } }
                  }
                  set {
                    snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "reactionGroups")
                  }
                }

                /// The actor who edited the comment.
                public var editor: Editor? {
                  get {
                    return (snapshot["editor"]! as! Snapshot?).flatMap { Editor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "editor")
                  }
                }

                /// Identifies the comment body.
                public var body: String {
                  get {
                    return snapshot["body"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "body")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Did the viewer author this comment.
                public var viewerDidAuthor: Bool {
                  get {
                    return snapshot["viewerDidAuthor"]! as! Bool
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "viewerDidAuthor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }

                  public var reactionFields: ReactionFields {
                    get {
                      return ReactionFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }

                  public var commentFields: CommentFields {
                    get {
                      return CommentFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Author: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                    Field("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String, avatarUrl: String) -> Author {
                    return Author(snapshot: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                  }

                  public static func makeBot(login: String, avatarUrl: String) -> Author {
                    return Author(snapshot: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }

                  /// A URL pointing to the actor's public avatar.
                  public var avatarUrl: String {
                    get {
                      return snapshot["avatarUrl"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "avatarUrl")
                    }
                  }
                }

                public struct ReactionGroup: GraphQLSelectionSet {
                  public static let possibleTypes = ["ReactionGroup"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("viewerHasReacted", type: .nonNull(.scalar(Bool.self))),
                    Field("users", type: .nonNull(.object(ReactionGroup.User.self))),
                    Field("content", type: .nonNull(.scalar(ReactionContent.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(viewerHasReacted: Bool, users: User, content: ReactionContent) {
                    self.init(snapshot: ["__typename": "ReactionGroup", "viewerHasReacted": viewerHasReacted, "users": users, "content": content])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Whether or not the authenticated user has left a reaction on the subject.
                  public var viewerHasReacted: Bool {
                    get {
                      return snapshot["viewerHasReacted"]! as! Bool
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "viewerHasReacted")
                    }
                  }

                  /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
                  public var users: User {
                    get {
                      return User(snapshot: snapshot["users"]! as! Snapshot)
                    }
                    set {
                      snapshot.updateValue(newValue.snapshot, forKey: "users")
                    }
                  }

                  /// Identifies the emoji reaction.
                  public var content: ReactionContent {
                    get {
                      return snapshot["content"]! as! ReactionContent
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "content")
                    }
                  }

                  public struct User: GraphQLSelectionSet {
                    public static let possibleTypes = ["ReactingUserConnection"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("totalCount", type: .nonNull(.scalar(Int.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(totalCount: Int) {
                      self.init(snapshot: ["__typename": "ReactingUserConnection", "totalCount": totalCount])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the total count of items in the connection.
                    public var totalCount: Int {
                      get {
                        return snapshot["totalCount"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "totalCount")
                      }
                    }
                  }
                }

                public struct Editor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Editor {
                    return Editor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Editor {
                    return Editor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsLabeledEvent: GraphQLFragment {
                public static let possibleTypes = ["LabeledEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsLabeledEvent.Actor.self)),
                  Field("label", type: .nonNull(.object(AsLabeledEvent.Label.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, label: Label) {
                  self.init(snapshot: ["__typename": "LabeledEvent", "id": id, "createdAt": createdAt, "actor": actor, "label": label])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'label' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the label associated with the 'labeled' event.
                public var label: Label {
                  get {
                    return Label(snapshot: snapshot["label"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "label")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public struct Label: GraphQLSelectionSet {
                  public static let possibleTypes = ["Label"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("color", type: .nonNull(.scalar(String.self))),
                    Field("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(color: String, name: String) {
                    self.init(snapshot: ["__typename": "Label", "color": color, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Identifies the label color.
                  public var color: String {
                    get {
                      return snapshot["color"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "color")
                    }
                  }

                  /// Identifies the label name.
                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }
                }
              }

              public struct AsUnlabeledEvent: GraphQLFragment {
                public static let possibleTypes = ["UnlabeledEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsUnlabeledEvent.Actor.self)),
                  Field("label", type: .nonNull(.object(AsUnlabeledEvent.Label.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, label: Label) {
                  self.init(snapshot: ["__typename": "UnlabeledEvent", "id": id, "createdAt": createdAt, "actor": actor, "label": label])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'unlabel' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the label associated with the 'unlabeled' event.
                public var label: Label {
                  get {
                    return Label(snapshot: snapshot["label"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "label")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public struct Label: GraphQLSelectionSet {
                  public static let possibleTypes = ["Label"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("color", type: .nonNull(.scalar(String.self))),
                    Field("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(color: String, name: String) {
                    self.init(snapshot: ["__typename": "Label", "color": color, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Identifies the label color.
                  public var color: String {
                    get {
                      return snapshot["color"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "color")
                    }
                  }

                  /// Identifies the label name.
                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }
                }
              }

              public struct AsClosedEvent: GraphQLFragment {
                public static let possibleTypes = ["ClosedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsClosedEvent.Actor.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil) {
                  self.init(snapshot: ["__typename": "ClosedEvent", "id": id, "createdAt": createdAt, "actor": actor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who closed the item.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsReopenedEvent: GraphQLFragment {
                public static let possibleTypes = ["ReopenedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsReopenedEvent.Actor.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil) {
                  self.init(snapshot: ["__typename": "ReopenedEvent", "id": id, "createdAt": createdAt, "actor": actor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who reopened the item.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsRenamedTitleEvent: GraphQLFragment {
                public static let possibleTypes = ["RenamedTitleEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsRenamedTitleEvent.Actor.self)),
                  Field("currentTitle", type: .nonNull(.scalar(String.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, currentTitle: String) {
                  self.init(snapshot: ["__typename": "RenamedTitleEvent", "id": id, "createdAt": createdAt, "actor": actor, "currentTitle": currentTitle])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'renamed' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the current title of the issue or pull request.
                public var currentTitle: String {
                  get {
                    return snapshot["currentTitle"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "currentTitle")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsLockedEvent: GraphQLFragment {
                public static let possibleTypes = ["LockedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsLockedEvent.Actor.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil) {
                  self.init(snapshot: ["__typename": "LockedEvent", "id": id, "createdAt": createdAt, "actor": actor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'locked' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsUnlockedEvent: GraphQLFragment {
                public static let possibleTypes = ["UnlockedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsUnlockedEvent.Actor.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil) {
                  self.init(snapshot: ["__typename": "UnlockedEvent", "id": id, "createdAt": createdAt, "actor": actor])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'unlocked' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsMergedEvent: GraphQLFragment {
                public static let possibleTypes = ["MergedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsMergedEvent.Actor.self)),
                  Field("commit", type: .nonNull(.object(AsMergedEvent.Commit.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, commit: Commit) {
                  self.init(snapshot: ["__typename": "MergedEvent", "id": id, "createdAt": createdAt, "actor": actor, "commit": commit])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'merge' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the commit associated with the `merge` event.
                public var commit: Commit {
                  get {
                    return Commit(snapshot: snapshot["commit"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "commit")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public struct Commit: GraphQLSelectionSet {
                  public static let possibleTypes = ["Commit"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("oid", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(oid: String) {
                    self.init(snapshot: ["__typename": "Commit", "oid": oid])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The Git object ID
                  public var oid: String {
                    get {
                      return snapshot["oid"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "oid")
                    }
                  }
                }
              }

              public struct AsPullRequestReviewThread: GraphQLFragment {
                public static let possibleTypes = ["PullRequestReviewThread"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("comments", arguments: ["first": Variable("page_size")], type: .nonNull(.object(AsPullRequestReviewThread.Comment.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(comments: Comment) {
                  self.init(snapshot: ["__typename": "PullRequestReviewThread", "comments": comments])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// A list of pull request comments associated with the thread.
                public var comments: Comment {
                  get {
                    return Comment(snapshot: snapshot["comments"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "comments")
                  }
                }

                public struct Comment: GraphQLSelectionSet {
                  public static let possibleTypes = ["PullRequestReviewCommentConnection"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("nodes", type: .list(.object(Comment.Node.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(nodes: [Node?]? = nil) {
                    self.init(snapshot: ["__typename": "PullRequestReviewCommentConnection", "nodes": nodes])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// A list of nodes.
                  public var nodes: [Node?]? {
                    get {
                      return (snapshot["nodes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
                    }
                    set {
                      snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
                    }
                  }

                  public struct Node: GraphQLSelectionSet {
                    public static let possibleTypes = ["PullRequestReviewComment"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("viewerCanReact", type: .nonNull(.scalar(Bool.self))),
                      Field("reactionGroups", type: .list(.nonNull(.object(Node.ReactionGroup.self)))),
                      Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                      Field("author", type: .object(Node.Author.self)),
                      Field("editor", type: .object(Node.Editor.self)),
                      Field("body", type: .nonNull(.scalar(String.self))),
                      Field("createdAt", type: .nonNull(.scalar(String.self))),
                      Field("viewerDidAuthor", type: .nonNull(.scalar(Bool.self))),
                      Field("path", type: .nonNull(.scalar(String.self))),
                      Field("diffHunk", type: .nonNull(.scalar(String.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil, id: GraphQLID, author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool, path: String, diffHunk: String) {
                      self.init(snapshot: ["__typename": "PullRequestReviewComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups, "id": id, "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor, "path": path, "diffHunk": diffHunk])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Can user react to this subject
                    public var viewerCanReact: Bool {
                      get {
                        return snapshot["viewerCanReact"]! as! Bool
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "viewerCanReact")
                      }
                    }

                    /// A list of reactions grouped by content left on the subject.
                    public var reactionGroups: [ReactionGroup]? {
                      get {
                        return (snapshot["reactionGroups"]! as! [Snapshot]?).flatMap { $0.map { ReactionGroup(snapshot: $0) } }
                      }
                      set {
                        snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "reactionGroups")
                      }
                    }

                    public var id: GraphQLID {
                      get {
                        return snapshot["id"]! as! GraphQLID
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "id")
                      }
                    }

                    /// The actor who authored the comment.
                    public var author: Author? {
                      get {
                        return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
                      }
                      set {
                        snapshot.updateValue(newValue?.snapshot, forKey: "author")
                      }
                    }

                    /// The actor who edited the comment.
                    public var editor: Editor? {
                      get {
                        return (snapshot["editor"]! as! Snapshot?).flatMap { Editor(snapshot: $0) }
                      }
                      set {
                        snapshot.updateValue(newValue?.snapshot, forKey: "editor")
                      }
                    }

                    /// The comment body of this review comment.
                    public var body: String {
                      get {
                        return snapshot["body"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "body")
                      }
                    }

                    /// Identifies when the comment was created.
                    public var createdAt: String {
                      get {
                        return snapshot["createdAt"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "createdAt")
                      }
                    }

                    /// Did the viewer author this comment.
                    public var viewerDidAuthor: Bool {
                      get {
                        return snapshot["viewerDidAuthor"]! as! Bool
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "viewerDidAuthor")
                      }
                    }

                    /// The path to which the comment applies.
                    public var path: String {
                      get {
                        return snapshot["path"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "path")
                      }
                    }

                    /// The diff hunk to which the comment applies.
                    public var diffHunk: String {
                      get {
                        return snapshot["diffHunk"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "diffHunk")
                      }
                    }

                    public var fragments: Fragments {
                      get {
                        return Fragments(snapshot: snapshot)
                      }
                      set {
                        snapshot = newValue.snapshot
                      }
                    }

                    public struct Fragments {
                      public var snapshot: Snapshot

                      public var reactionFields: ReactionFields {
                        get {
                          return ReactionFields(snapshot: snapshot)
                        }
                        set {
                          snapshot = newValue.snapshot
                        }
                      }

                      public var nodeFields: NodeFields {
                        get {
                          return NodeFields(snapshot: snapshot)
                        }
                        set {
                          snapshot = newValue.snapshot
                        }
                      }

                      public var commentFields: CommentFields {
                        get {
                          return CommentFields(snapshot: snapshot)
                        }
                        set {
                          snapshot = newValue.snapshot
                        }
                      }
                    }

                    public struct ReactionGroup: GraphQLSelectionSet {
                      public static let possibleTypes = ["ReactionGroup"]

                      public static let selections: [Selection] = [
                        Field("__typename", type: .nonNull(.scalar(String.self))),
                        Field("viewerHasReacted", type: .nonNull(.scalar(Bool.self))),
                        Field("users", type: .nonNull(.object(ReactionGroup.User.self))),
                        Field("content", type: .nonNull(.scalar(ReactionContent.self))),
                      ]

                      public var snapshot: Snapshot

                      public init(snapshot: Snapshot) {
                        self.snapshot = snapshot
                      }

                      public init(viewerHasReacted: Bool, users: User, content: ReactionContent) {
                        self.init(snapshot: ["__typename": "ReactionGroup", "viewerHasReacted": viewerHasReacted, "users": users, "content": content])
                      }

                      public var __typename: String {
                        get {
                          return snapshot["__typename"]! as! String
                        }
                        set {
                          snapshot.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// Whether or not the authenticated user has left a reaction on the subject.
                      public var viewerHasReacted: Bool {
                        get {
                          return snapshot["viewerHasReacted"]! as! Bool
                        }
                        set {
                          snapshot.updateValue(newValue, forKey: "viewerHasReacted")
                        }
                      }

                      /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
                      public var users: User {
                        get {
                          return User(snapshot: snapshot["users"]! as! Snapshot)
                        }
                        set {
                          snapshot.updateValue(newValue.snapshot, forKey: "users")
                        }
                      }

                      /// Identifies the emoji reaction.
                      public var content: ReactionContent {
                        get {
                          return snapshot["content"]! as! ReactionContent
                        }
                        set {
                          snapshot.updateValue(newValue, forKey: "content")
                        }
                      }

                      public struct User: GraphQLSelectionSet {
                        public static let possibleTypes = ["ReactingUserConnection"]

                        public static let selections: [Selection] = [
                          Field("__typename", type: .nonNull(.scalar(String.self))),
                          Field("totalCount", type: .nonNull(.scalar(Int.self))),
                        ]

                        public var snapshot: Snapshot

                        public init(snapshot: Snapshot) {
                          self.snapshot = snapshot
                        }

                        public init(totalCount: Int) {
                          self.init(snapshot: ["__typename": "ReactingUserConnection", "totalCount": totalCount])
                        }

                        public var __typename: String {
                          get {
                            return snapshot["__typename"]! as! String
                          }
                          set {
                            snapshot.updateValue(newValue, forKey: "__typename")
                          }
                        }

                        /// Identifies the total count of items in the connection.
                        public var totalCount: Int {
                          get {
                            return snapshot["totalCount"]! as! Int
                          }
                          set {
                            snapshot.updateValue(newValue, forKey: "totalCount")
                          }
                        }
                      }
                    }

                    public struct Author: GraphQLSelectionSet {
                      public static let possibleTypes = ["User", "Bot"]

                      public static let selections: [Selection] = [
                        Field("__typename", type: .nonNull(.scalar(String.self))),
                        Field("login", type: .nonNull(.scalar(String.self))),
                        Field("avatarUrl", type: .nonNull(.scalar(String.self))),
                      ]

                      public var snapshot: Snapshot

                      public init(snapshot: Snapshot) {
                        self.snapshot = snapshot
                      }

                      public static func makeUser(login: String, avatarUrl: String) -> Author {
                        return Author(snapshot: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                      }

                      public static func makeBot(login: String, avatarUrl: String) -> Author {
                        return Author(snapshot: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                      }

                      public var __typename: String {
                        get {
                          return snapshot["__typename"]! as! String
                        }
                        set {
                          snapshot.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// The username of the actor.
                      public var login: String {
                        get {
                          return snapshot["login"]! as! String
                        }
                        set {
                          snapshot.updateValue(newValue, forKey: "login")
                        }
                      }

                      /// A URL pointing to the actor's public avatar.
                      public var avatarUrl: String {
                        get {
                          return snapshot["avatarUrl"]! as! String
                        }
                        set {
                          snapshot.updateValue(newValue, forKey: "avatarUrl")
                        }
                      }
                    }

                    public struct Editor: GraphQLSelectionSet {
                      public static let possibleTypes = ["User", "Bot"]

                      public static let selections: [Selection] = [
                        Field("__typename", type: .nonNull(.scalar(String.self))),
                        Field("login", type: .nonNull(.scalar(String.self))),
                      ]

                      public var snapshot: Snapshot

                      public init(snapshot: Snapshot) {
                        self.snapshot = snapshot
                      }

                      public static func makeUser(login: String) -> Editor {
                        return Editor(snapshot: ["__typename": "User", "login": login])
                      }

                      public static func makeBot(login: String) -> Editor {
                        return Editor(snapshot: ["__typename": "Bot", "login": login])
                      }

                      public var __typename: String {
                        get {
                          return snapshot["__typename"]! as! String
                        }
                        set {
                          snapshot.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// The username of the actor.
                      public var login: String {
                        get {
                          return snapshot["login"]! as! String
                        }
                        set {
                          snapshot.updateValue(newValue, forKey: "login")
                        }
                      }
                    }
                  }
                }
              }

              public struct AsPullRequestReview: GraphQLFragment {
                public static let possibleTypes = ["PullRequestReview"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("author", type: .object(AsPullRequestReview.Author.self)),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("editor", type: .object(AsPullRequestReview.Editor.self)),
                  Field("body", type: .nonNull(.scalar(String.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("viewerDidAuthor", type: .nonNull(.scalar(Bool.self))),
                  Field("state", type: .nonNull(.scalar(PullRequestReviewState.self))),
                  Field("submittedAt", type: .scalar(String.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(author: Author? = nil, id: GraphQLID, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool, state: PullRequestReviewState, submittedAt: String? = nil) {
                  self.init(snapshot: ["__typename": "PullRequestReview", "author": author, "id": id, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor, "state": state, "submittedAt": submittedAt])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The actor who authored the comment.
                public var author: Author? {
                  get {
                    return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "author")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// The actor who edited the comment.
                public var editor: Editor? {
                  get {
                    return (snapshot["editor"]! as! Snapshot?).flatMap { Editor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "editor")
                  }
                }

                /// Identifies the pull request review body.
                public var body: String {
                  get {
                    return snapshot["body"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "body")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Did the viewer author this comment.
                public var viewerDidAuthor: Bool {
                  get {
                    return snapshot["viewerDidAuthor"]! as! Bool
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "viewerDidAuthor")
                  }
                }

                /// Identifies the current state of the pull request review.
                public var state: PullRequestReviewState {
                  get {
                    return snapshot["state"]! as! PullRequestReviewState
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "state")
                  }
                }

                /// Identifies when the Pull Request Review was submitted
                public var submittedAt: String? {
                  get {
                    return snapshot["submittedAt"]! as! String?
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "submittedAt")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }

                  public var commentFields: CommentFields {
                    get {
                      return CommentFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Author: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                    Field("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String, avatarUrl: String) -> Author {
                    return Author(snapshot: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
                  }

                  public static func makeBot(login: String, avatarUrl: String) -> Author {
                    return Author(snapshot: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }

                  /// A URL pointing to the actor's public avatar.
                  public var avatarUrl: String {
                    get {
                      return snapshot["avatarUrl"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "avatarUrl")
                    }
                  }
                }

                public struct Editor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Editor {
                    return Editor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Editor {
                    return Editor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }

              public struct AsReferencedEvent: GraphQLFragment {
                public static let possibleTypes = ["ReferencedEvent"]

                public static let selections: [Selection] = [
                  Field("__typename", type: .nonNull(.scalar(String.self))),
                  Field("id", type: .nonNull(.scalar(GraphQLID.self))),
                  Field("createdAt", type: .nonNull(.scalar(String.self))),
                  Field("actor", type: .object(AsReferencedEvent.Actor.self)),
                  Field("commitRepository", type: .nonNull(.object(AsReferencedEvent.CommitRepository.self))),
                  Field("subject", type: .nonNull(.object(AsReferencedEvent.Subject.self))),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(id: GraphQLID, createdAt: String, actor: Actor? = nil, commitRepository: CommitRepository, subject: Subject) {
                  self.init(snapshot: ["__typename": "ReferencedEvent", "id": id, "createdAt": createdAt, "actor": actor, "commitRepository": commitRepository, "subject": subject])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return snapshot["id"]! as! GraphQLID
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "id")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return snapshot["createdAt"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// Identifies the actor who performed the 'label' event.
                public var actor: Actor? {
                  get {
                    return (snapshot["actor"]! as! Snapshot?).flatMap { Actor(snapshot: $0) }
                  }
                  set {
                    snapshot.updateValue(newValue?.snapshot, forKey: "actor")
                  }
                }

                /// Identifies the repository associated with the 'referenced' event.
                public var commitRepository: CommitRepository {
                  get {
                    return CommitRepository(snapshot: snapshot["commitRepository"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "commitRepository")
                  }
                }

                /// Object referenced by event.
                public var subject: Subject {
                  get {
                    return Subject(snapshot: snapshot["subject"]! as! Snapshot)
                  }
                  set {
                    snapshot.updateValue(newValue.snapshot, forKey: "subject")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(snapshot: snapshot)
                  }
                  set {
                    snapshot = newValue.snapshot
                  }
                }

                public struct Fragments {
                  public var snapshot: Snapshot

                  public var nodeFields: NodeFields {
                    get {
                      return NodeFields(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }
                }

                public struct Actor: GraphQLSelectionSet {
                  public static let possibleTypes = ["User", "Bot"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("login", type: .nonNull(.scalar(String.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeUser(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "User", "login": login])
                  }

                  public static func makeBot(login: String) -> Actor {
                    return Actor(snapshot: ["__typename": "Bot", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username of the actor.
                  public var login: String {
                    get {
                      return snapshot["login"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "login")
                    }
                  }
                }

                public struct CommitRepository: GraphQLSelectionSet {
                  public static let possibleTypes = ["Repository"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    Field("name", type: .nonNull(.scalar(String.self))),
                    Field("owner", type: .nonNull(.object(CommitRepository.Owner.self))),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(name: String, owner: Owner) {
                    self.init(snapshot: ["__typename": "Repository", "name": name, "owner": owner])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The name of the repository.
                  public var name: String {
                    get {
                      return snapshot["name"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "name")
                    }
                  }

                  /// The User owner of the repository.
                  public var owner: Owner {
                    get {
                      return Owner(snapshot: snapshot["owner"]! as! Snapshot)
                    }
                    set {
                      snapshot.updateValue(newValue.snapshot, forKey: "owner")
                    }
                  }

                  public var fragments: Fragments {
                    get {
                      return Fragments(snapshot: snapshot)
                    }
                    set {
                      snapshot = newValue.snapshot
                    }
                  }

                  public struct Fragments {
                    public var snapshot: Snapshot

                    public var referencedRepositoryFields: ReferencedRepositoryFields {
                      get {
                        return ReferencedRepositoryFields(snapshot: snapshot)
                      }
                      set {
                        snapshot = newValue.snapshot
                      }
                    }
                  }

                  public struct Owner: GraphQLSelectionSet {
                    public static let possibleTypes = ["Organization", "User"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("login", type: .nonNull(.scalar(String.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public static func makeOrganization(login: String) -> Owner {
                      return Owner(snapshot: ["__typename": "Organization", "login": login])
                    }

                    public static func makeUser(login: String) -> Owner {
                      return Owner(snapshot: ["__typename": "User", "login": login])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The username used to login.
                    public var login: String {
                      get {
                        return snapshot["login"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "login")
                      }
                    }
                  }
                }

                public struct Subject: GraphQLSelectionSet {
                  public static let possibleTypes = ["Issue", "PullRequest"]

                  public static let selections: [Selection] = [
                    Field("__typename", type: .nonNull(.scalar(String.self))),
                    FragmentSpread(Subject.AsIssue.self),
                    FragmentSpread(Subject.AsPullRequest.self),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public static func makeIssue(title: String, number: Int, closed: Bool) -> Subject {
                    return Subject(snapshot: ["__typename": "Issue", "title": title, "number": number, "closed": closed])
                  }

                  public static func makePullRequest(title: String, number: Int, closed: Bool, merged: Bool) -> Subject {
                    return Subject(snapshot: ["__typename": "PullRequest", "title": title, "number": number, "closed": closed, "merged": merged])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var asIssue: AsIssue? {
                    get {
                      if !AsIssue.possibleTypes.contains(__typename) { return nil }
                      return AsIssue(snapshot: snapshot)
                    }
                    set {
                      guard let newValue = newValue else { return }
                      snapshot = newValue.snapshot
                    }
                  }

                  public var asPullRequest: AsPullRequest? {
                    get {
                      if !AsPullRequest.possibleTypes.contains(__typename) { return nil }
                      return AsPullRequest(snapshot: snapshot)
                    }
                    set {
                      guard let newValue = newValue else { return }
                      snapshot = newValue.snapshot
                    }
                  }

                  public struct AsIssue: GraphQLFragment {
                    public static let possibleTypes = ["Issue"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("title", type: .nonNull(.scalar(String.self))),
                      Field("number", type: .nonNull(.scalar(Int.self))),
                      Field("closed", type: .nonNull(.scalar(Bool.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(title: String, number: Int, closed: Bool) {
                      self.init(snapshot: ["__typename": "Issue", "title": title, "number": number, "closed": closed])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the issue title.
                    public var title: String {
                      get {
                        return snapshot["title"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "title")
                      }
                    }

                    /// Identifies the issue number.
                    public var number: Int {
                      get {
                        return snapshot["number"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "number")
                      }
                    }

                    /// true if the object is `closed` (definition of closed may depend on type)
                    public var closed: Bool {
                      get {
                        return snapshot["closed"]! as! Bool
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "closed")
                      }
                    }
                  }

                  public struct AsPullRequest: GraphQLFragment {
                    public static let possibleTypes = ["PullRequest"]

                    public static let selections: [Selection] = [
                      Field("__typename", type: .nonNull(.scalar(String.self))),
                      Field("title", type: .nonNull(.scalar(String.self))),
                      Field("number", type: .nonNull(.scalar(Int.self))),
                      Field("closed", type: .nonNull(.scalar(Bool.self))),
                      Field("merged", type: .nonNull(.scalar(Bool.self))),
                    ]

                    public var snapshot: Snapshot

                    public init(snapshot: Snapshot) {
                      self.snapshot = snapshot
                    }

                    public init(title: String, number: Int, closed: Bool, merged: Bool) {
                      self.init(snapshot: ["__typename": "PullRequest", "title": title, "number": number, "closed": closed, "merged": merged])
                    }

                    public var __typename: String {
                      get {
                        return snapshot["__typename"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Identifies the pull request title.
                    public var title: String {
                      get {
                        return snapshot["title"]! as! String
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "title")
                      }
                    }

                    /// Identifies the pull request number.
                    public var number: Int {
                      get {
                        return snapshot["number"]! as! Int
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "number")
                      }
                    }

                    /// true if the object is `closed` (definition of closed may depend on type)
                    public var closed: Bool {
                      get {
                        return snapshot["closed"]! as! Bool
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "closed")
                      }
                    }

                    /// Whether or not the pull request was merged.
                    public var merged: Bool {
                      get {
                        return snapshot["merged"]! as! Bool
                      }
                      set {
                        snapshot.updateValue(newValue, forKey: "merged")
                      }
                    }
                  }
                }
              }
            }
          }

          public struct ReactionGroup: GraphQLSelectionSet {
            public static let possibleTypes = ["ReactionGroup"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("viewerHasReacted", type: .nonNull(.scalar(Bool.self))),
              Field("users", type: .nonNull(.object(ReactionGroup.User.self))),
              Field("content", type: .nonNull(.scalar(ReactionContent.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(viewerHasReacted: Bool, users: User, content: ReactionContent) {
              self.init(snapshot: ["__typename": "ReactionGroup", "viewerHasReacted": viewerHasReacted, "users": users, "content": content])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Whether or not the authenticated user has left a reaction on the subject.
            public var viewerHasReacted: Bool {
              get {
                return snapshot["viewerHasReacted"]! as! Bool
              }
              set {
                snapshot.updateValue(newValue, forKey: "viewerHasReacted")
              }
            }

            /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
            public var users: User {
              get {
                return User(snapshot: snapshot["users"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "users")
              }
            }

            /// Identifies the emoji reaction.
            public var content: ReactionContent {
              get {
                return snapshot["content"]! as! ReactionContent
              }
              set {
                snapshot.updateValue(newValue, forKey: "content")
              }
            }

            public struct User: GraphQLSelectionSet {
              public static let possibleTypes = ["ReactingUserConnection"]

              public static let selections: [Selection] = [
                Field("__typename", type: .nonNull(.scalar(String.self))),
                Field("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int) {
                self.init(snapshot: ["__typename": "ReactingUserConnection", "totalCount": totalCount])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return snapshot["totalCount"]! as! Int
                }
                set {
                  snapshot.updateValue(newValue, forKey: "totalCount")
                }
              }
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes = ["User", "Bot"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("login", type: .nonNull(.scalar(String.self))),
              Field("avatarUrl", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeUser(login: String, avatarUrl: String) -> Author {
              return Author(snapshot: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
            }

            public static func makeBot(login: String, avatarUrl: String) -> Author {
              return Author(snapshot: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username of the actor.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }

            /// A URL pointing to the actor's public avatar.
            public var avatarUrl: String {
              get {
                return snapshot["avatarUrl"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "avatarUrl")
              }
            }
          }

          public struct Editor: GraphQLSelectionSet {
            public static let possibleTypes = ["User", "Bot"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("login", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeUser(login: String) -> Editor {
              return Editor(snapshot: ["__typename": "User", "login": login])
            }

            public static func makeBot(login: String) -> Editor {
              return Editor(snapshot: ["__typename": "Bot", "login": login])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username of the actor.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }
          }

          public struct Label: GraphQLSelectionSet {
            public static let possibleTypes = ["LabelConnection"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("nodes", type: .list(.object(Label.Node.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(nodes: [Node?]? = nil) {
              self.init(snapshot: ["__typename": "LabelConnection", "nodes": nodes])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of nodes.
            public var nodes: [Node?]? {
              get {
                return (snapshot["nodes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
              }
              set {
                snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes = ["Label"]

              public static let selections: [Selection] = [
                Field("__typename", type: .nonNull(.scalar(String.self))),
                Field("color", type: .nonNull(.scalar(String.self))),
                Field("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(color: String, name: String) {
                self.init(snapshot: ["__typename": "Label", "color": color, "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the label color.
              public var color: String {
                get {
                  return snapshot["color"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "color")
                }
              }

              /// Identifies the label name.
              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class RemoveReactionMutation: GraphQLMutation {
  public static let operationString =
    "mutation RemoveReaction($subject_id: ID!, $content: ReactionContent!) {" +
    "  removeReaction(input: {subjectId: $subject_id, content: $content}) {" +
    "    __typename" +
    "    subject {" +
    "      __typename" +
    "      ...reactionFields" +
    "    }" +
    "  }" +
    "}"
  public static var requestString: String { return operationString.appending(ReactionFields.fragmentString) }

  public var subject_id: GraphQLID
  public var content: ReactionContent

  public init(subject_id: GraphQLID, content: ReactionContent) {
    self.subject_id = subject_id
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["subject_id": subject_id, "content": content]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [Selection] = [
      Field("removeReaction", arguments: ["input": ["subjectId": Variable("subject_id"), "content": Variable("content")]], type: .object(Data.RemoveReaction.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(removeReaction: RemoveReaction? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "removeReaction": removeReaction])
    }

    /// Removes a reaction from a subject.
    public var removeReaction: RemoveReaction? {
      get {
        return (snapshot["removeReaction"]! as! Snapshot?).flatMap { RemoveReaction(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "removeReaction")
      }
    }

    public struct RemoveReaction: GraphQLSelectionSet {
      public static let possibleTypes = ["RemoveReactionPayload"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("subject", type: .nonNull(.object(RemoveReaction.Subject.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(subject: Subject) {
        self.init(snapshot: ["__typename": "RemoveReactionPayload", "subject": subject])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The reactable subject.
      public var subject: Subject {
        get {
          return Subject(snapshot: snapshot["subject"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "subject")
        }
      }

      public struct Subject: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue", "CommitComment", "PullRequest", "IssueComment", "PullRequestReviewComment"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("viewerCanReact", type: .nonNull(.scalar(Bool.self))),
          Field("reactionGroups", type: .list(.nonNull(.object(Subject.ReactionGroup.self)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeIssue(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "Issue", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public static func makeCommitComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "CommitComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public static func makePullRequest(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "PullRequest", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public static func makeIssueComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "IssueComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public static func makePullRequestReviewComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> Subject {
          return Subject(snapshot: ["__typename": "PullRequestReviewComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Can user react to this subject
        public var viewerCanReact: Bool {
          get {
            return snapshot["viewerCanReact"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "viewerCanReact")
          }
        }

        /// A list of reactions grouped by content left on the subject.
        public var reactionGroups: [ReactionGroup]? {
          get {
            return (snapshot["reactionGroups"]! as! [Snapshot]?).flatMap { $0.map { ReactionGroup(snapshot: $0) } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "reactionGroups")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var reactionFields: ReactionFields {
            get {
              return ReactionFields(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }

        public struct ReactionGroup: GraphQLSelectionSet {
          public static let possibleTypes = ["ReactionGroup"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("viewerHasReacted", type: .nonNull(.scalar(Bool.self))),
            Field("users", type: .nonNull(.object(ReactionGroup.User.self))),
            Field("content", type: .nonNull(.scalar(ReactionContent.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(viewerHasReacted: Bool, users: User, content: ReactionContent) {
            self.init(snapshot: ["__typename": "ReactionGroup", "viewerHasReacted": viewerHasReacted, "users": users, "content": content])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Whether or not the authenticated user has left a reaction on the subject.
          public var viewerHasReacted: Bool {
            get {
              return snapshot["viewerHasReacted"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "viewerHasReacted")
            }
          }

          /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
          public var users: User {
            get {
              return User(snapshot: snapshot["users"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "users")
            }
          }

          /// Identifies the emoji reaction.
          public var content: ReactionContent {
            get {
              return snapshot["content"]! as! ReactionContent
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes = ["ReactingUserConnection"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("totalCount", type: .nonNull(.scalar(Int.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(totalCount: Int) {
              self.init(snapshot: ["__typename": "ReactingUserConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return snapshot["totalCount"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "totalCount")
              }
            }
          }
        }
      }
    }
  }
}

public struct ReactionFields: GraphQLFragment {
  public static let fragmentString =
    "fragment reactionFields on Reactable {" +
    "  __typename" +
    "  viewerCanReact" +
    "  reactionGroups {" +
    "    __typename" +
    "    viewerHasReacted" +
    "    users {" +
    "      __typename" +
    "      totalCount" +
    "    }" +
    "    content" +
    "  }" +
    "}"

  public static let possibleTypes = ["Issue", "CommitComment", "PullRequest", "IssueComment", "PullRequestReviewComment"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("viewerCanReact", type: .nonNull(.scalar(Bool.self))),
    Field("reactionGroups", type: .list(.nonNull(.object(ReactionFields.ReactionGroup.self)))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeIssue(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> ReactionFields {
    return ReactionFields(snapshot: ["__typename": "Issue", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
  }

  public static func makeCommitComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> ReactionFields {
    return ReactionFields(snapshot: ["__typename": "CommitComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
  }

  public static func makePullRequest(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> ReactionFields {
    return ReactionFields(snapshot: ["__typename": "PullRequest", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
  }

  public static func makeIssueComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> ReactionFields {
    return ReactionFields(snapshot: ["__typename": "IssueComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
  }

  public static func makePullRequestReviewComment(viewerCanReact: Bool, reactionGroups: [ReactionGroup]? = nil) -> ReactionFields {
    return ReactionFields(snapshot: ["__typename": "PullRequestReviewComment", "viewerCanReact": viewerCanReact, "reactionGroups": reactionGroups])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Can user react to this subject
  public var viewerCanReact: Bool {
    get {
      return snapshot["viewerCanReact"]! as! Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "viewerCanReact")
    }
  }

  /// A list of reactions grouped by content left on the subject.
  public var reactionGroups: [ReactionGroup]? {
    get {
      return (snapshot["reactionGroups"]! as! [Snapshot]?).flatMap { $0.map { ReactionGroup(snapshot: $0) } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "reactionGroups")
    }
  }

  public struct ReactionGroup: GraphQLSelectionSet {
    public static let possibleTypes = ["ReactionGroup"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("viewerHasReacted", type: .nonNull(.scalar(Bool.self))),
      Field("users", type: .nonNull(.object(ReactionGroup.User.self))),
      Field("content", type: .nonNull(.scalar(ReactionContent.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(viewerHasReacted: Bool, users: User, content: ReactionContent) {
      self.init(snapshot: ["__typename": "ReactionGroup", "viewerHasReacted": viewerHasReacted, "users": users, "content": content])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Whether or not the authenticated user has left a reaction on the subject.
    public var viewerHasReacted: Bool {
      get {
        return snapshot["viewerHasReacted"]! as! Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "viewerHasReacted")
      }
    }

    /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
    public var users: User {
      get {
        return User(snapshot: snapshot["users"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "users")
      }
    }

    /// Identifies the emoji reaction.
    public var content: ReactionContent {
      get {
        return snapshot["content"]! as! ReactionContent
      }
      set {
        snapshot.updateValue(newValue, forKey: "content")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["ReactingUserConnection"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("totalCount", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(totalCount: Int) {
        self.init(snapshot: ["__typename": "ReactingUserConnection", "totalCount": totalCount])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Identifies the total count of items in the connection.
      public var totalCount: Int {
        get {
          return snapshot["totalCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "totalCount")
        }
      }
    }
  }
}

public struct CommentFields: GraphQLFragment {
  public static let fragmentString =
    "fragment commentFields on Comment {" +
    "  __typename" +
    "  author {" +
    "    __typename" +
    "    login" +
    "    avatarUrl" +
    "  }" +
    "  editor {" +
    "    __typename" +
    "    login" +
    "  }" +
    "  body" +
    "  createdAt" +
    "  viewerDidAuthor" +
    "}"

  public static let possibleTypes = ["Issue", "CommitComment", "PullRequest", "IssueComment", "PullRequestReview", "PullRequestReviewComment", "GistComment"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("author", type: .object(CommentFields.Author.self)),
    Field("editor", type: .object(CommentFields.Editor.self)),
    Field("body", type: .nonNull(.scalar(String.self))),
    Field("createdAt", type: .nonNull(.scalar(String.self))),
    Field("viewerDidAuthor", type: .nonNull(.scalar(Bool.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeIssue(author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> CommentFields {
    return CommentFields(snapshot: ["__typename": "Issue", "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
  }

  public static func makeCommitComment(author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> CommentFields {
    return CommentFields(snapshot: ["__typename": "CommitComment", "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
  }

  public static func makePullRequest(author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> CommentFields {
    return CommentFields(snapshot: ["__typename": "PullRequest", "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
  }

  public static func makeIssueComment(author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> CommentFields {
    return CommentFields(snapshot: ["__typename": "IssueComment", "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
  }

  public static func makePullRequestReview(author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> CommentFields {
    return CommentFields(snapshot: ["__typename": "PullRequestReview", "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
  }

  public static func makePullRequestReviewComment(author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> CommentFields {
    return CommentFields(snapshot: ["__typename": "PullRequestReviewComment", "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
  }

  public static func makeGistComment(author: Author? = nil, editor: Editor? = nil, body: String, createdAt: String, viewerDidAuthor: Bool) -> CommentFields {
    return CommentFields(snapshot: ["__typename": "GistComment", "author": author, "editor": editor, "body": body, "createdAt": createdAt, "viewerDidAuthor": viewerDidAuthor])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The actor who authored the comment.
  public var author: Author? {
    get {
      return (snapshot["author"]! as! Snapshot?).flatMap { Author(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "author")
    }
  }

  /// The actor who edited the comment.
  public var editor: Editor? {
    get {
      return (snapshot["editor"]! as! Snapshot?).flatMap { Editor(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "editor")
    }
  }

  /// The comment body as Markdown.
  public var body: String {
    get {
      return snapshot["body"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "body")
    }
  }

  /// Identifies the date and time when the object was created.
  public var createdAt: String {
    get {
      return snapshot["createdAt"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAt")
    }
  }

  /// Did the viewer author this comment.
  public var viewerDidAuthor: Bool {
    get {
      return snapshot["viewerDidAuthor"]! as! Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "viewerDidAuthor")
    }
  }

  public struct Author: GraphQLSelectionSet {
    public static let possibleTypes = ["User", "Bot"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("login", type: .nonNull(.scalar(String.self))),
      Field("avatarUrl", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public static func makeUser(login: String, avatarUrl: String) -> Author {
      return Author(snapshot: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
    }

    public static func makeBot(login: String, avatarUrl: String) -> Author {
      return Author(snapshot: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The username of the actor.
    public var login: String {
      get {
        return snapshot["login"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "login")
      }
    }

    /// A URL pointing to the actor's public avatar.
    public var avatarUrl: String {
      get {
        return snapshot["avatarUrl"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "avatarUrl")
      }
    }
  }

  public struct Editor: GraphQLSelectionSet {
    public static let possibleTypes = ["User", "Bot"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("login", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public static func makeUser(login: String) -> Editor {
      return Editor(snapshot: ["__typename": "User", "login": login])
    }

    public static func makeBot(login: String) -> Editor {
      return Editor(snapshot: ["__typename": "Bot", "login": login])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The username of the actor.
    public var login: String {
      get {
        return snapshot["login"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "login")
      }
    }
  }
}

public struct LockableFields: GraphQLFragment {
  public static let fragmentString =
    "fragment lockableFields on Lockable {" +
    "  __typename" +
    "  locked" +
    "}"

  public static let possibleTypes = ["Issue", "PullRequest"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("locked", type: .nonNull(.scalar(Bool.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeIssue(locked: Bool) -> LockableFields {
    return LockableFields(snapshot: ["__typename": "Issue", "locked": locked])
  }

  public static func makePullRequest(locked: Bool) -> LockableFields {
    return LockableFields(snapshot: ["__typename": "PullRequest", "locked": locked])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// `true` if the object is locked
  public var locked: Bool {
    get {
      return snapshot["locked"]! as! Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "locked")
    }
  }
}

public struct ClosableFields: GraphQLFragment {
  public static let fragmentString =
    "fragment closableFields on Closable {" +
    "  __typename" +
    "  closed" +
    "}"

  public static let possibleTypes = ["Issue", "PullRequest"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("closed", type: .nonNull(.scalar(Bool.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeIssue(closed: Bool) -> ClosableFields {
    return ClosableFields(snapshot: ["__typename": "Issue", "closed": closed])
  }

  public static func makePullRequest(closed: Bool) -> ClosableFields {
    return ClosableFields(snapshot: ["__typename": "PullRequest", "closed": closed])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// true if the object is `closed` (definition of closed may depend on type)
  public var closed: Bool {
    get {
      return snapshot["closed"]! as! Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "closed")
    }
  }
}

public struct LabelableFields: GraphQLFragment {
  public static let fragmentString =
    "fragment labelableFields on Labelable {" +
    "  __typename" +
    "  labels(first: 100) {" +
    "    __typename" +
    "    nodes {" +
    "      __typename" +
    "      color" +
    "      name" +
    "    }" +
    "  }" +
    "}"

  public static let possibleTypes = ["Issue", "PullRequest"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("labels", arguments: ["first": 100], type: .object(LabelableFields.Label.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeIssue(labels: Label? = nil) -> LabelableFields {
    return LabelableFields(snapshot: ["__typename": "Issue", "labels": labels])
  }

  public static func makePullRequest(labels: Label? = nil) -> LabelableFields {
    return LabelableFields(snapshot: ["__typename": "PullRequest", "labels": labels])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// A list of labels associated with the object.
  public var labels: Label? {
    get {
      return (snapshot["labels"]! as! Snapshot?).flatMap { Label(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "labels")
    }
  }

  public struct Label: GraphQLSelectionSet {
    public static let possibleTypes = ["LabelConnection"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("nodes", type: .list(.object(Label.Node.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(nodes: [Node?]? = nil) {
      self.init(snapshot: ["__typename": "LabelConnection", "nodes": nodes])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of nodes.
    public var nodes: [Node?]? {
      get {
        return (snapshot["nodes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Node(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes = ["Label"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("color", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(color: String, name: String) {
        self.init(snapshot: ["__typename": "Label", "color": color, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Identifies the label color.
      public var color: String {
        get {
          return snapshot["color"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "color")
        }
      }

      /// Identifies the label name.
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public struct UpdatableFields: GraphQLFragment {
  public static let fragmentString =
    "fragment updatableFields on Updatable {" +
    "  __typename" +
    "  viewerCanUpdate" +
    "}"

  public static let possibleTypes = ["Project", "Issue", "CommitComment", "PullRequest", "IssueComment", "PullRequestReview", "PullRequestReviewComment", "GistComment"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("viewerCanUpdate", type: .nonNull(.scalar(Bool.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeProject(viewerCanUpdate: Bool) -> UpdatableFields {
    return UpdatableFields(snapshot: ["__typename": "Project", "viewerCanUpdate": viewerCanUpdate])
  }

  public static func makeIssue(viewerCanUpdate: Bool) -> UpdatableFields {
    return UpdatableFields(snapshot: ["__typename": "Issue", "viewerCanUpdate": viewerCanUpdate])
  }

  public static func makeCommitComment(viewerCanUpdate: Bool) -> UpdatableFields {
    return UpdatableFields(snapshot: ["__typename": "CommitComment", "viewerCanUpdate": viewerCanUpdate])
  }

  public static func makePullRequest(viewerCanUpdate: Bool) -> UpdatableFields {
    return UpdatableFields(snapshot: ["__typename": "PullRequest", "viewerCanUpdate": viewerCanUpdate])
  }

  public static func makeIssueComment(viewerCanUpdate: Bool) -> UpdatableFields {
    return UpdatableFields(snapshot: ["__typename": "IssueComment", "viewerCanUpdate": viewerCanUpdate])
  }

  public static func makePullRequestReview(viewerCanUpdate: Bool) -> UpdatableFields {
    return UpdatableFields(snapshot: ["__typename": "PullRequestReview", "viewerCanUpdate": viewerCanUpdate])
  }

  public static func makePullRequestReviewComment(viewerCanUpdate: Bool) -> UpdatableFields {
    return UpdatableFields(snapshot: ["__typename": "PullRequestReviewComment", "viewerCanUpdate": viewerCanUpdate])
  }

  public static func makeGistComment(viewerCanUpdate: Bool) -> UpdatableFields {
    return UpdatableFields(snapshot: ["__typename": "GistComment", "viewerCanUpdate": viewerCanUpdate])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Check if the current viewer can update this object.
  public var viewerCanUpdate: Bool {
    get {
      return snapshot["viewerCanUpdate"]! as! Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "viewerCanUpdate")
    }
  }
}

public struct NodeFields: GraphQLFragment {
  public static let fragmentString =
    "fragment nodeFields on Node {" +
    "  __typename" +
    "  id" +
    "}"

  public static let possibleTypes = ["Organization", "Project", "ProjectColumn", "ProjectCard", "Issue", "User", "Repository", "CommitComment", "Reaction", "Commit", "Status", "StatusContext", "Tree", "Ref", "PullRequest", "Label", "Integration", "IssueComment", "PullRequestCommit", "ReviewRequest", "PullRequestReview", "PullRequestReviewComment", "PullRequestReviewThread", "ClosedEvent", "ReopenedEvent", "SubscribedEvent", "UnsubscribedEvent", "MergedEvent", "ReferencedEvent", "AssignedEvent", "UnassignedEvent", "LabeledEvent", "UnlabeledEvent", "MilestonedEvent", "DemilestonedEvent", "RenamedTitleEvent", "LockedEvent", "UnlockedEvent", "DeployedEvent", "Deployment", "DeploymentStatus", "HeadRefDeletedEvent", "HeadRefRestoredEvent", "HeadRefForcePushedEvent", "BaseRefForcePushedEvent", "ReviewRequestedEvent", "ReviewRequestRemovedEvent", "ReviewDismissedEvent", "Language", "Milestone", "ProtectedBranch", "PushAllowance", "Team", "ReviewDismissalAllowance", "Release", "ReleaseAsset", "RepositoryTopic", "Topic", "Gist", "OrganizationIdentityProvider", "ExternalIdentity", "Blob", "Bot", "GistComment", "RepositoryInvitation", "Tag"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("id", type: .nonNull(.scalar(GraphQLID.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeOrganization(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Organization", "id": id])
  }

  public static func makeProject(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Project", "id": id])
  }

  public static func makeProjectColumn(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ProjectColumn", "id": id])
  }

  public static func makeProjectCard(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ProjectCard", "id": id])
  }

  public static func makeIssue(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Issue", "id": id])
  }

  public static func makeUser(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "User", "id": id])
  }

  public static func makeRepository(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Repository", "id": id])
  }

  public static func makeCommitComment(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "CommitComment", "id": id])
  }

  public static func makeReaction(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Reaction", "id": id])
  }

  public static func makeCommit(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Commit", "id": id])
  }

  public static func makeStatus(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Status", "id": id])
  }

  public static func makeStatusContext(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "StatusContext", "id": id])
  }

  public static func makeTree(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Tree", "id": id])
  }

  public static func makeRef(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Ref", "id": id])
  }

  public static func makePullRequest(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "PullRequest", "id": id])
  }

  public static func makeLabel(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Label", "id": id])
  }

  public static func makeIntegration(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Integration", "id": id])
  }

  public static func makeIssueComment(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "IssueComment", "id": id])
  }

  public static func makePullRequestCommit(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "PullRequestCommit", "id": id])
  }

  public static func makeReviewRequest(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ReviewRequest", "id": id])
  }

  public static func makePullRequestReview(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "PullRequestReview", "id": id])
  }

  public static func makePullRequestReviewComment(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "PullRequestReviewComment", "id": id])
  }

  public static func makePullRequestReviewThread(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "PullRequestReviewThread", "id": id])
  }

  public static func makeClosedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ClosedEvent", "id": id])
  }

  public static func makeReopenedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ReopenedEvent", "id": id])
  }

  public static func makeSubscribedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "SubscribedEvent", "id": id])
  }

  public static func makeUnsubscribedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "UnsubscribedEvent", "id": id])
  }

  public static func makeMergedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "MergedEvent", "id": id])
  }

  public static func makeReferencedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ReferencedEvent", "id": id])
  }

  public static func makeAssignedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "AssignedEvent", "id": id])
  }

  public static func makeUnassignedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "UnassignedEvent", "id": id])
  }

  public static func makeLabeledEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "LabeledEvent", "id": id])
  }

  public static func makeUnlabeledEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "UnlabeledEvent", "id": id])
  }

  public static func makeMilestonedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "MilestonedEvent", "id": id])
  }

  public static func makeDemilestonedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "DemilestonedEvent", "id": id])
  }

  public static func makeRenamedTitleEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "RenamedTitleEvent", "id": id])
  }

  public static func makeLockedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "LockedEvent", "id": id])
  }

  public static func makeUnlockedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "UnlockedEvent", "id": id])
  }

  public static func makeDeployedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "DeployedEvent", "id": id])
  }

  public static func makeDeployment(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Deployment", "id": id])
  }

  public static func makeDeploymentStatus(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "DeploymentStatus", "id": id])
  }

  public static func makeHeadRefDeletedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "HeadRefDeletedEvent", "id": id])
  }

  public static func makeHeadRefRestoredEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "HeadRefRestoredEvent", "id": id])
  }

  public static func makeHeadRefForcePushedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "HeadRefForcePushedEvent", "id": id])
  }

  public static func makeBaseRefForcePushedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "BaseRefForcePushedEvent", "id": id])
  }

  public static func makeReviewRequestedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ReviewRequestedEvent", "id": id])
  }

  public static func makeReviewRequestRemovedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ReviewRequestRemovedEvent", "id": id])
  }

  public static func makeReviewDismissedEvent(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ReviewDismissedEvent", "id": id])
  }

  public static func makeLanguage(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Language", "id": id])
  }

  public static func makeMilestone(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Milestone", "id": id])
  }

  public static func makeProtectedBranch(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ProtectedBranch", "id": id])
  }

  public static func makePushAllowance(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "PushAllowance", "id": id])
  }

  public static func makeTeam(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Team", "id": id])
  }

  public static func makeReviewDismissalAllowance(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ReviewDismissalAllowance", "id": id])
  }

  public static func makeRelease(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Release", "id": id])
  }

  public static func makeReleaseAsset(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ReleaseAsset", "id": id])
  }

  public static func makeRepositoryTopic(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "RepositoryTopic", "id": id])
  }

  public static func makeTopic(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Topic", "id": id])
  }

  public static func makeGist(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Gist", "id": id])
  }

  public static func makeOrganizationIdentityProvider(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "OrganizationIdentityProvider", "id": id])
  }

  public static func makeExternalIdentity(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "ExternalIdentity", "id": id])
  }

  public static func makeBlob(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Blob", "id": id])
  }

  public static func makeBot(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Bot", "id": id])
  }

  public static func makeGistComment(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "GistComment", "id": id])
  }

  public static func makeRepositoryInvitation(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "RepositoryInvitation", "id": id])
  }

  public static func makeTag(id: GraphQLID) -> NodeFields {
    return NodeFields(snapshot: ["__typename": "Tag", "id": id])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// ID of the object.
  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ReferencedRepositoryFields: GraphQLFragment {
  public static let fragmentString =
    "fragment referencedRepositoryFields on RepositoryInfo {" +
    "  __typename" +
    "  name" +
    "  owner {" +
    "    __typename" +
    "    login" +
    "  }" +
    "}"

  public static let possibleTypes = ["Repository", "RepositoryInvitationRepository"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("name", type: .nonNull(.scalar(String.self))),
    Field("owner", type: .nonNull(.object(ReferencedRepositoryFields.Owner.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeRepository(name: String, owner: Owner) -> ReferencedRepositoryFields {
    return ReferencedRepositoryFields(snapshot: ["__typename": "Repository", "name": name, "owner": owner])
  }

  public static func makeRepositoryInvitationRepository(name: String, owner: Owner) -> ReferencedRepositoryFields {
    return ReferencedRepositoryFields(snapshot: ["__typename": "RepositoryInvitationRepository", "name": name, "owner": owner])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the repository.
  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(snapshot: snapshot["owner"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "owner")
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes = ["Organization", "User"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("login", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public static func makeOrganization(login: String) -> Owner {
      return Owner(snapshot: ["__typename": "Organization", "login": login])
    }

    public static func makeUser(login: String) -> Owner {
      return Owner(snapshot: ["__typename": "User", "login": login])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The username used to login.
    public var login: String {
      get {
        return snapshot["login"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "login")
      }
    }
  }
}